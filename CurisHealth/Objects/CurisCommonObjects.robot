
*** Variables ***
#=======================================================
###########   Constants  ##########
#=======================================================
${sUserName}    jquery=#appUsername
${sPassword}    jquery=#curisPwd
${sLoginSubmit}    jquery=#loginMe
${sProfileImgIcon}    jquery=.user-image
${sLogoutBtn}    jquery=.user-footer div:contains('Logout'):nth-child(2)
${sLeftMenu}    jquery=#leftMenu
${sPatientNav}    jquery=[id='curis.patient']
${sAppointmentNav}    jquery=[id='curis.appointment']
${sPatientRegNav}    jquery=[id='curis.patient.registernew']
${sPatientMergeDuplicates}    jquery=[id='curis.patient.mergeduplicate']
${sAppointmentSearch}    jquery=[id='curis.appointment.search']
${sAccessManagement}    jquery=[id='curis.accessManagement']
${sGroupComponentMap}    jquery=[id='curis.accessManagement.groupComponentMap']
${sLoadingImage}    jquery=#spinner


#  ======================================================
##########   Locators  ########
# =======================================================
${sPatient_Regtype}    jquery=#ddlRegistrationType
${sPatient_Location}    jquery=#dluserHospitals
${sPatient_Salutation}    jquery=#dlSalutation
${sPatient_Gender}    jquery=#dlGender
${sPatient_Nationality}    jquery=#ddlNationality
${sPatient_OfficeLocation}    jquery=#dlRegistrationLocation
${sPatient_FirstName}    jquery=#txtPatientFirstName
${sPatient_DateOfBirth}    jquery=#txtPatientDob
${sPatient_MobileNum}    jquery=#txtPatientMobileNumber1
${sPatient_Ethnicity}    jquery=#dlEthnicity
${sPatient_PaymentType}    jquery=#dlPatientPaymentType
${sPatientAge}    jquery=#txtPatientAge
${sPatient_AgeUnits}    jquery=#ddlAgeUnits
${sPatient_LastName}    jquery=#txtPatientLastName
${sPatient_MaritialStatus}    jquery=#dlMaritalStatus
${sSaveRegBtn}    jquery=#saveRegistrationBtn
${sBlacklistChecBox}    jquery=#chkBlackList
${sBlackListReason}    jquery=#blockListReason
${sSearchRegID}    jquery=#searchRegisterno
${sSerachButton}    jquery=#searchRegistrationBtn
${sUpdateRegDetails}    jquery=#updateRegistrationBtn


${sPatient_CommunicationTab}    jquery=#anCommunicationTab
${sPatient_Address}    jquery=#txtCommunicationPresentAddress1
${sPatient_Country}    jquery=#presentCountry
${sPatient_City}    jquery=#presentCity
${sPatient_State}    jquery=#presentState

${sRegSucessfulPopup}    jquery=.toast-message
${sclosePopupBtn}    jquery=.close.ng-scope 
${sConfirmBtnNo}    jquery=#confirmButtonNo
${sConfirmBtnYes}    jquery=#confirmButtonYes
${sPatientSaveConfirmation}    jquery=h5:Contains('Patient Save Confirmation')

#========================================================

${MobileNumMergeDuplicate}    jquery=#lblMobile
${sSearchBtn}    jquery=#searchBtn
${stableRows}    jquery=div.ui-grid-row:not(:has(div.ui-grid-icon-ok))

${sAppointmentMobileNum}    jquery=#mobileNo
${sSearchAppointmentGrid}     jquery=#searchAppointmentGrid
${sFromDate}    jquery=#fromdate
${sToDate}    jquery=#toDate
${sCalendarMonthsList}    jquery=.ui-datepicker-month
${sCalendarYearsList}    jquery=.ui-datepicker-year

${sDashboardGroups}    jquery=.list-group.no-margin li:Contains('Radiology')[Id^='component']
${Element}    jquery=.has-feedback input:eq(0)