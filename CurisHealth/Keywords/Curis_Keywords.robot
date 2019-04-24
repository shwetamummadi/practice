*** Settings ***
Library    SeleniumLibrary 
Library    ExcelLibrary       
Library    String 
Library    DateTime    
Resource    ../Constants/GlobalConstants.robot
Resource    ../Objects/CurisCommonObjects.robot

*** Variables ***
${RowIndex}    ${EMPTY}
${ColumnIndex}    ${EMPTY}
${Message}
****Keywords****
 
Login To Curis Health
    [Documentation]    
    ...    Login with admin credential to curis health application
    Log To Console    LogIn as admin To Curis health app
    Open Browser   
    ...    ${AppUrl}    ${GoogleBrowser} 
    Maximize Browser Window  
    Title Should Be    CurisHealth 
    Wait Until Element Is Visible    ${sUserName}    ${MediumWait}   
    Input Text    ${sUserName}    ${UserName}
    Input Password    ${sPassword}    ${Pasword}
    Click Button    ${sLoginSubmit}
    Set Selenium Speed    0.2 seconds
    HandlingLoadingImage    ${MediumWait}
    
HandlingLoadingImage
    [Arguments]     ${DelayTime}=5 seconds
    Wait Until Element Is Not Visible    ${sLoadingImage}    ${DelayTime}
    
NavigateToLeftNavMenu
    [Arguments]    ${LeftNav}    ${LeftNavChild}
    Wait Until Element Is Visible    ${sLeftMenu}
    Mouse Over    ${sLeftMenu}
    ${IsNavExpand}=    Run Keyword And Return Status    Element Should Be Enabled     ${LeftNavChild}
    Run Keyword If    ${IsNavExpand}==False    Click Element    ${LeftNav} 
    Wait Until Page Contains Element    ${LeftNavChild}       
    Click Element    ${LeftNavChild}   
    Mouse Out    ${sLeftMenu} 
    Wait Until Element Is Not Visible    ${sLoadingImage}
    

Navigate To Patients RegPage
    [Documentation]    
    ...    Navigate to Patients Nav and then to patients registration page
    NavigateToLeftNavMenu    ${sPatientNav}    ${sPatientRegNav}

Navigate To Appointment Search Page
    [Documentation]    
    ...    Navigate to Appointment Nav and then to  appointment search page
    NavigateToLeftNavMenu    ${sAppointmentNav}    ${sAppointmentSearch}
    
Navigate To Merge Duplicates Page
    [Documentation]    
    ...    Navigate to Patients Nav and then to  merge dupliactes page
    Wait Until Page Contains Element    ${sPatientNav}    
    NavigateToLeftNavMenu    ${sPatientNav}    ${sPatientMergeDuplicates}

Navigate To Group Component Page
    [Documentation]    
    ...    Navigate to Patients Nav and then to  merge dupliactes page
    Wait Until Page Contains Element    ${sAccessManagement}   
    NavigateToLeftNavMenu    ${sAccessManagement}    ${sGroupComponentMap}
        
Switch To Application Window
    [Documentation]    
    ...    Switch from another window to curisHealth application window
    Select Window   CurisHealth  
      
Patients PersonalDetails Reg Form MandatoryFields
    [Documentation]    
    ...    Entering all the mandatory details in personal details tab for Patient Registration
    # Select From List By Label    ${sPatient_Regtype}    ${NoramlRegType}    
    # Select From List By Label    ${sPatient_Location}    ${Location}
    # Select From List By Label    ${sPatient_Salutation}    Ms.
    # Select Gender As Female
    # Select From List By Label    ${sPatient_Nationality}    ${NationalityIndian}
    # Select From List By Label    ${sPatient_OfficeLocation}    Health Checkup
    # Input Name In FirstName Field
    # Input Text    ${sPatient_DateOfBirth}    ${DateOfBirth} 
    # Press Key    ${sPatient_DateOfBirth}   \\\13
    Input Number In MobileNum Field
    # Upload file 
    Select From List By Label    ${sPatient_Ethnicity}    ${Ethnicity}     
    Select From List By Label    ${sPatient_PaymentType}    ${SelfPaymentType}
    Set Age Units As Years
    Input Name In LastName Field
    Set Maritual Status As Single
        
