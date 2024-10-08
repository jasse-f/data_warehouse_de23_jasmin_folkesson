import dlt
import pandas as pd
from pathlib import Path
import os

@dlt.resource(write_disposition="append")
def load_csv_resource(file_path: str, **kwargs):
    df = pd.read_csv(file_path, **kwargs)
    yield df.to_dict(orient="records")

if __name__ == "__main__":
    working_directory = Path(__file__).parent.parent
    os.chdir(working_directory)

    pipeline = dlt.pipeline(
        pipeline_name='load_snowflake_ifood',
        destination='snowflake',
        dataset_name='staging',
    )

    data = list(
        load_csv_resource(
        working_directory / "data" / "iFood.csv", encoding = "latin1"
    ))

    # print the data yielded from resource
    print(data)
    print('---------------------------------------------------------------------------------------')

    # run the pipeline with your parameters
    load_info = pipeline.run(data, table_name="iFood")

    # pretty print the information on data that was loaded
    print(load_info)
