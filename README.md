# odtp-unog-digitalrecordings-scrapper

Add here your badges:
[![Launch in your ODTP](https://img.shields.io/badge/Launch%20in%20your-ODTP-blue?logo=launch)](http://localhost:8501/launch-component)
[![Compatible with ODTP v0.5.x](https://img.shields.io/badge/Compatible%20with-ODTP%20v0.5.0-green)]("")

> [!NOTE]  
> This repository makes use of submodules. Therefore, when cloning it you need to include them.
>  
> `git clone --recurse-submodules https://github.com/odtp-org/odtp-unog-digitalrecordings-scrapper`

This tool scrapes the [UNOG Digital Recordings](https://conf.unog.ch/digitalrecordings/en) page to extract all available meetings and creates a JSON Lines file with all the information.

## Table of Contents

- [Tools Information](#tools-information)
- [How to add this component to your ODTP instance](#how-to-add-this-component-to-your-odtp-instance)
- [Data sheet](#data-sheet)
    - [Parameters](#parameters)
    - [Secrets](#secrets)
    - [Input Files](#input-files)
    - [Output Files](#output-files)
- [Tutorial](#tutorial)
    - [How to run this component as docker](#how-to-run-this-component-as-docker)
    - [Development Mode](#development-mode)
    - [Running with GPU](#running-with-gpu)
    - [Running in API Mode](#running-in-api-mode)
- [Credits and References](#credits-and-references)

## Tools Information

No external tool is used. The script is contained in app.py

## How to add this component to your ODTP instance

In order to add this component to your ODTP CLI, you can use. If you want to use the component directly, please refer to the docker section. 

``` bash
odtp new odtp-component-entry \
--name odtp-unog-digitalrecordings-scrapper \
--component-version v0.0.1 \
--repository https://github.com/odtp-org/odtp-unog-digitalrecordings-scrapper 
```

## Data sheet

### Parameters

| Parameter    | Description                                      | Type   | Required | Default Value    | Possible Values | Constraints |
|--------------|--------------------------------------------------|--------|----------|------------------|-----------------|-------------|
| start_date   | Start date in DD/MM/YYYY format                  | string | Yes      | 01/07/2014       | N/A             | N/A         |
| end_date     | End date in DD/MM/YYYY format                    | string | Yes      | N/A              | N/A             | N/A         |
| output_file  | Output JSONL file                                | string | Yes      | meetings.jsonl   | N/A             | N/A         |
| organization | Organization code                                | string | No       | UNHRC            | N/A             | N/A         |
| meeting_type | Type of meeting                                  | string | No       | ""               | N/A             | N/A         |
| keywords     | Keywords for filtering                           | string | No       | ""               | N/A             | N/A         |

### Secrets

No secrets

### Input Files

No inputs files

### Output Files

| File/Folder | Description | File Type | Contents | Usage |
| --- | --- | --- | --- | --- |
| XXXX.jsonl | JSON Lines file containing the fetched UNHRC meetings data | JSONL | Meeting data in JSON Lines format | Defined by the OUTPUT_FILE parameter |

## Tutorial

### How to run this component as docker

Build the dockerfile.

``` bash
docker build -t odtp-unog-digitalrecordings-scrapper .
```

Run the following command. Mount the correct volumes for input/output/logs folders.

``` bash
docker run -it --rm \
-v {PATH_TO_YOUR_INPUT_VOLUME}:/odtp/odtp-input \
-v {PATH_TO_YOUR_OUTPUT_VOLUME}:/odtp/odtp-output \
-v {PATH_TO_YOUR_LOGS_VOLUME}:/odtp/odtp-logs \
--env-file .env odtp-unog-digitalrecordings-scrapper
```

### Development Mode

To run the component in development mode, mount the app folder inside the container:

``` bash
docker run -it --rm \
-v {PATH_TO_YOUR_INPUT_VOLUME}:/odtp/odtp-input \
-v {PATH_TO_YOUR_OUTPUT_VOLUME}:/odtp/odtp-output \
-v {PATH_TO_YOUR_LOGS_VOLUME}:/odtp/odtp-logs \
-v {PATH_TO_YOUR_APP_FOLDER}:/odtp/app \
--env-file .env odtp-unog-digitalrecordings-scrapper
```

### Running in API Mode

To run the component in API mode and expose a port, use the following command:

``` bash
docker run -it --rm \
-v {PATH_TO_YOUR_INPUT_VOLUME}:/odtp/odtp-input \
-v {PATH_TO_YOUR_OUTPUT_VOLUME}:/odtp/odtp-output \
-v {PATH_TO_YOUR_LOGS_VOLUME}:/odtp/odtp-logs \
-p {HOST_PORT}:{CONTAINER_PORT} \
--env-file .env odtp-unog-digitalrecordings-scrapper
```

## Credits and references

SDSC

This component has been created using the `odtp-component-template` `v0.5.0`. 


docker run -it --rm --env-file .env --entrypoint bash odtp-unog-digitalrecordings-scrapper