Patients Communication Details Reg Form MandatoryFields
    [Documentation]    
    ...    Entering all the mandatory details in Communication details tab for Patient Registration
    Wait Until Page Contains Element    ${sPatient_Address}    
    Click Element    ${sPatient_CommunicationTab}
    HandlingLoadingImage
    Input Address In The Address Field
    Select Country As India    
    Select State As AndhraPradesh
    Select City As Proddatur
    
Input Name In FirstName Field
    [Documentation]    
    ...    Enter name in first name field with random string generating from the given alphabets
    ${randomName}    Generate Random String     8    ${ALPHABETS}
    Input Text    ${sPatient_FirstName}    ${randomName} 
   
Input Name In LastName Field
    [Documentation]    
    ...    Enter name in last name field with random string generating from the given alphabets
    ${randomName}    Generate Random String     8    ${ALPHABETS}
    Input Text    ${sPatient_LastName}    ${randomName}  
   
Input Number In MobileNum Field
    [Documentation]    
    ...    Enter mobile num in mobile field with random number generating from the given numbers
    ${MobileNum}    Generate Random String    10    ${NUMBERS}
    Set Global Variable   ${MobileNum}
    Input Text   ${sPatient_MobileNum}    ${MobileNum}    
    
Input Address In The Address Field
    [Documentation]    
    ...    Enters teh address generated randomly    
    ${doorNum1}    Generate Random String     1     ${NUMBERS} 
    ${doorNum2}    Generate Random String     3     ${NUMBERS} 
    ${streetName}    Generate Random String     6     ${ALPHABETS}
    Input Text    ${sPatient_Address}    ${doorNum1}-${doorNum2}, ${streetName} 

Select Country As India
    [Documentation]    Select the country from the drop down list of cirty field
    Input Text    ${sPatient_Country}     ${County}
    Click Element    jquery=#presentCountry~ul a[Title='${County}']

Select State As AndhraPradesh
    [Documentation]    Select the state from the drop down list of cirty field
    Input Text    ${sPatient_State}    ${State}
    Click Element    jquery=#presentState~ul a[Title='${State}']
    
Select City As Proddatur
    [Documentation]    Select the city from the drop down list of cirty field
    Input Text    ${sPatient_City}    ${City}
    Click Element    jquery=#presentCity~ul a[Title='${City}']

Set Maritual Status As Single 
    [Documentation]    Set the select list option value as single
    Select From List By Label    ${sPatient_MaritialStatus}    Single

Set Age Units As Years
    [Documentation]    Set the age units from the select list options as years
    Select From List By Label    ${sPatient_AgeUnits}    Years     

Select Gender As Female
    [Documentation]    Set the select list option value as Female
    Select From List By Label    ${sPatient_Gender}    ${FemaleGender} 

Upload file 
    [Documentation]    Uploading a file  
    Sleep    1 seconds
    Choose File     jquery=#uploadpatientProfilePic     C://Users/swetha.m/Desktop/s2.png
              
Input Date in FromDate Field
    [Documentation]    Enter the date in the From Date Field
    ${currentDate}    Get Current Date    result_format= %d-%m-%Y
    Input Text    ${sFromDate}    ${currentDate}
         

Input Date in ToDate Field
    [Documentation]    Enter the date in the To Date Field
    ${currentDate}    Get Current Date    result_format= %d-%m-%Y
    Input Text    ${sToDate}    ${currentDate}

Click On Search Btn
    [Documentation]    Clicking on search button
    Click Button    ${sSearchBtn} 
    HandlingLoadingImage    

Verify Page should contain appointments list grid
    [Documentation]    verifying the search results in table appointment grid
    Page Should Contain Element    ${sSearchAppointmentGrid}

