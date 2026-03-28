library(shiny)
library(shinyWidgets)

ui_hr <- fluidPage(
  titlePanel("Employee Information Form"),
  sidebarLayout(
    sidebarPanel(
      textInput("emp_name", "Employee Name"),
      textAreaInput("story", "Brief Personal Story"),
      passwordInput("secret", "Secret Information"),
      numericInput("age", "Age", value = 25, min = 18, max = 55),
      sliderInput("exp", "Years of Experience", 0, 40, value = 5),
      sliderInput("contract", "Contract Duration (Months)", 1, 36, value = c(6, 12)),
      dateInput("dob", "Date of Birth"),
      dateRangeInput("vacation", "Vacation Period"),
      selectInput("lang", "Favorite Programming Languages",
                  choices = c("R", "Python", "Java", "C++", "JavaScript"), multiple = TRUE),
      checkboxGroupInput("hobbies", "Hobbies",
                         choices = c("Reading", "Traveling", "Gaming", "Coding")),
      checkboxInput("available", "Available for Side Job", value = FALSE),
      fileInput("upload", "Upload Resume/ID Proof"),
      actionButton("submit", "Submit", class = "btn btn-success"),
      actionButton("cancel", "Cancel", class = "btn btn-danger"),
      actionButton("home", "Home", class = "btn btn-primary")
    ),
    mainPanel(
      h4("Submitted Employee Information"),
      tableOutput("result_table"),
      h4("Uploaded File Info"),
      tableOutput("file_info")
    )
  )
)

server_hr <- function(input, output, session) {
  
  observeEvent(input$submit, {
      validate(
        need(input$age >= 18, "Age must be at least 18."),
        need(input$age <= 55, "Age must not exceed 55.")
      )
  
    
    showModal(modalDialog(
      title = "Success",
      "Form Submitted Successfully!",
      easyClose = TRUE,
      footer = modalButton("Close")
    ))
    
    output$result_table <- renderTable({
      data.frame(
        Field = c("Name", "Story", "Age", "Experience (years)", "Contract Duration (months)",
                  "Date of Birth", "Vacation Start", "Vacation End", "Languages", "Hobbies", "Side Job Available"),
        Value = c(
          input$emp_name,
          input$story,
          input$age,
          input$exp,
          paste(input$contract, collapse = " - "),
          as.character(input$dob),
          as.character(input$vacation[1]),
          as.character(input$vacation[2]),
          paste(input$lang, collapse = ", "),
          paste(input$hobbies, collapse = ", "),
          ifelse(input$available, "Yes", "No")
        ),
        stringsAsFactors = FALSE
      )
    })
    
    output$file_info <- renderTable({
      if (is.null(input$upload)) return()
      data.frame(
        File_Name = input$upload$name,
        File_Type = input$upload$type,
        File_Size_Bytes = input$upload$size
      )
    })
  })
  
  # Cancel button resets inputs
  observeEvent(input$cancel, {
    updateTextInput(session, "emp_name", value = "")
    updateTextAreaInput(session, "story", value = "")
    updatePasswordInput(session, "secret", value = "")
    updateNumericInput(session, "age", value = 25)
    updateSliderInput(session, "exp", value = 5)
    updateSliderInput(session, "contract", value = c(6, 12))
    updateDateInput(session, "dob", value = NULL)
    updateDateRangeInput(session, "vacation", start = NULL, end = NULL)
    updateSelectInput(session, "lang", selected = character(0))
    updateCheckboxGroupInput(session, "hobbies", selected = character(0))
    updateCheckboxInput(session, "available", value = FALSE)
    # Note: fileInput cannot be reset directly, only by reloading app
  })
  
  # Home button shows placeholder modal
  observeEvent(input$home, {
    showModal(modalDialog(
      title = "Home",
      "You're now at the home screen (placeholder).",
      easyClose = TRUE,
      footer = modalButton("OK")
    ))
  })
}

# Run the app
shinyApp(ui = ui_hr, server = server_hr)
