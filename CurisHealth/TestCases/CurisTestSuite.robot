*** Settings ***
Library    SeleniumLibrary    
Library    Collections    
Library    ExcelLibrary
Resource    ../Keywords/Curis_Keywords.robot
Test Setup    Login To Curis Health
Test Teardown    Run Keywords
...    Logout
...    Close All Browsers


*** Test Cases ***


# Reading Excel Data
    # Open Excel Document Sheet 
    # Get Username From Excel Sheet For Sample Testcase      
    
Popup Handling And Switch Window
     Navigate To Patients RegPage
     Patients PersonalDetails Reg Form MandatoryFields
     HandlingLoadingImage    
     Patients Communication Details Reg Form MandatoryFields
     HandlingLoadingImage
     Save The Registration Form
     If Patients Details Already Exists Click On Yes Button
     Switch To Application Window
     HandlingLoadingImage 
     # ${staus}    Run Keyword And Return Status    Page Should Contain Element    jquery=.toast-title  
     Verify Successfull Registration Popup Message
     Close Registation Success message Popup

TS016 Appointment Search With Date Fields 
    Navigate To Appointment Search Page 
    HandlingLoadingImage   
    Input Date in FromDate Field  
    Input Date in ToDate Field    
    Click On Search Btn  
    HandlingLoadingImage  
    ${ApptmtSearchPopup}    Verify Appointment No records Popup      
    Run Keyword If     ${ApptmtSearchPopup}==True
    ...    Click on close btn in popup
    ...    ELSE
    ...    Verify Page should contain appointments list grid
    Log To Console    DONE!!!    


# Table Handling Accessing Data From Table Perform Actions In Table Cells 
    # Navigate To Patients RegPage
    # Patients PersonalDetails Reg Form MandatoryFields
    # Patients Communication Details Reg Form MandatoryFields
    # Save The Registration Form
    # Switch To Application Window
    # Verify Successfull Registration Popup Message
    # Close Registation Success message Popup
    # HandlingLoadingImage
    # Navigate To Merge Duplicates Page
    # HandlingLoadingImage
    # Search For Patient Using Mobile Num
    # HandlingLoadingImage
    # Get Table Row Index Of Patient Reg ID
    # Run Keyword If    '${RowIndex}'=='${EMPTY}'    Log To Console   No records found
    # ...    ELSE
    # ...    Select Row Using Row Index Of Patient Reg ID

# Checkboxes And DropDowns
    # Navigate To Patients RegPage
    # Patients PersonalDetails Reg Form MandatoryFields
    # Patients Communication Details Reg Form MandatoryFields
    # Save The Registration Form
    # Switch To Application Window
    # Verify Successfull Registration Popup Message
    # Close Registation Success message Popup
    # Navigate To Patients RegPage
    # Enter Already RegID Of Normal Type
    # Click On Search Button In Patients RegPage
    # Select BlackList Checkbox
    # Enter Reason For BlackList
    # Click On Update Button In Patients RegPage
    # Verify Patients RegPage Updated Successfully
    # Click on close btn in popup

# Calender Scenario
     # Navigate To Merge Duplicates Page
     # Click On Calender Icon
     # Select the year of the calendar    1996
     # Select the month of the calendar    Sep
     # Select the date of the calendar    27
     # Click On Search Btn

# Dynamically Changing List Based On Search Option
    # Navigate To Group Component Page
    # # Execute JavaScript    document.getElementByXpath((//div[@class='has-feedback']//input)[1]").Sendkeys("sjgfdjd")
    # # Execute Javascript    document.getElementsByClassName('has-feedback').getElementsByTagName('input')[0].click()
    # # Click Element    jquery=.has-feedback input:eq(0)    
    # # Execute Javascript    document.write("SSSS HHHH")
    # Log    ${Element}
    # Execute Javascript    arguments[0].click(),${Element}
    # Sleep    3    
    
    # ${content_header}    Get Text    content_header
    # Run Keyword If     '${content_header}'!='Group Component Map'    Fail        
    # Click Element    jquery=.list-group.no-margin li:Contains('SSSS HHHH')[Id^='component']    



    

    
    
    

     
     


      
      
    
      
        

         
   
   
    
