## Foreword

This repo allows one to prepare the data for regression analysis of country-level innovation indicators together with their bilateral tax policy. A separate program (covered) estimates the regressions. We use a controlled foreign corporation (CFC) rule to model the policy. Under this objective, I wrote a master's thesis in Economics. In addition to the code, this repo includes the data fetched without API calls and direct HTTP requests.

## This Repo

### Data Preparation

#### Multiple Sources
We involve multuiple data sources. This repo includes the sources downloaded from the source web pages, such as the Organization for Economic Cooperation and Development (OECD) CFC rule data [CFC_11072021_121508.xlsx](CFC_11072021_121508.xlsx). Besides, we manually add the World Intellectual Property Organization (WIPO) Global Innovation Index (GII) per observation year stored in [wipo_gii](wipo_gii). 

#### Python Jupyter
We wrangle, fetch, and merge the data in a *Jupyter Notebook*, fully written in *Python*. In doing so, we apply a pipeline reasoning, so that the ultimate dataset [innovation_cfc_tax.csv](innovation_cfc_tax.csv) is a merge of the outputs of previous operations on the data sources involved. We rely on melting, pivoting, and *pandas* per se. Above all, this script takes out the variation in corporate tax not attributable to the CFC tax rate change.

#### Google BigQuery
To fetch patent data, we SQL query [*Google Patents*](https://cloud.google.com/blog/topics/public-datasets/google-patents-public-datasets-connecting-public-paid-and-private-patent-data) dataset. The query is included in the *Jupyter* notebook. The credentials are provided as the brave-aviary *json* but are a mock example. To execute the code, therefore, one should refer to the [*BigQuery* tutorial](https://cloud.google.com/bigquery/docs/authentication/service-account-file) to obtain credentials as a *json*.

### Regression Analysis
Having created [innovation_cfc_tax.csv](innovation_cfc_tax.csv), we proceed to estimate specifications put forward in the thesis. To do so, we wrap and estimate our models in [LM.R](LM.R). Before estimation, we balance the panel under each specification per year.

### Visuals

Each visualization presented in the thesis has a dedicated script, either in *R* or as a *Jupyter Notebook*. The script names give a clue on which visual obtains upon a script's execution. For example, [tax-visual.ipynb](tax-visual.ipynb) plots the corporate tax rate through observation years and the EU-28 countries. For each visual, a data set is generated using the data preparation *Jupyter Notebook*.

## Further Work
Absent the end-user story for the repo, refactoring, testing, and deployment pipeline are not implemented.