If Patients Details Already Exists Click On Yes Button
    [Documentation]    Verify patients form already exists, if exists click on yes button
    ${IsPopUpExists}    Run Keyword And Return Status    Page Should Contain Element    ${sPatientSaveConfirmation}
    Run Keyword If    ${IsPopUpExists}    Click Button    ${sConfirmBtnYes}
           
Click on close btn in popup
    [Documentation]    Clicking on Close button in popup
    Click Button    ${sclosePopupBtn}  
                   
Save The Registration Form
    [Documentation]    Clicking on Save button in registration form
    Click Button    ${sSaveRegBtn}    
    HandlingLoadingImage
    
Verify Successfull Registration Popup Message
    ${SuccessMessage}=    Get Text    ${sRegSucessfulPopup}  
    Run Keyword If    'Patient registered successfully. Registration number :' in '${SuccessMessage}'
    ...    Get the Patient RegID From the popup    ${SuccessMessage} 
    ...    ELSE    Fail    Registration Failed

Get the Patient RegID From the popup
    [Documentation]    Fetch the created reqId from the popup msg and set it to global variable
    [Arguments]    ${PopupMsg}
    ${PatientRegID}    Fetch From Right    ${PopupMsg}    :
    ${PatientRegID}    Set Global variable    ${PatientRegID}
    Log To Console   Successfully Registered
    
Close Registation Success message Popup
    Click on close btn in popup
    Wait Until Element Is Enabled    ${sConfirmBtnNo}    
    Click Button    ${sConfirmBtnNo}
    HandlingLoadingImage
    
Search Details Using Any Field
    [Arguments]    ${serachLocator}    ${SearchField}
    Input Text     ${serachLocator}    ${SearchField}
    Click Button    ${sSearchBtn}
    
Search For Patient Using Mobile Num
    [Documentation]    Enters the mobile num int he mobile field and search for the registered patients
    Search Details Using Any Field    ${MobileNumMergeDuplicate}    ${MobileNum}
    
Verify Appointment No records Popup
    [Return]    ${result}
     ${IsPopup}    Run Keyword And Return Status    Page Should Not Contain Element    ${sRegSucessfulPopup}      
      Run Keyword If    ${IsPopup}==False   
      ...    Get Content From Popup    
    ${result}    Set Variable If    'No Records Found'=='${Message}'    True    False 
    
Get Content From Popup
     ${Message}    Get Text    ${sRegSucessfulPopup}
     ${Message}    Set Global Variable    ${Message}  
       
Get the column index by passing column name
    [Arguments]    ${ColumnName}
    [Return]    ${ColumnIndex}
    ${No.of Columns}    Get Element Count    jquery=div.ui-grid-header-cell-wrapper:eq(1) .ui-grid-header-cell-label
    
    :FOR    ${i}    IN RANGE    0     ${No.of Columns}
    \    ${text}     Get Text    jquery=div.ui-grid-header-cell-wrapper:eq(1) .ui-grid-header-cell-label:eq('${i}')
    \    Run Keyword And Return If     '${text}'=='${ColumnName}'    Set variable    ${i}   
    \    ${i}    Evaluate    ${i}+1

Current Date
    [Return]    ${todayDate}
    ${currentDate}    Get Current Date    result_format= %d-%m-%Y
    ${todayDate}    Set Variable    ${currentDate}

Get Row index of the given content
    [Arguments]     ${PatientRegID}    ${colName}
    ${no.ofRows}    Get Element Count    ${stableRows}
    ${ColIndex}    Get the column index by passing column name    ${colName}
    
    :FOR   ${i}    IN RANGE    0     ${no.ofRows}
    \     ${Text}=   Get Text   jquery=div.ui-grid-row:not(:has(div.ui-grid-icon-ok)):eq(${i}) .ui-grid-cell:eq(${ColIndex})
    \     Log    ${Text}
    \     Run Keyword And Return If   '${Text}'=='${PatientRegID}'    Set Global variable     ${RowIndex}    ${i}
    \     ${i}    Evaluate    ${i}+1

