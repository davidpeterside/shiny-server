library(shiny)
shinyServer(
  function(input, output) {
  #Input Variables
    #input$Vacay_Cost
    #input$Weeks_to_Go
    #input$Cash
    #input$Credit
    #input$Credit_Used
    #input$pct_to_use
    #input$earnings
    #input$rent
    #input$Other_Exp
    #input$Budget_Pref

    #total_Earning = reactive({total_earnings = input$earnings * input$Weeks_to_Go})
    #total_Costs = , 
    output$Budget_Pref_Out <- renderText(paste("$",round(input$Budget_Pref,2)))
    output$MAX_OUT_Budget <- renderText(paste("$",round( ( (input$Credit - input$Credit_Used) + input$Cash + input$earnings * input$Weeks_to_Go - (input$rent * (12/52) + input$Other_Exp * (12/52)) * input$Weeks_to_Go)/input$Weeks_to_Go - input$Vacay_Cost/input$Weeks_to_Go,2)))
    output$Comfortable_Budget <- renderText(paste("$",round( ( max((input$Credit * (input$pct_to_use/100) - input$Credit_Used),0) + input$Cash + input$earnings * input$Weeks_to_Go - (input$rent * (12/52) + input$Other_Exp * (12/52)) * input$Weeks_to_Go)/input$Weeks_to_Go - input$Vacay_Cost/input$Weeks_to_Go,2)))
    output$NO_Creadit_Budget <- renderText(paste("$",round( ( input$Cash + input$earnings * input$Weeks_to_Go - (input$rent * (12/52) + input$Other_Exp * (12/52)) * input$Weeks_to_Go)/input$Weeks_to_Go - input$Vacay_Cost/input$Weeks_to_Go,2)))
    output$Summary_Out <- renderText(
      if((input$Cash + input$earnings * input$Weeks_to_Go - (input$rent * (12/52) + input$Other_Exp * (12/52)) * input$Weeks_to_Go)/input$Weeks_to_Go - input$Vacay_Cost/input$Weeks_to_Go >= input$Budget_Pref) {
        "You are in the clear. You don't have to change a thing to take that vacation."
      } else if ( ( max((input$Credit * (input$pct_to_use/100) - input$Credit_Used),0) + input$Cash + input$earnings * input$Weeks_to_Go - (input$rent * (12/52) + input$Other_Exp * (12/52)) * input$Weeks_to_Go)/input$Weeks_to_Go - input$Vacay_Cost/input$Weeks_to_Go >= input$Budget_Pref) {
        "You can afford the vacation while staying within the amount of credit you are willing to use; however, be careful not to rack up too much credit card debt."
      } else if (( (input$Credit - input$Credit_Used) + input$Cash + input$earnings * input$Weeks_to_Go - (input$rent * (12/52) + input$Other_Exp * (12/52)) * input$Weeks_to_Go)/input$Weeks_to_Go - input$Vacay_Cost/input$Weeks_to_Go  >= input$Budget_Pref) {
        "You can afford the vacation, but only by using more credit than you are comfortable with. The YOLO attitude is in vogue, but be careful of the financial hole you may be digging."        
      } else if (( (input$Credit - input$Credit_Used) + input$Cash + input$earnings * input$Weeks_to_Go - (input$rent * (12/52) + input$Other_Exp * (12/52)) * input$Weeks_to_Go)/input$Weeks_to_Go - input$Vacay_Cost/input$Weeks_to_Go  >= 0) {
        "You can barely afford the vacation. You will have to cut back your weekly budget. The YOLO attitude is in vogue, but now you are starting to get reckless."
      } else {paste("Sorry you are out of luck. You would need at least $",as.character(round((( (input$Credit - input$Credit_Used) + input$Cash + input$earnings * input$Weeks_to_Go - (input$rent * (12/52) + input$Other_Exp * (12/52)) * input$Weeks_to_Go)/input$Weeks_to_Go - input$Vacay_Cost/input$Weeks_to_Go)*input$Weeks_to_Go,2)), " of additional credit while cutting your weekly spending to $0 to make this remotely possibility. If you are thinking that way your money might be better spent at a psychiotrists office. Keep dreaming, but you need to make some big changes before you can take this one on.") }
      )

    }
)
