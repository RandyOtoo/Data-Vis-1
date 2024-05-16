library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)
library(readr)
library(dplyr) 

# Define server logic
server <- function(input, output, session) {
  # Define filtered_data inside server function
  filtered_data <- reactive({
    data.frame(
      tuition = input$tuition,
      housing = input$housing,
      food = input$food,
      transportation = input$transportation,
      books_supplies = input$books_supplies,
      entertainment = input$entertainment,
      personal_care = input$personal_care,
      technology = input$technology,
      health_wellness = input$health_wellness,
      miscellaneous = input$miscellaneous
    ) %>%
      mutate(
        total_expenses = tuition + housing + food + transportation + 
          books_supplies + entertainment + personal_care + 
          technology + health_wellness + miscellaneous
      )
  })
  
  # Render total expenses text
  output$total_expenses <- renderText({
    total <- filtered_data()$total_expenses
    paste("Total Expenses: $", total)
  })
  
  # Render summary table
  output$summary_table <- renderDataTable({
    filtered_data() %>%
      select(tuition, housing, food, transportation, books_supplies, 
             entertainment, personal_care, technology, health_wellness, 
             miscellaneous, total_expenses)
  }, options = list(dom = 't', paging = FALSE, ordering = FALSE))
  
  # Render expense plot 1
 
  
  # Render expense plot 2
  output$expense_plot2 <- renderPlot({
    expenses <- filtered_data() %>%
      gather(key = "category", value = "amount", -total_expenses)
    
    ggplot(expenses, aes(x = category, y = amount, fill = category)) +
      geom_bar(stat = "identity") +
      labs(x = "Expense Category", y = "Amount",
           title = "Expenses by Category") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
}

