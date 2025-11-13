# =====================================================================
#  Bayesian Optimal Allocation Application
#  Author: Steven Edwards
#  Institution: Centre of Geographic Sciences / Nova Scotia Community College
#  Description: Defines the header layout and top-level visual identity
#               for the SPACE Shiny application
#  Version: v2025.11.06
#  License: MIT License
#  Repository: https://github.com/SurveyPlanningAllocCostingAndEval/optimal_allocation
#  Notes:
#   - Controls branding, title bar styling, and app-wide header elements.
#   - Provides a consistent look-and-feel across workflow tabs.
# =====================================================================

header_ui <- function() {
  tagList(
    tags$head(
      tags$style(HTML("
        /* Full-width blue header bar with subtle drop shadow */
        .header-bar {
          background-color: #1E3765;
          color: white;
          width: 100%;
          padding: 12px 30px;
          display: flex;
          align-items: center;
          justify-content: space-between;
          box-sizing: border-box;
          box-shadow: 0 3px 12px rgba(0,0,0,0.18);
        }

        .header-title {
          font-family: 'Impact','Arial Black',sans-serif;
          font-size: 36px;
          font-weight: 500;
          letter-spacing: 1px;
          margin: 0;
        }

        .header-subtitle {
          font-size: 22px;
          font-weight: 400;
          margin: 0;
        }

        /* Modern action buttons with gradient + hover glow */
        .custom-btn {
          background: linear-gradient(180deg, #1E3765 0%, #162a4e 100%) !important;
          color: white !important;
          border: none !important;
          width: 100%;
          margin-top: 8px;
          margin-bottom: 8px;
          height: 42px;
          font-weight: 600;
          font-size: 15px;
          border-radius: 6px;
          box-shadow: 0 1px 2px rgba(0,0,0,0.1);
          transition: all 0.25s ease-in-out;
        }

        .custom-btn:hover {
          transform: translateY(-1px);
          background: linear-gradient(180deg, #2A4D8F 0%, #203d73 100%) !important;
          box-shadow: 0 3px 10px rgba(30,55,101,0.35); /* ✨ soft blue glow */
        }

        .step-label {
          color: #1E3765;
          font-weight: 700;
          margin-top: 18px;
          margin-bottom: 6px;
          font-size: 14px;
          text-transform: uppercase;
          letter-spacing: 0.5px;
          transition: all 0.2s ease-in-out;
        }

        /* ✨ Hover effect for step labels */
        .step-label:hover {
          color: #2A4D8F;
          transform: translateX(2px);
          cursor: default;
        }

        .instructions {
          line-height:1.6;
          font-size:16px;
          color:#222;
          max-width:900px;
        }

        .highlight {
          font-weight:600;
          color:#1E3765;
        }

        /* ---- New sidebar styling ---- */
        .sidebar-panel {
          background-color: #f7f8fa;
          border-radius: 10px;
          padding: 20px;
          box-shadow: 0 1px 4px rgba(0,0,0,0.1);
          margin-top: 10px;
        }

        .sidebar-title {
          text-align: center;
          font-weight: 500;
          color: #1E3765;
          margin-top: 10px;
          margin-bottom: 15px;
          font-size: 20px;
        }

        /* ---- Step 4: refined section dividers ---- */
        hr {
          border: 0;
          border-top: 1px solid rgba(30,55,101,0.15);
          margin: 16px 0;
        }

        /* ---- Step 5: subtle global background contrast ---- */
        body, .shiny-bound-output {
          background-color: #fbfbfc;
        }

        /* ---- Step 6: rounded form elements ---- */
        input, select, .form-control {
          border-radius: 6px !important;
          border: 1px solid #ccc !important;
          box-shadow: inset 0 1px 2px rgba(0,0,0,0.05);
        }
      "))
    ),
    
    div(class = "header-bar",
        h1(class = "header-title", "SPACE"),
        h2(class = "header-subtitle", "Optimal Allocation Calculator")
    )
  )
}
