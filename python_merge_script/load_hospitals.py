import os
import pandas as pd
from sqlalchemy import create_engine

# 1. Locate the directory containing the CSV files
# Adjust this path if your script is in the parent folder and CSVs are in a subfolder (e.g., './csv_files/')
CSV_FOLDER = "merge_raw_data/raw_data"  # Update this to the subfolder name if needed (e.g., './hospital_data/')

# 2. Database connection settings
DB_USER = "anshchellani"
DB_PASSWORD = ""
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "hospital_costs_db"

engine = create_engine(
    f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

# 3. Find all CSV files in that folder
csv_files = sorted(
    [
        os.path.join(CSV_FOLDER, f)
        for f in os.listdir(CSV_FOLDER)
        if f.endswith(".csv")
    ]
)
print(f"Found {len(csv_files)} datasets to process.")

# 4. Loop through, clean columns, inject year, and stream into Postgres
for file_path in csv_files:
  file_name = os.path.basename(file_path)
  year_str = "".join(filter(str.isdigit, file_name))
  report_year = int(year_str[:4]) if year_str else None

  print(f"Processing {file_name} for reporting year {report_year}...")

  chunk_size = 10000
  first_chunk = True

  for chunk in pd.read_csv(file_path, chunksize=chunk_size, low_memory=False):
    # Standardize column names for PostgreSQL
    chunk.columns = (
        chunk.columns.str.strip()
        .str.lower()
        .str.replace(" ", "_", regex=False)
        .str.replace("-", "_", regex=False)
        .str.replace("(", "", regex=False)
        .str.replace(")", "", regex=False)
    )

    # Inject reporting year
    chunk["report_year"] = report_year

    # Append to master table
    chunk.to_sql(
        "hospital_costs_master",
        con=engine,
        if_exists="append",
        index=False,
        method="multi",
    )

    if first_chunk:
      print(f" -> Successfully loaded first chunk of {file_name}")
      first_chunk = False

print(
    "\nAll datasets successfully consolidated into PostgreSQL table:"
    " hospital_costs_master!"
)