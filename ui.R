library(shiny)
library(dplyr)
library(plotly)
library(htmltools)
library(htmlwidgets)
library(stringr)
library(DT)
library(shinyAce)



fluidPage(
  title="Open PISA",
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
    tags$script(src = "custom.js"),
    tags$link(rel = "shortcut icon", href = "img/bag-512.png")),
  
  tags$div(HTML(
    '  
<div id="myHeader">
    <div class="header-image"></div>
    <div class="text-image">Open PISA</div>
    
    <a   class="english-link
    " href="http://opisa.org/">
    Hebrew
    </a>
</div>
     </div>  
      </div>
')),
  
  
  fluidRow(
    column(8,    
           fluidRow(
             column(12, 
                    
                    tags$div(HTML('
                    <table class="dtable">
             <tr>
             <td>
                    <div id="Subject"
       class="text-center form-group shiny-input-radiogroup shiny-input-container shiny-input-container-inline">
       <div class="shiny-options-group">
        <form class="form-horizontal" method="post" action="">
            <div data-toggle="buttons">
                <div class="subjectButtons">
                    <label class="radio-inline btn btn-default btn-circle btn-lg text-center active">
                        <input type="radio" name="Subject" value="Math" checked="checked"/>
                        <span><img src="img/math.png" class="subjectImage "/></span>
                    </label>
                    <small>Math</small>
                </div>
                <div class="subjectButtons">
                    <label class="radio-inline btn btn-default btn-circle btn-lg text-center">
                        <input type="radio" name="Subject" value="Science"/>
                        <span><img src="img/science.png" class="subjectImage"/></span>
                    </label>
                    <small>Science</small>
                </div>
                <div class="subjectButtons">
                    <label class="radio-inline btn btn-default btn-circle btn-lg text-center">
                        <input type="radio" name="Subject" value="Reading"/>
                        <span><img src="img/reading.png" class="subjectImage"/></span>
                    </label>
                    <small>Reading</small>
                </div>
                </div>
            </form>
        </div>
    </div>
    </td>
    <td>
    <div id="genderDiv"">
        <small>Gender</small>
        <div id="Gender"
        class="form-group shiny-input-checkboxgroup shiny-input-container shiny-input-container-inline">
        <div class="shiny-options-group btn-group" data-toggle="buttons">

        <label class="btn btnMeasurments" id="femaleBtn">
            <input type="checkbox" name="Gender" value="Female"/>
            <span>Female</span>
        </label>
        <label class="btn btnMeasurments" id="maleBtn">
            <input type="checkbox" name="Gender" value="Male"/>
            <span>Male</span>
        </label>
        
    </div>
</div>
</td>
<td>
        <div id="escsDiv">
    <small>ESCS</small>
    <div id="Escs"
    class="form-group shiny-input-checkboxgroup shiny-input-container shiny-input-container-inline">
    <div class="shiny-options-group btn-group" data-toggle="buttons">
        <label class="btn btnMeasurments" id="lowBtn">
            <input type="checkbox" name="Escs" value="Low"/>
            <span>Low</span>
        </label>

        <label class="btn btnMeasurments" id="mediumBtn">
            <input type="checkbox" name="Escs" value="Medium"/>
            <span>Middle</span>
        </label>
        <label class="btn btnMeasurments" id="highBtn">
            <input type="checkbox" name="Escs" value="High"/>
            <span>High</span>
        </label>
    </div>
</div>
</div>
                                  </td>
                                  </tr>
                                  </table>
                                  '))
                    
                    # column(4, radioButtons("Subject", "", c("Math", "Science", "Reading"), inline = T)),
                    # column(4,checkboxGroupInput("Gender", "", c("Female", "Male"), inline = T)),
                    # column(4, checkboxGroupInput("Escs", "", c("Low", "Medium", "High"), selected=c("Low", "High"), inline = T)),
             ),
             column(6, 
                    selectInput("Country1", label="", choices="Israel", selected = "Israel"),
                    plotlyOutput("Country1Plot", height = 300)
             ),
             column(6, 
                    selectInput("Country2", label="", choices="Singapore", selected = "Singapore"),
                    plotlyOutput("Country2Plot", height = 300)
             )
             # column(12,      
             # column(2,numericInput("LevelNumber", "", value=3, step=1)),
             # column(10, tableOutput('ExplenationTable')))
           )
    ), 
    column(4, class="columnText",
           tags$div(HTML("
<p><b>The Programme for International Student Assessment</b> is a worldwide survey by the Organization for
Economic Co-operation and Development (OECD). Its goal
is to evaluate educational systems by testing skills and
knowledge of 15-year-old students. It was first carried out in
the year 2000 and then repeated every three years. In the
2018 cycle, over 600,000 students from 79 countries and
economies participated.</p>

<p><b>Open PISA</b> is a project of <a href='http://infosoc.haifa.ac.il/index.php/en/'>The Center for Internet Research</a>
and <a href='https://trump.org.il/en/'>The Trump Foundation</a>. It aims
to enable learning at scale of the dataset using state of the art
technologies. Policymakers, teachers, and school principals
might use it to make better decisions based on evidence. The
dashboard was designed to bridge the gap in knowledge and
statistical literacy. It includes panels based on common
PISA analysis: students' proficiency and analysis of the
relationship between students' and schools' principals' survey and students'
performances. </p>
    ")
  ))),
  #   hr(),
  #   fluidRow(
  #     column(8,  DT::dataTableOutput("surveyTable"),
  #            checkboxGroupInput("show_survey_vars", "", "", inline=TRUE, width='800px')
  #     ),
  #     column(4, class="columnText",
  #     )),
  hr(),
  fluidRow(
    column(12, DT::dataTableOutput("analyzeTable"),
           p("***p.value<0.01, **p.value<0.05, * p.value<0.1"),
           checkboxGroupInput("show_vars", "", "", inline=TRUE, width='800px')
          
    )
    # column(4,class="columnText",
    # )
  ),
  hr(),
  fluidRow(
    column(4, 
           tags$b("Team"),
           br(),
           "Head of project: Prof.", a(href="http://gsb.haifa.ac.il/~sheizaf/", "Sheizaf Rafaeli"),
           br(),
           'Supervisor: Dr. Adi Libsker', 
           br(),
           "Research and programming:", a(href="https://avnerkantor.shinyapps.io/avnerkantor/", "Avner Kantor"),
           br(),
           br(),
           tags$b("To cite Open PISA"), 
           "please" , tags$a(href="https://dl.acm.org/doi/abs/10.1145/3386527.3406721", style="color:blue", "refer to:"),
           "Kantor, A., & Rafaeli, S. (2020, August). Open PISA: dashboard for large educational dataset. In",
           tags$em("Proceedings of the Seventh ACM Conference on Learning@ Scale"), "(pp. 253-256).",
           br(),
           br(),
           tags$a(img(src="img/GitHub-Mark.png", style="height: 44px;"), href="https://github.com/avnerkantor/openpisa2"),
           br(),
           br()
    ),
    column(8,
           tags$div(HTML('
           <div>
             <a  href="http://infosoc.haifa.ac.il/index.php/en/"><img id="IC_logo" src="img/IC_logo.png" ></a>
             <a  href="http://www.trump.org.il/"><img id="TrumpLogo" src="img/Trump-logo.png"></a>
                        <a href="https://www.allcloud.io/"><img id="AllCloudLogo" src="img/AllCloud.png"></a>
             </div>
           '))
    )

  )
  # br(),
#   fluidRow(
#     tags$div(HTML('<div class="padlet-embed" style="border:1px solid rgba(0,0,0,0.1);border-radius:2px;box-sizing:border-box;overflow:hidden;position:relative;width:100%;background:#F4F4F4"><p style="padding:0;margin:0"><iframe src="https://padlet.com/embed/kbsx225mwpz7" frameborder="0" style="width:100%;height:608px;display:block;padding:0;margin:0"></iframe></p></div>'))
#   )
)




