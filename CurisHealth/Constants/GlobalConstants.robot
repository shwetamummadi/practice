*** Variables ***
${AppUrl}    http://ggk-wrl-cs-2:8095/ehr-webapp/#/login
${GoogleBrowser}    ff
${UserName}    admin
${Pasword}    curis@123
${VeryShortWait}    1 seconds
${shortWait}    3 seconds
${MediumWait}    6 seconds
${RegType}    External    Newborn    Normal

#====================================
#=== For Generating Random Words ====
#====================================
${ALPHABETS}    abcdefghijklmnopqrstuvwxyz
${NUMBERS}    1234567890


#====================================
#===== Patient Personal Details =====
#====================================
${NoramlRegType}    Normal
${Location}    Sarvodaya Sector-19
${FemaleGender}    Female
${NationalityIndian}    Indian
${DateOfBirth}    27-09-1996
${Ethnicity}    South Asian
${SelfPaymentType}    SELF PAYING
${County}    India
${State}    Andhra Pradesh
${City}    Proddatur
${PatientAge}    22
${MobileNum}    ${EMPTY}
${PatientRegID}    ${EMPTY}

# ========================================
# ============  Excel Data  ==============
# ========================================
${ExcelFileLocation}    C:\\Users\\swetha.m\\Downloads\\CurisHealth.xlsx
${SheetName}    Sheet1
${colIndex}
${rowIndex}
