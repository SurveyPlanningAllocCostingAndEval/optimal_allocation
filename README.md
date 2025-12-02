[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXXXX)

<p align="center">

<img src="www/space_banner.png" alt="SPACE Optimal Allocation Calculator Banner" width="100%"/>

</p>

### A Complete Bayesian Workflow for Iterative, Multi‑Day Survey Planning

------------------------------------------------------------------------

# 📘 Introduction

The **SPACE Optimal Allocation Calculator** is a fully modular, research‑grade tool designed to support **multi‑day archaeological survey planning** using a **Bayesian updating framework**.

This repository contains the **complete local version** of the Shiny application:

-   full UI (tab-based, guided workflow)
-   complete Bayesian allocation engine
-   iterative posterior update workflow
-   daily update + next-day allocation generation
-   all scripts, helpers, and assets required to run the app offline

Running the app locally ensures that all scripts, modules, and functions load correctly, that file paths are resolved correctly, and that allocation logic is identical to the development version.

------------------------------------------------------------------------

# 📥 Cloning or Downloading the Repository

To run the application, users must obtain the full repository, including all subdirectories.

## Option A — Clone via Git (recommended)

``` bash
git clone https://github.com/SurveyPlanningAllocCostingAndEval/optimal_allocation.git
```

## Option B — Download ZIP

1.  Go to the repository page
2.  Click **Code → Download ZIP**
3.  Extract the contents
4.  Ensure the folder structure matches:

``` text
optimal_allocation/
├── app.R
├── scripts/
├── ui/
├── server/
├── www/
├── data/
├── LICENSE
└── README.md
```

------------------------------------------------------------------------

# 🛠 Running the App Locally

### 1. Open R or RStudio

Navigate to the repo folder:

``` r
setwd("path/to/optimal_allocation")
```

### 2. Install dependencies

``` r
install.packages(c(
  "shiny", "DT", "readxl", "readr", "dplyr", "tidyr"
))
```

### 3. Launch the application

``` r
shiny::runApp()
```

This loads the complete multi-step interface.

------------------------------------------------------------------------

# 📂 Required Input Format

To run the model successfully, the user must prepare two key input datasets.

## **1. Initial Input File**

A CSV or XLSX containing:

```         
unit_id
area
probability
sweep_width
visibility
```

The app validates all fields on load.

## **2. Field Results File**

Used for posterior computation after the initial allocations are generated and units have been surveyed accordingly. This dataset must include the following fields/columns:

```         
unit_id
L_walked
success
```

------------------------------------------------------------------------

# 🔄 Full Multi‑Day Workflow

## 🟦 **Initial Allocation**

1.  Upload initial input file
2.  Enter total effort (L)
3.  App:
    -   calculates detection probabilities
    -   applies Bayesian allocation
    -   filters invalid / negative units
    -   iterates until stable
4.  View:
    -   final allocation table
    -   dropped units
    -   diagnostics

------------------------------------------------------------------------

## 🟩 **Ingest Results**

1.  Upload field results
2.  App merges results with known units
3.  Validates completeness and format
4.  Computes hits/misses and observed success

------------------------------------------------------------------------

## 🟧 **Build Update Table**

App combines priors, results, and model parameters to produce:

-   updated inputs
-   evidence structure
-   likelihood terms

This becomes the basis for posterior computation.

------------------------------------------------------------------------

## 🟥 **Compute Posteriors**

App computes posterior probabilities for each unit:

-   Bayesian updating
-   normalized probabilities
-   next-day priors

------------------------------------------------------------------------

## 🟪 **Prepare Next Day Inputs**

Using: - original model data - updated posteriors - sweep-width and visibility values

Outputs: - full next-day input table (CSV/XLSX)

------------------------------------------------------------------------

## 🟫 **Run Next Allocation (Repeat)**

1.  Enter effort (L)
2.  Run allocation
3.  Export results
4.  Collect field data the next day
5.  Repeat as needed

------------------------------------------------------------------------

# 📜 License

Released under the **MIT License**. You are free to copy, modify, distribute, and use the software.

------------------------------------------------------------------------

# 📧 Contact

**Steven Edwards** 
Faculty, Geospatial Data Analytics 
Centre of Geographic Sciences / NSCC
