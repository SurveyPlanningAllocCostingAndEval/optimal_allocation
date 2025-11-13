# =====================================================================
#  Bayesian Optimal Allocation Application
#  Author: Steven Edwards
#  Institution: Centre of Geographic Sciences / Nova Scotia Community College
#  Description: Shiny-safe setup utilities and helper functions for
#               workspace configuration (no hard-coded paths or I/O)
#  Version: v2025.11.06
#  License: MIT License
#  Repository: https://github.com/SurveyPlanningAllocCostingAndEval/optimal_allocation
#  Notes:
#   - Initializes app environment variables, directory paths, and global options.
#   - Provides shared utility functions used by other modules.
# =====================================================================

# Load required packages (do not install)
suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
  library(readxl)
  library(writexl)
  library(purrr)
  library(rlang)
})

# ============================================================
# Global options 
# ============================================================
options(
  scipen = 999,            
  stringsAsFactors = FALSE
)

# ============================================================
# Helpers for input validation and data cleaning
# ============================================================

# Normalize and standardize column names 
std_names <- function(df) {
  if (is.null(df)) return(df)
  
  # Normalize case and trim whitespace
  names(df) <- tolower(trimws(names(df)))
  
  # Define mapping of known variants to standardized schema
  rename_map <- c(
    "polygon" = "unit_id",
    "polygons" = "unit_id",
    "unit id" = "unit_id",
    "area (m2)" = "area",
    "area_m2" = "area",
    "area (sq m)" = "area",
    "prior probability" = "probability",
    "probability" = "probability",
    "prior" = "probability",
    "sweep width" = "sweep_width",
    "sweepwidth" = "sweep_width",
    "sweep_width (m)" = "sweep_width",
    "visibility class" = "visibility",
    "visibility_class" = "visibility"
  )
  
  # Apply mapping wherever matches exist
  for (old_name in names(rename_map)) {
    if (old_name %in% names(df)) {
      names(df)[names(df) == old_name] <- rename_map[[old_name]]
    }
  }
  
  # Coerce ID column to character if present
  if ("unit_id" %in% names(df)) {
    df[["unit_id"]] <- as.character(df[["unit_id"]])
  }
  
  df
}

# ============================================================
# Coerce core numeric columns if present; leaves others untouched.
# ============================================================

coerce_core_cols <- function(df) {
  num_cols <- intersect(c("area", "probability", "sweep_width", "l"), names(df))
  for (nm in num_cols) {
    df[[nm]] <- suppressWarnings(as.numeric(df[[nm]]))
  }
  df
}

# ============================================================
# Simple required-column checker (useful in server & function layers)
# ============================================================
check_required_cols <- function(df, required) {
  missing <- setdiff(required, names(df))
  if (length(missing)) {
    stop("Missing required column(s): ", paste(missing, collapse = ", "))
  }
  invisible(TRUE)
}

# ============================================================
# Value range helper (clamp function)
# ============================================================

clamp01 <- function(x) pmin(pmax(x, 0), 1)

# ============================================================
# Output directory handling
# ============================================================

# Resolve a user-chosen output directory. If NULL/empty, return NULL (no writing).
resolve_output_dir <- function(output_dir = NULL) {
  if (is.null(output_dir) || !nzchar(output_dir)) return(NULL)
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
  }
  normalizePath(output_dir, winslash = "/", mustWork = FALSE)
}
