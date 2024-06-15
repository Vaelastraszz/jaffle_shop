# Jaffle Shop Analysis with BigQuery and dbt Cloud

This repository contains the analysis of the Jaffle Shop dataset using BigQuery and dbt Cloud. The project aims to demonstrate data transformation, modeling, and analysis techniques using modern data stack tools.

## Table of Contents

- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Tools and Technologies](#tools-and-technologies)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Data Models](#data-models)
- [Analyses](#analyses)
- [Tests and Documentation](#tests-and-documentation)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The purpose of this project is to showcase how to use dbt (data build tool) with BigQuery for transforming and modeling raw data into clean, analysis-ready datasets. The Jaffle Shop dataset is a fictional e-commerce dataset used for training and educational purposes.

## Dataset

The Jaffle Shop dataset includes the following tables:
- `raw_customers`: Customer information.
- `raw_orders`: Order details.
- `raw_payments`: Payment transactions.

## Tools and Technologies

- **BigQuery**: A fully-managed, serverless data warehouse that enables scalable analysis over petabytes of data.
- **dbt Cloud**: A cloud-based platform for managing dbt projects, enabling data transformations, testing, and documentation.

## Project Structure

```plaintext
.
├── analyses          # SQL files for ad-hoc analyses
├── data              # Sample data files (if applicable)
├── models            # dbt models
│   ├── staging       # Staging models
│   └── marts         # Data marts models
├── snapshots         # dbt snapshots
├── tests             # Data tests
├── macros            # Custom macros
├── seeds             # Seed files
├── logs              # dbt logs
├── target            # dbt compiled SQL files and results
├── .gitignore        # Git ignore file
├── dbt_project.yml   # dbt project configuration
└── README.md         # Project README file
```
## Setup Instructions

To set up this project on your local machine, follow these steps:

### Prerequisites

- **Google Cloud Account**: You need a Google Cloud account to use BigQuery.
- **dbt Cloud Account**: Sign up for a free account on [dbt Cloud](https://cloud.getdbt.com/signup/).

### Steps

1. **Clone the repository**:

    ```bash
    git clone https://github.com/yourusername/jaffle-shop-analysis.git
    cd jaffle-shop-analysis
    ```

2. **Set up a BigQuery project**:

    - Create a new project in the [Google Cloud Console](https://console.cloud.google.com/).
    - Enable the BigQuery API for your project.
    - Note down the project ID.

3. **Create a BigQuery dataset**:

    - Go to the BigQuery Console.
    - Create a new dataset (e.g., `jaffle_shop`).

4. **Configure dbt Cloud**:

    - Sign up for [dbt Cloud](https://cloud.getdbt.com/signup/).
    - Create a new project in dbt Cloud.
    - Connect the project to your GitHub repository.
    - Set up a connection to your BigQuery project by entering your project ID and authentication details.

5. **Install dbt**:

    If you haven't installed dbt locally, you can do so with pip:

    ```bash
    pip install dbt-bigquery
    ```

6. **Configure dbt profiles**:

    - Create a `profiles.yml` file in your `.dbt` directory (usually located at `~/.dbt/`).
    - Add the following configuration, replacing the placeholders with your actual details:

    ```yaml
    jaffle_shop:
      target: dev
      outputs:
        dev:
          type: bigquery
          method: oauth
          project: your-bigquery-project-id
          dataset: jaffle_shop
          threads: 1
          timeout_seconds: 300
          location: US
    ```

7. **Load sample data** (optional):

    If you have sample data files, you can load them into your BigQuery dataset using the BigQuery console or CLI.

8. **Run dbt commands**:

    - Run the models:

        ```bash
        dbt run
        ```

    - Test the models:

        ```bash
        dbt test
        ```

    - Generate documentation:

        ```bash
        dbt docs generate
        dbt docs serve
        ```


