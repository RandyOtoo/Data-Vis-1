library(shiny)
library(shinydashboard)
library(readr)

library(shiny)
library(ggplot2)
library(dplyr)
library(shinythemes)

# Define UI
ui <- navbarPage(
  title = "Student Expense Calculator",
  theme = shinytheme("cosmo"), 
  tabPanel("Overview",
           fluidPage(
             titlePanel("Welcome to the Student Expense Tracker"),
             br(),
             h3("Purpose:"),
             p("The Student Expense Tracker is designed to help students monitor and manage their expenses."),
             br(),
             h3("Usability Targets:"),
             p("This app aims to provide a user-friendly interface for students to input their expenses and visualize them."),
             br(),
             h3("How to Use:"),
             p("1. Navigate to the 'Expenses' tab."),
             p("2. Enter your expenses in each category using the provided input fields."),
             p("3. View the summary of your expenses and breakdown by category in the 'Summary' tab."),
             p("4. Use the plots to visualize your expenses over time and by category."),
             p("5. Use the 'Overview' tab to understand the purpose and usability targets of this app.")
           )
  ),
  tabPanel("Expenses",
           sidebarLayout(
             sidebarPanel(
               numericInput("tuition", "Tuition:", value = 0, min = 0),
               numericInput("housing", "Housing:", value = 0, min = 0),
               numericInput("food", "Food:", value = 0, min = 0),
               numericInput("transportation", "Transportation:", value = 0, min = 0),
               numericInput("books_supplies", "Books & Supplies:", value = 0, min = 0),
               numericInput("entertainment", "Entertainment:", value = 0, min = 0),
               numericInput("personal_care", "Personal Care:", value = 0, min = 0),
               numericInput("technology", "Technology:", value = 0, min = 0),
               numericInput("health_wellness", "Health & Wellness:", value = 0, min = 0),
               numericInput("miscellaneous", "Miscellaneous:", value = 0, min = 0),
               br(), # Add line break
               textOutput("total_expenses") # Display total expenses beneath sidebar panel
             ),
             mainPanel(
               plotOutput("expense_plot2")
             )
           )
  ),
  tabPanel("Summary",
           dataTableOutput("summary_table")
  )
)


shinyUI(ui)

  
  
