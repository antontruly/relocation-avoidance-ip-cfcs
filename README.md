## Foreword

This repo allows one to prepare the data for regression analysis of country-level innovation indicators together with their bilateral tax policy. A separate program (covered) estimates the regressions. We use a controlled foreign corporation (CFC) rule to model the policy. Under this objective, I wrote a M.Sc. in Economics thesis. In addition to the code, this repo includes the data fetched without API calls and direct HTTP requests.

## This Repo

### Data Preparation

#### Python Jupyter
We wrangle, fetch, and merge the data in a *Jupyter Notebook*, fully written in *Python*. In doing so, we apply a pipeline reasoning, so that the ultimate dataset () merges the outputs of previous operations on the data sources involved.


#### Google BigQuery
To fetch patent data, we SQL query *Google Patents* dataset. The query is included in the *Jupyter* notebook. The credentials are provided as the brave-aviary *json* but are a mock example. To execute the code, therefore, one should refer to the *BigQuery* tutorial to obtain credentials as a *json*.


### Regression Analysis
Having created, we proceed to estimate specifications put forward in the thesis. To do so, we program this script in *R*.


### Visuals

Each visualization presented in the thesis has a dedicated script, either in *R* or as a *Python* *Jupyter*. The script names give a clue on which visual obtains upon the script's execution.

## Further Work
Absent the end-user story for the repo, refactoring, testing, and deployment pipeline are not implemented.
