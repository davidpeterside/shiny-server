Enter file contents herelibrary(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Can You take your dream vacation?"),
  sidebarPanel(
    h1('Input: Your Budget Reality'),
    h5('Enter your vacation information and your budget information below to find out if you can afford your dream vacation without breaking the bank.'),
    numericInput("Vacay_Cost", "Cost of Vacation:", 3000, min = 0, max = 1000000, step = 100),
    numericInput("Weeks_to_Go", "Weeks Until Trip:", 10, min = 0, max = 500, step = 1),
    numericInput("Cash", "Cash in the bank:", 1000, min = 0, max = 1000000, step = 100),
    numericInput("Credit", "Total Credit (All Credit Lines):", 1500, min = 0, max = 1000000, step = 100),
    numericInput("Credit_Used", "Total Credit Used (All Credit Lines):", 0, min = 0, max = 1000000, step = 100),
    sliderInput("pct_to_use", "% of Credit to Use", value = 50, min = 0, max = 100, step = 0.05),
    h5('(The % of your total credit that you are willing to use for this vacation)'),
    numericInput("earnings", "Weekly Earnings (takehome pay after pre-tax deductions)", 1000, min = 0, max = 1000000, step = 100),
    numericInput("rent", "Monthly Rent", 1000, min = 0, max = 1000000, step = 100),
    numericInput("Other_Exp", "Other Monthly Mandatory Expenses", 1000, min = 0, max = 1000000, step = 100),
    h5('(ex. Cable bill, Phone bill, Electricity, etc.)'),
    numericInput("Budget_Pref", "Preferred Weekly Budget", 250, min = 0, max = 1000000, step = 50),
    h5('(How much you normally spend in a week)')
      ),
  mainPanel(
    h1('Output: Weekly budgets to afford your dream vacation'),
    h5('Below are calculations to determine the maximum amount you can budget for personal spending each week and still afford your dream vacation.'),
    h4(),
    h3('Summary'),
    verbatimTextOutput("Summary_Out"),
    h4(),
    h4('These values represent your normal weekly budget and the weekly budgets needed to afford your vacation given the 3 scenarios listed.'),
    h3('Normal weekly budget'),
    verbatimTextOutput("Budget_Pref_Out"),
    h3('Weekly budget to afford vacation if you MAX OUT your credit'),
    verbatimTextOutput("MAX_OUT_Budget"),
    h3('Weekly budget to afford vacation if you use the credit your are comfortable with'),
    verbatimTextOutput("Comfortable_Budget"),    
    h3('Weekly budget to afford vacation if you use don not want to use credit'),
    verbatimTextOutput("NO_Creadit_Budget")    
  )
  )
)
