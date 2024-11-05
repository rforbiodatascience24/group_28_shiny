library("shiny")
library("bslib")
library("ggplot2")
library("stringr")

source(file = "app_functions.R")
# Define the Server (Backend)
server <- function(input, output) {
  output$dna <- renderText(gene_dna(length = input$n_bases, 
                                    base_probs = c(input$prob_A,
                                                   input$prob_T,
                                                   input$prob_C,
                                                   input$prob_G)))
  output$rna <- renderText({
    transcribe_dna(input$dna_paste)})

  output$aminoacid <- renderText({
    translate_rna(input$rna_paste)
  })
  
  output$frequency_plot <- renderPlot({
    plot_frequencies(input$base_paste)
  })
  
  }


