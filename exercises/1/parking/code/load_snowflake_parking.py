import dlt
import requests
import json


def _get_ads(url_for_search):
    headers = {'accept': 'application/json'}
    response = requests.get(url_for_search, headers=headers)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode('utf8'))

@dlt.source
def load_snowflake_parking_source(api_secret_key: str = dlt.secrets.value):
    return load_snowflake_parking_resource(api_secret_key)


@dlt.resource(write_disposition="append")
def load_snowflake_parking_resource(
    api_secret_key: str = dlt.secrets.value
):
    url_for_search = f'https://openparking.stockholm.se/ltf-tolken/v1/pbuss/all?apiKey={api_secret_key}'

    for ad in _get_ads(url_for_search):
        yield ad
    # this is the test data for loading validation, delete it once you yield actual data


if __name__ == "__main__":
    # specify the pipeline name, destination and dataset name when configuring pipeline,
    # otherwise the defaults will be used that are derived from the current script name
    pipeline = dlt.pipeline(
        pipeline_name='load_snowflake_parking',
        destination='snowflake',
        dataset_name='load_snowflake_parking_data',
    )

    data = list(load_snowflake_parking_resource())

    print(data)

    # run the pipeline with your parameters
    # load_info = pipeline.run(source())

    # pretty print the information on data that was loaded
    # print(load_info)
