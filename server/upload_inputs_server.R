# =====================================================================
#  Bayesian Optimal Allocation Application
#  Author: Steven Edwards
#  Institution: Centre of Geographic Sciences / Nova Scotia Community College
#  Description: Server logic for uploading and validating daily input
#               datasets (CSV/XLSX) prior to running allocation
#  Version: v2025.11.06
#  License: MIT License
#  Repository: https://github.com/SurveyPlanningAllocCostingAndEval/optimal_allocation
#  Notes:
#   - Handles initial input data upload, schema checks, and feedback.
# =====================================================================

upload_inputs_server <- function(rv, output_dir_reactive, input) {
  observeEvent(input$pre_file, {
    req(input$pre_file)
    tryCatch({
      message("Loading inputs for allocation workflow...")
      
      # Read file based on extension
      ext <- tolower(tools::file_ext(input$pre_file$name))
      df_raw <- switch(
        ext,
        "xlsx" = readxl::read_excel(input$pre_file$datapath),
        "xls"  = readxl::read_excel(input$pre_file$datapath),
        "csv"  = readr::read_csv(input$pre_file$datapath, show_col_types = FALSE),
        "txt"  = readr::read_csv(input$pre_file$datapath, show_col_types = FALSE),
        stop("Unsupported file type: ", ext)
      )
      
      # Normalize and standardize column names
      df <- df_raw
      names(df) <- trimws(tolower(names(df)))
      names(df) <- gsub("\\s+", "_", names(df)) # replace spaces with underscores
      
      # Backward compatibility for legacy columns
      rename_map <- c(
        "polygons"      = "unit_id",
        "polygon"       = "unit_id",
        "area_(m2)"     = "area",
        "area_m2"       = "area",
        "probability"   = "probability",
        "prior"         = "probability",
        "sweep_width"   = "sweep_width",
        "sweepwidth"    = "sweep_width",
        "visibility"    = "visibility"
      )
      
      for (old in names(rename_map)) {
        new <- rename_map[[old]]
        if (old %in% names(df) && !(new %in% names(df))) {
          names(df)[names(df) == old] <- new
        }
      }
      
      # Validate required columns
      required <- c("unit_id", "area", "probability", "sweep_width")
      missing <- setdiff(required, names(df))
      if (length(missing) > 0) {
        stop("Missing required column(s): ", paste(missing, collapse = ", "))
      }
      
      # Coerce types safely
      df <- df %>%
        dplyr::mutate(
          unit_id     = as.character(unit_id),
          area        = suppressWarnings(as.numeric(area)),
          probability = suppressWarnings(as.numeric(probability)),
          sweep_width = suppressWarnings(as.numeric(sweep_width)),
          visibility  = if ("visibility" %in% names(df)) as.character(visibility) else NA_character_
        )
      
      # Assign to reactive values
      rv$df_pre_in <- df
      
      message("Allocation inputs loaded and standardized successfully.")
      showNotification("Inputs for allocation loaded successfully.", type = "message")
      
    }, error = function(e) {
      showNotification(paste("Error loading allocation inputs:", e$message), type = "error")
      message("Error loading allocation inputs: ", e$message)
    })
  }, ignoreInit = TRUE)
}
