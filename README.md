<p align="center">
  <img src="www/space_banner.png" width="100%" alt="SPACE Optimal Allocation Calculator Banner">
</p>

# SPACE — Optimal Allocation Calculator

**SPACE (Survey Planning, Allocation, Costing and Evaluation)** is a modular, research-grade decision-support tool for iterative survey planning.  
It implements a fully automated **Bayesian optimal allocation pipeline** that updates daily based on field results, posterior probabilities, and next-day predictive inputs.

This repository contains the complete codebase for the **Shiny application** used to generate, update, and review survey effort allocations across multiple field days.

---

## 🚀 Key Features

### Bayesian Allocation Engine
- Computes optimal survey effort distributions across spatial units  
- Handles prior probabilities, sweep widths, and likelihood structures  
- Supports iterative multi-day field survey workflows  

### Iterative Posterior Updates
- Ingest Day 1 field results  
- Compute updated posterior probabilities  
- Generate Day 2 inputs  
- Repeat for additional survey days  

### Automated Filtering & Rerun Logic
- Detects and removes units with negative allocations  
- Automatically recalculates until a stable, valid allocation is reached  

### Clean, Modular Architecture
Core logic is split into dedicated scripts (00–08) for:
- Setup  
- Core allocation math  
- Filtering and reruns  
- Results ingestion  
- Update table creation  
- Posterior computation  
- Next-day input preparation  
- Final next-day allocation  

### Shiny Front-End
- Intuitive UI for uploading inputs  
- Interactive DataTables for all outputs  
- Downloadable CSV/XLSX files  
- Fully reproducible allocation workflow  

---

## 📁 Repository Structure

```text
optimal_allocation/
├── app.R                      # Main Shiny entry point
├── scripts/                   # Core computation modules
├── ui/                        # UI components
├── server/                    # Server-side workflow modules
├── www/                       # Assets (banner, CSS, images)
│     └── space_banner.png
├── data/                      # Example input files (optional)
├── LICENSE                    # MIT license
└── README.md                  # Project documentation
```

---

## 🛠 Installation & Running the App

### 1. Install required R packages

```r
install.packages(c(
  "shiny", "DT", "readxl", "readr", "dplyr", "tidyr"
))
```

### 2. Run the application

```r
shiny::runApp()
```

Or specify a folder explicitly:

```r
shiny::runApp("path/to/optimal_allocation")
```

---

## 📘 Workflow Overview

### Day 1 Workflow
1. Upload initial input table  
2. Enter total effort (L)  
3. Run allocation  
4. Review:
   - Final allocations  
   - Dropped/filtered units  

### Day 2+ Iterative Workflow
1. Upload field results from previous day  
2. Ingest and clean results  
3. Build the update table  
4. Compute posteriors  
5. Prepare next-day inputs  
6. Run next-day allocation  

All steps optionally generate CSV/XLSX files for reproducibility and external review.

---

## 🧪 Example Use Cases

- Archaeological survey planning  
- Ecological search optimization  
- Modeling detection workflows  
- Adaptive fieldwork decision-support  
- Resource distribution planning  
- Multi-day survey design  

---

## 📜 License

Released under the **MIT License** — see `LICENSE` for details.  
You are free to use, modify, distribute, and integrate this tool into academic or applied projects.

---

## 🤝 Contributions

Contributions, issue reports, and feature suggestions are welcome.  
If you'd like to extend the SPACE toolkit—UI improvements, algorithmic enhancements, or interoperability features—please submit a pull request or open an issue.

---

## 📧 Contact

For academic, research, or collaboration inquiries:

**Steven J. Edwards**  
Professor, Geospatial Data Analytics  
Centre of Geographic Sciences / Nova Scotia Community College (NSCC)
