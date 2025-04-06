library(shiny)
library(shinydashboard)
library(shinyFiles)

ui <- dashboardPage(
  skin = "blue",
  dashboardHeader(
    title = "McLab Plant Pathology"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Meet the Team", tabName = "team", icon = icon("users")),
      menuItem("Our Research", tabName = "research", icon = icon("flask")),
      menuItem("Collaborators", tabName = "collaborators", icon = icon("handshake")),
      menuItem("Funders", tabName = "funders", icon = icon("money-bill")),
      menuItem("Contact Us", tabName = "contact", icon = icon("envelope"))
    )
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(
      tabItem(tabName = "home",
              h2("About Us"),
              tags$div(style = "text-align: justify;",
                       p("Our research programme is committed to enhancing agricultural productivity in South Africa by addressing challenges in plant pathology. 
                         Through focused studies on key fungal pathogens, such as", em("Sclerotinia sclerotiorum"), "associated with oil and protein seed crops, i.e., canola, sunflower, soybean, as well as sorghum pathology. 
                         Our research extends to understanding the decision-making processes and perceptions of producers, ensuring that our findings are not only scientifically 
                         sound but also practically applicable and relevant to the needs of the farming community."),
                       
              tags$div(tags$img(src = "mclab_logo.png", height = "140px", style = "margin-bottom: 20px;")),
              
              h3("Vision"),
              p("To inspire and lead impactful research, extension, and outreach initiatives that encourages sustainable disease management in a changing climate, promoting food security and safety while empowering agricultural communities "),
              h3("Mission"),
              p("Our goal is to deliver actionable insights and foster meaningful knowledge exchanges to address relevant problems driven by uncompromised research quality while cultivating the next generation of researchers.")
      ),
      
      p("ChatGPT, an AI language model developed by OpenAI, assisted in drafting and refining sections of the research programme description.")
      ),
      
      tabItem(tabName = "team",
              h2("Meet the Team"),
              tabsetPanel(
                tabPanel("Principal Investigator",
                         fileInput("upload_pi", "Upload Photo", accept = c('image/png', 'image/jpeg')),
                         uiOutput("photo_pi")
                ),
                tabPanel("Coworkers",
                         fileInput("upload_coworkers", "Upload Photo", accept = c('image/png', 'image/jpeg')),
                         uiOutput("photo_coworkers")
                ),
                tabPanel("Postgraduates",
                         fileInput("upload_postgraduates", "Upload Photo", accept = c('image/png', 'image/jpeg')),
                         uiOutput("photo_postgraduates")
                ),
                tabPanel("Technicians/Researchers",
                         fileInput("upload_technicians", "Upload Photo", accept = c('image/png', 'image/jpeg')),
                         uiOutput("photo_technicians")
                ),
                tabPanel("Graduated Students",
                         fileInput("upload_graduated", "Upload Photo", accept = c('image/png', 'image/jpeg')),
                         uiOutput("photo_graduated")
                )
              )
      ),
      tabItem(tabName = "research",
              h2("Our Research"),
              tabsetPanel(
                tabPanel("Current Research", p("Details about current projects.")),
                tabPanel("Completed Research", p("Details about completed projects."))
              )
      ),
      tabItem(tabName = "collaborators",
              h2("Our Collaborators"),
              p("Information about our collaborators.")
      ),
      tabItem(tabName = "funders",
              h2("Funders"),
              p("Acknowledging our funding partners.")
      ),
      tabItem(tabName = "contact",
              h2("Contact Us"),
              p("Email: coetzeeLA@ufs.ac.za"),
              p("Phone: +27 79 270 9691")
      )
    )
  )
)

server <- function(input, output) {
  render_image <- function(input_file) {
    renderUI({
      req(input_file)
      tags$img(src = input_file$datapath, width = '200px')
    })
  }
  
  output$photo_pi <- render_image(input$upload_pi)
  output$photo_coworkers <- render_image(input$upload_coworkers)
  output$photo_postgraduates <- render_image(input$upload_postgraduates)
  output$photo_technicians <- render_image(input$upload_technicians)
  output$photo_graduated <- render_image(input$upload_graduated)
}

shinyApp(ui, server)
