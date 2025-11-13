# =====================================================================
#  Bayesian Optimal Allocation Application
#  Author: Steven Edwards
#  Institution: Centre of Geographic Sciences / Nova Scotia Community College
#  Description: Server module for uploading previous allocation outputs
#               (e.g., returning users resuming or evaluating workflows)
#  Version: v2025.11.06
#  License: MIT License
#  Repository: https://github.com/SurveyPlanningAllocCostingAndEval/optimal_allocation
#  Notes:
#   - Supports loading historical allocation files into the app.
#   - Enables comparison, audit, or continuation of prior survey runs.
# =====================================================================

upload_previous_allocations_server <- function(rv, input) {
  observeEvent(input$prev_alloc_file, {
    req(input$prev_alloc_file)
    
    tryCatch({
      message("Loading previous allocations...")
      
      ext <- tolower(tools::file_ext(input$prev_alloc_file$name))
      df <- switch(ext,
                   "xlsx" = readxl::read_excel(input$prev_alloc_file$datapath),
                   "xls"  = readxl::read_excel(input$prev_alloc_file$datapath),
                   "csv"  = readr::read_csv(input$prev_alloc_file$datapath, show_col_types = FALSE),
                   "txt"  = readr::read_csv(input$prev_alloc_file$datapath, show_col_types = FALSE),
                   stop("Unsupported file type: ", ext)
      )
      
      rv$day1_alloc <- df
      showNotification("Previous allocations loaded successfully.", type = "message")
    },
    error = function(e) {
      showNotification(paste("Error loading previous allocations:", e$message), type = "error")
    })
  }, ignoreInit = TRUE)
}
