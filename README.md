# mot-data-analysis

This was build for my Practical Data Analysis Module (QAC020N221A).

## Description

This is meant to simulate and represent the data collective data of MOT tests.

This is **simulated** data.

## Prerequisites

- Python 3.10 + installed
- sqlite3

## Steps

> [!NOTE]
> If on Windows use the `python` command instead of `python3`.

### 1. Check Python version

```shell
python3 -V
```

### 2. Download & update `pip`

```shell
python3 -m ensurepip --upgrade
```

### 3. Clone this repository

```shell
git clone git@github.com:gabrielg2020/mot-data-analysis.git && cd mot-data-analysis
```

### 4. Check `sqlite3` version

> [!NOTE]
> If this errors, you need to install sqlite3.

```shell
sqlite3 -version
```

### 5. Setup Python virtual environment

```shell
python3 -m venv .venv
```

#### Source virtual envrionment

MacOS & Linux

```shell
source .venv/bin/activate
```

Windows

```shell
C:\path\to\repo\.venv\Scripts\activate.bat
```

### 6. Install required packages

```shell
pip install -r requirements.txt
```

## How to run notebooks

### 1. Install `ipykernel`

While within the virtual enviroment.

```bash
pip install ipykernel
```

### 2. Open IDE and select kernel

This should be somthing you are prompted to do, select `Python .venv`, it should be the same version as your python install.

### 3. Run notebooks in order

#### `01_data_generation.ipynb`

- Generates synthetic data
- Create visualisation graph or data distribution
- Adds data to SQLite database

#### `02_`

#### `03_`