Get Table Row Index Of Patient Reg ID
    Get Row index of the given content     ${PatientRegID}    Reg. No. 
     
Select Row Using Row Index Of Patient Reg ID
    Click Element    jquery=div[role='row'] div.ui-grid-icon-ok:eq(${RowIndex})  
    ${ActiveColumnIndex}    Get the column index by passing column name    Active
    Click Element    jquery=div.ui-grid-row:not(:has(div.ui-grid-icon-ok)):eq( ${RowIndex}) .ui-grid-cell:eq(${ActiveColumnIndex}) input 

Enter Already RegID Of Normal Type
    [Documentation]    Enters the already registered id of patients type normal
    Input Text    ${sSearchRegID}    ${PatientRegID}
    
Click On Search Button In Patients RegPage
    [Documentation]    clicks on search button in patients RegPage 
    Click Button    ${sSerachButton}
    HandlingLoadingImage  

Click On Update Button In Patients RegPage
    [Documentation]    Clicks on update button in patients RegPage
    Click Button    ${sUpdateRegDetails}
    HandlingLoadingImage    

Select BlackList Checkbox
    [Documentation]    Check the checkbox of black list
    Select Checkbox    ${sBlacklistChecBox}    
    
Enter Reason For BlackList
    [Documentation]    Enters reason in the text field for black list in patients RegPage
    Input Text    ${sBlackListReason}    others

Verify Patients RegPage Updated Successfully
    [Documentation]    Verifying successful message in popup
    Page Should Contain    Patient information updated

Click On Calender Icon
    [Documentation]    clicks on calender icon
    Click Element    jquery=button i.fa.fa-calendar

Select the month of the calendar
    [Documentation]    Selects the requested month in the calendar
    [Arguments]    ${month}
    Select From List By Label    ${sCalendarMonthsList}     ${month}   

Select the year of the calendar
    [Documentation]    Selects the requested year in the calendar
    [Arguments]    ${year}
    Select From List By Label    ${sCalendarYearsList}    ${year}

Select the date of the calendar
    [Documentation]    Selects the requested day in the calendar
    [Arguments]    ${date}
    Click Element    jquery=.ui-datepicker-calendar td a:contains('${date}') 

# Open Excel Document Sheet
    # [Documentation]    Opens the connection with the excel file of required sheet
    # Open Excel Document   ${ExcelFileLocation}    ${SheetName} 
    
# Get The TestCase Row Index
    # [Arguments]    ${testCaseName}
    # ${rowsList}    Read Excel Column    col_num=0
    # ${No.of Rows}    Get Length    ${rowsList}
    # :FOR   ${i}    IN RANGE    0     ${No.of Rows}
    # \    Log    ${i}
    # \   Run Keyword And Return If   '${rowsList[${i}]}'=='${testCaseName}'    Set Global Variable    ${rowIndex}    ${i}

# Get The Column Index
    # [Arguments]    ${colName}
    # [Documentation]    Returns the Column index of the specified row
    # ...   ${RowIndex}= Row index of the required column
    # ${colsList}    Read Excel Row    row_num=0
    # ${No.of Cols}    Get Length    ${colsList}
    # :FOR   ${i}    IN RANGE    1     ${No.of Cols}
    # \   ${colIndex}    Evaluate    ${i}+1    
    # \   Run Keyword And Return If    '${colsList[${i}]}'=='${colName}'    Set Global Variable    ${colIndex}  

    
# Get Username From Excel Sheet For Sample Testcase
     # Get The TestCase Row Index    smaple1
     # Get The Column Index    Username
     # ${Value}    Read Excel Cell    ${RowIndex}    ${ColIndex}
     # Set Global Variable    ${Value}    ${Value}   
         
Logout
    [Documentation]    Logout the user from the application
    Log    Logout as admin
    Wait Until Element Is Visible    ${sProfileImgIcon}    3 Seconds    
    Click Element    ${sProfileImgIcon}
    Click Element    ${sLogoutBtn}