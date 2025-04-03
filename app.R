library(shiny)
library(shinydashboard)
library(shinyFiles)

ui <- dashboardPage(
  dashboardHeader(title = "Research Group Website"),
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
    tabItems(
      tabItem(tabName = "home",
              h2("About Us"),
              p("Our research programme is committed to enhancing agricultural productivity in South Africa by addressing challenges in plant pathology. Through focused studies on key fungal pathogens, such as Sclerotinia sclerotiorum, and crops, i.e., canola, sunflower, soybean, and sorghum, we aim to develop innovative, sustainable disease management strategies that empower producers, foster collaboration, and advance scientific knowledge. In the case of sorghum, we focus on various aspects of sorghum pathology, including the prevalence of grain mold, leaf diseases, and the root microbiome, while also investigating disease management strategies. Our research extends to understanding the decision-making processes and perceptions of producers, ensuring that our findings are not only scientifically sound but also practically applicable and relevant to the needs of the farming community.
Our research is anchored in six key themes. First, we focus on the management of _Sclerotinia sclerotiorum_ in sunflower, soybean, and canola through studies on epidemiology, host-pathogen interactions, and disease risk forecasting. Interventions such as premature desiccation and the use of granular chlorine are being evaluated for their effectiveness in controlling this devastating pathogen. Second, we are investigating sorghum diseases, including systematic reviews of grain mold and field studies on the diversity of fungal diseases in the sorghum phyllosphere. We complement these efforts with research on farmers' knowledge and perceptions of sorghum production, ensuring that management strategies are informed by producer needs.
Our third theme involves host resistance screening and diagnostics, where we evaluate soybean and sunflower cultivars for tolerance to Sclerotinia sclerotiorum and address seedborne diseases in soybean. Fourth, our dry bean research focuses on anthracnose, specifically virulence characterization and host responses, to support resistance breeding programmes. Fifth, we integrate innovation into precision agriculture, employing remote sensing and machine learning for disease detection and management. Lastly, we are establishing UFS as a reliable plant disease diagnostic laboratory, aiming to provide critical services to producers while generating third-stream income for the university.
Engagement with stakeholders is a cornerstone of our work. Through initiatives like the South African Sclerotinia Research Network (SASRN), producer field days, and collaboration with industry partners, we ensure that research outcomes are accessible, practical, and impactful. Additionally, we contribute to the academic community by publishing high-impact articles, participating in conferences, and mentoring postgraduate researchers, strengthening the pipeline of skilled plant pathologists.
By fostering collaboration, curiosity, and excellence, our programme strives to position UFS as a leader in plant pathology research and diagnostics. Our long-term goals include expanding transdisciplinary research, advancing sustainable disease management, and building a robust postgraduate pipeline aligned with industry needs. Ultimately, we aim to empower agricultural communities and enhance food security in a rapidly changing world.
ChatGPT, an AI language model developed by OpenAI, assisted in drafting and refining sections of the research programme description. 
"),
              h3("Vision"),
              p("To be a leading research group in plant pathology."),
              h3("Mission"),
              p("To conduct innovative, impactful, and collaborative research.")
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
