library("shiny")
library("bslib")
library("ggplot2")
library("stringr")

# Define the User Interface (Frontend)
ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("With Virtual GeneRator you are able to generate random genes, 
               transcribe the DNA into RNA and translate the RNA to protein. 
               You can also calculate the frequency of different bases.")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 1,
                  max = 60,
                  value = 30,
                  width = "100%"),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput(inputId = "prob_A",
                     label = "Probability of A",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_T",
                     label = "Probability of T",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_C",
                     label = "Probability of C",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_G",
                     label = "Probability of G",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1)
      ))),
  
  layout_columns(
    card(
      card_header("Output from Virtual GeneRator"),
      verbatimTextOutput(outputId = "dna")
    )
  ),
  
  sidebarLayout(
  sidebarPanel(
    textInput(inputId = "dna_paste", 
              label = "Paste DNA string to transcribe"),
    verbatimTextOutput(outputId = "rna"),
    
    textInput(inputId = "rna_paste", 
                           label = "Paste RNA string to translate"),
    mainPanel(verbatimTextOutput(outputId = "aminoacid")
    ),
    textInput(inputId = "base_paste", 
              label = "Paste sequence to plot frequencies"),
    
    ),
  
  mainPanel(plotOutput(outputId = "frequency_plot"))
  )
)
  
  
