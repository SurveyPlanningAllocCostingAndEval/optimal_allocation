# =====================================================================
#  Bayesian Optimal Allocation Application
#  Author: Steven Edwards
#  Institution: Centre of Geographic Sciences / Nova Scotia Community College
#  Description: Defines the sidebar UI for the allocation workflow,
#               including file inputs, parameters, and action buttons
#  Version: v2025.11.06
#  License: MIT License
#  Repository: https://github.com/SurveyPlanningAllocCostingAndEval/optimal_allocation
#  Notes:
#   - Provides the main user controls for initial and next day workflows.
#   - Houses inputs for loading data, setting effort values, and
#     triggering allocation and posterior updates.
# =====================================================================

sidebar_ui <- function() {
  tabsetPanel(
    id = "workflow_tabs",
    type = "tabs",
    
    # ======================================================
    # Allocation Workflow Tab
    # ======================================================
    tabPanel(
      title = "Allocation Workflow",
      icon = icon("route"),
      br(),
      
      # Section Title
      div(
        style = "text-align:center; font-weight:700; font-size:16px; margin-bottom:4px;",
        "Generate Initial or Next-Day Survey Allocations"
      ),
      helpText(HTML(
        "See the <i>Instructions</i> tab for data formatting requirements and workflow guidelines."
      )),
      
      # Global Styling
      tags$style(HTML("
        .form-group.shiny-input-container { margin-bottom: 6px !important; }
        hr { display: none !important; }
        .btn { margin-bottom: 6px !important; width: 100%; }
        .help-block {
          margin-top: 2px !important;
          margin-bottom: 4px !important;
          font-size: 13px !important;
          color: #555 !important;
        }
      ")),
      
      # Step 1: Upload Inputs
      div(class = "step-label", "Step 1: Upload Inputs (Current Probabilities)"),
      fileInput(
        "pre_file",
        label = NULL,
        accept = c(".csv", ".txt", ".xlsx", ".xls")
      ),
      
      # Step 2: Assign Total Daily Effort
      div(class = "step-label", "Step 2: Assign Total Daily Effort (in meters)"),
      numericInput("total_effort", NULL, min = 0, value = NA, step = 100),
      
      # Step 3: Assign / Update Sweep Widths
      div(class = "step-label", "Step 3: Assign / Update Sweep Widths"),
      actionButton("update_sweep_btn", "Assign / Update Sweep Widths", class = "custom-btn"),
      
      # Step 4: Generate Allocations
      div(class = "step-label", "Step 4: Generate Allocations"),
      actionButton("run_day1", "Generate Allocations", class = "custom-btn"),
      
      # Step 5: Download Results
      div(class = "step-label", "Step 5: Download Allocations"),
      helpText("Once allocations are generated, use the buttons below to download your results."),
      downloadButton("dl_alloc_xlsx", "Download Allocations (.xlsx)", class = "custom-btn"),
      downloadButton("dl_alloc_zip", "Download Full Bundle (.zip)", class = "custom-btn")
    ),
    
    # ======================================================
    # Posterior Update Workflow Tab
    # ======================================================
    tabPanel(
      title = "Posterior Update Workflow",
      icon = icon("chart-line"),
      br(),
      
      div(
        style = "text-align:center; font-weight:700; font-size:16px; margin-bottom:4px;",
        "Update Probabilities Based on Field Results"
      ),
      helpText(HTML(
        "See the <i>Instructions</i> tab for data formatting requirements and workflow guidelines."
      )),
      
      # Step 1: Upload Inputs
      div(class = "step-label", "Step 1: Upload Inputs (Current Probabilities)"),
      fileInput("posterior_inputs_file", NULL, accept = c(".csv", ".txt", ".xlsx", ".xls")),
      
      # Step 2: Upload Field Results
      div(class = "step-label", "Step 2: Upload Field Results"),
      fileInput("results_file", NULL, accept = c(".csv", ".txt", ".xlsx", ".xls")),
      
      # Step 3: Compute Posteriors
      div(class = "step-label", "Step 3: Compute Posteriors"),
      actionButton("compute_post_btn", "Compute Posteriors", class = "custom-btn"),
      
      # Step 4: Download Updated Priors
      div(class = "step-label", "Step 4: Download Posteriors"),
      helpText("Click below to download the updated priors (posteriors) as a CSV file."),
      downloadButton("dl_post_csv", "Download Posteriors (.csv)", class = "custom-btn")
    )
  )
}
