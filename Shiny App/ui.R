library(shiny)
library(ggplot2)
library(DT)
library(gtrendsR)
library(stringr)
library(choroplethr)

usr <- ("535rprogram@gmail.com")
psw <- ("groupproject")
ch <- gconnect(usr, psw)

 ##start user interface

 shinyUI(fluidPage(theme = "bootstrap.css", 
         navbarPage("2016 Presidential Debate: Content Breakdown",
            tabPanel("About", p("
        The 2016 presidential debates unfolded slowly as November approached. We watched candidates battle
        to the bittersweet end trying to convince the American people that they were the better-suited
        candidate to lead our country. According to CNN.com, a record breaking 84 million viewers tuned
        in to watch Hillary Clinton and Donald Trump in the first debate, making this the most watched
        presidential debate in history. Though the first debate broke records, there were three debates
        in total spanning over two months. Some would consider these debates amusing (or surprising) to
        say the least, such that terminology never before used in political discussions was broadcasted live
        for United States citizens and other countries to see in all its’ glory. “Piggy” and “deplorables”
        were just a couple words that were said during the debates that fired up some viewers, and there
        was even some terminology used that was just plain confusing like “bigly.” So what is it that we all
        do when we want to know more about something? We just “Google it” of course."),
        p("The following interactive Shiny App allows users to evaluate any words or phrases that were Googled
        during or immediately following the debates. Additionally users of this app can check out Googled
        terms by state and the emotional context of the candidates during the debates. Click on any of the tabs
        above to explore the debate content breakdown."),
        p(""),
                     img(src='debate_pic.jpg', width = "700", height = "400", style="display: block; margin-left: auto; margin-right: auto;")
        ),
    ##making tab for Gtrends
            tabPanel("Google Trends",
              sidebarLayout(
                sidebarPanel(p("Select debate and speaker, then enter up to four words to assess Google Trends"),
                  selectInput("Debate", "Debate", choices = c("1",
                                                              "2",
                                                              "3")),
                  selectInput("Speaker", "Speaker", choices = c("Clinton",
                                                                "Trump"),
                              selected = "Donald Trump"),
                  textInput("text1", label = h4("Enter word or phrase to display Google Trends"),
                            value = "deplorables"),
                  textInput("text2", label = h6(""), value = "clinton foundation"),
                  textInput("text3", label = h6(""), value = "border wall"),
                  textInput("text4", label = h6(""), value = "bigly"),
                  hr()
                  #fluidRow(column(3, verbatimTextOutput("value")
                  ),
                
                ##  Main Panel
          mainPanel(
            plotOutput("term_plot")
            )
            )
         ),
                                 # 4 parentheses allows state-level tab
    
 #By State 
 tabPanel("State-Level",
           sidebarLayout(
              sidebarPanel(
              p("Enter word to evaluate Google Trends by state"),
              textInput("state", label = h4("Google Search By State"), value = "deplorables"),
              hr() 
              # fluidRow(column(3, verbatimTextOutput("value")
              #  ))
              ),
           ##  Main Panel
            mainPanel(
              plotOutput("states_plot")
                      ))
          ),
 

 

  #Word Frequecy Table
   tabPanel("Frequency",
            
              
              ##  Main Panel
              mainPanel(DT::dataTableOutput("high_frequency_words")
                       )
              
  )
 
         )))
