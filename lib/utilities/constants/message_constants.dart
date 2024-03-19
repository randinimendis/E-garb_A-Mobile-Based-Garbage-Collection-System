class MessageConstants {
  //Error titles
  static const errorTitle = 'Error';
  static const unexpectedErrorTitle = 'Unexpected Error Occurred';
  static const noInternetConnection = 'No internet connection available';

  //Error messages
  static const errorMessage =
      'Please request support from the development team.';
  static const unexpectedErrorMessage =
      'Unexpected error occurred, please try again in a while.';
  static const userDoesNotExistLoginErrorMessage =
      'There is no account with this email address yet. Do you want to sign up?';
  static const userExistsErrorMessage =
      'An account already exists with this phone number.';
  static const userDoesNotExistErrorMessage =
      'No Account Found with This Email';
  static const accessTokenExpiredMessage =
      'Authentication failed. Token expired.';
  static const invalidOtpErrorMessage =
      'OTP is invalid. Please enter a valid OTP';

  //Success titles
  static const successTitle = 'Success';


  //Validation messages
  static const validationEmptyEmail = 'Your email address must be filled';
  static const validationEmptyName = 'Your name must be filled';
  static const validationEmptyGender = 'Your gender details must be filled';
  static const validationEmptyOtp = 'OTP must be filled';
  static const validationInvalidOtp = 'Invalid code';
  static const validationEmptyDateOfBirth = 'Your date of birth must be filled';
  static const validationEmptyDate = 'Date must be filled';
  static const validationEmptyTime = 'Time must be filled';
  static const validationEmptySpO2Details = 'SpO2 details must be filled';
  static const validationWrongTime = 'Invalid time';
  static const validationWrongDate = 'Invalid date';
  static const validationEmptyWeight = 'Weight must be filled';
  static const validationInvalidWeight = 'Please enter a valid weight entry';
  static const validationEmptyBloodSugarLevel = 'Value must be filled';
  static const validationInvalidBloodSugarLevel =
      'Please enter a valid value entry';
  static const validationEmptyDiet = 'Diet details must be filled';
  static const validationInvalidDiet = 'Please enter a valid value entry';
  static const validationInvalidSystolic =
      'Please enter a valid systolic value';
  static const validationInvalidDiastolic =
      'Please enter a valid diastolic value';
  static const validationInvalidPulse = 'Please enter a valid pulse value';
  static const validationEmptyCountry = 'Your country must be selected';
  static const validationEmptyState = 'Your state must be selected';
  static const validationEmptySuburb = 'Your suburb must be selected';
  static const validationEmptyDescription = 'Description must be filled';
  static const validationEmptyPractitioner = 'Practitioner must be selected';
  static const validationEmptyNicPassportNumber =
      'Please enter your NIC number or passport number.';
  static const validationInValidEmail =
      'The email address, does not appear to be valid';
  static const validationInValidDateTime = 'Please enter a valid date time.';
  static const validationEmptyPassword = 'Password must be filled';
  static const validationStrongPassword =
      'Your password must be a minimum of 8 characters and have a minimum of 1 uppercase value, 1 lowercase, 1 numeric and 1 special character';
  static const validationEmptyOldPassword = 'Please enter your old password.';
  static const validationEmptyNewPassword = 'Your new password must be filled';
  static const validationEmptyConfirmPassword =
      'Confirm password must be filled';
  static const validationEmptyConfirmNewPassword =
      'Confirm new password must be filled';
  static const validationConfirmPasswordMissMatch = 'Passwords do not match';
  static const validationConfirmNewPasswordMissMatch = 'Passwords do not match';
  static const validationEmptyPhoneNumber = 'Your mobile number must be filled';
  static const validationInValidPhoneNumber =
      'Please enter a valid mobile number.';
  static const validationEmptyPin = 'PIN must be filled';
  static const validationEmptyConfirmPin = 'Please re-enter your PIN.';
  static const validationNumberCountPin = 'PIN must be 4 numbers.';
  static const validationConfirmPinMissMatch =
      'Re-entered PIN does not match the PIN.';
  static const validationMyCareTeamMemberName = 'Please enter name of member.';
  static const validationMyCareTeamMemberSpecialization =
      'Please enter specialization.';
  static const validationMyCareTeamMemberOrganization =
      'Please enter organization name.';
  static const validationMyCareTeamMemberPhoneNumber =
      'Please enter phone number.';
  static const validationFirstNameAndSureName =
      'Please enter your first name and surname to continue';
  static const validationUpdateEmptyName = 'Please enter the name to continue';
  static const validationBirthdayMatch =
      "The birthday values entered do not match";
  static const validationNullBirthday =
      "Please enter your birthday to continue";
  static const validationConfirmedNullBirthday =
      "Please confirm your birthday to continue";
  static const validationExceedHundredCharacters =
      'The note cannot exceed 100 characters';
  static const validationMyMedicationName =
      'The entry cannot be added without a Medication name.';
  static const validationMyMedicationStrength = 'Please enter strength.';
  static const validationMyMedicationDosageInstruction =
      'Please enter dosage instruction.';
  static const validationFrequencyType = 'Please select frequency type.';
  static const validationEmptyMedNoteEvent = 'Event type must be filled';
  static const validationTaskCommonMessage =
      'Please fill all required fields to proceed';
  static const validationTaskInvalidDateMessage =
      'Tasks cannot be created for past dates. Please select a valid date.';
  static const validationCommonMessage =
      'Fill in all required fields to proceed';
  static const notSelectWeeklyFrequency = 'Please select weekly frequency.';
  static const validationMyConditionName =
      'The entry cannot be updated without a Medication name.';

  //Confirmation titles
  static const exitScanningConfirmationTitle = 'Exit scanning?';
  static const deleteAppointmentConfirmationTitle = 'Delete confirmation';
  static const pinSetupConfirmationTitle = 'Document PIN setup?';
  static const deleteConfirmationTitle = 'Delete confirmation';
  static const deletePharmacyConfirmationTitle = 'Do you want to remove?';

  //Confirmation messages
  static const exitScanningConfirmationMessage =
      'The photo(s) just taken will not be saved. Are you sure to discard the photo(s)?';
  static const deleteAppointmentConfirmationMessage =
      'Are you sure, you want to delete this task?';
  static const pinSetupConfirmationMessage =
      'Do you want to set up a document PIN for additional security?';
  static const deleteConfirmationMessage =
      'Are you sure, you want to delete this task?';
  static const deleteMultipleTasksConfirmationMessage =
      'Are you sure, you want to delete these tasks?';
  static const deleteMedNoteConfirmationMessage =
      'Are you sure, you want to delete this mednote?';
  static const deletePharmacyConfirmationMessage =
      'Are you sure you want to remove this pharmacy from “My pharmacy”? This action cannot be undone.';

  //Prompt titles
  static const documentNamePromptTitle = 'Document name';

  //No content titles
  static const noTasksTitle = 'No tasks added yet.';
  static const noAppointmentsTitle = 'No appointments added yet.';
  static const noDocumentsTitle = 'No documents added yet.';
  static const noMyConditionsTitle = 'No health condition added yet.';
  static const noMyAllergiesTitle = 'No health allergies added yet.';
  static const noPainAddedTitle = 'No pain added yet.';
  static const noWeightAddedTitle = 'No weight added yet.';
  static const noDietAddedTitle = 'No Diet added yet.';
  static const noBloodPressureAddedTitle = 'No blood pressure added yet.';
  static const noMednotesTitle = 'No mednotes';
  static const noMyCareTeamTitle = 'No care team member added yet.';
  static const noMedicationsTitle = 'No medication added yet.';
  static const noFaqTopQuestionTitle = 'No faq top questions.';
  static const noMyPharmacyTitle = 'No my pharmacy added yet.';
  static const noPharmaciesTitle = 'No  pharmacies.';

  //No content messages
  static const noTasksMessage =
      'Adding tasks allows you to stay organized and productive. Please add tasks to continue.';
  static const noAppointmentsMessage =
      'You can keep track of scheduled healthcare visits. Please request appointments to continue.';
  static const noDropdownItemsMessage =
      'No items found. You can add the new item yourself.';
  static const noDocumentsMessage =
      'Your documents will be encrypted and stored securely. Please add documents to continue.';
  static const noMyConditionsMessage =
      'Adding health conditions allows to keep track of your health conditions. Please add health conditions to continue.';
  static const noMyAllergiesMessage =
      'Adding health allergies allows to keep track of your health allergies. Please add health allergies to continue.';
  static const noSearchConditionMessageForAddNew =
      'No items found. You can add the item yourself.';
  static const noSearchMessages =
      'No items found to match your search criteria';
  static const noMednotesMessage =
      'You can create a Mednote on important events you want to remember.';
  static const noMyCareTeamMessage =
      'You can add care team members and access information and contact details of healthcare professionals. Please add care team members to continue.';
  static const noSearchMedNotes = 'No mednotes found to match your search';
  static const noFilterMedNotes = 'No mednotes found to match your filter';
  static const noFilterMyTasks = 'No my tasks found to match your filter';
  static const noSearchMyTasks = 'No my tasks found to match your search';
  static const noMedicationsMessage =
      'Contact your GP to create a list of your medications (your GP can do this through MyGPMPtool (MGT) software or add your own medications.';
  static const noSearchAllergyMessage =
      'No matches were found to the allergy name you entered.';
  static const noSearchConditionMessage =
      'No matches were found to the condition name you entered.';
  static const noFaqTopQuestionsMessage = 'No faq top question found';
  static const noFaqSearchMessages = 'No outcomes for the search criteria';
  static const noSearchMyMedicationsMessage =
      'The Medication searched for is not available in your “My Medication” list.';
  static const noMyPharmacyMessage =
      'Adding a primary pharmacy allows for smoother prescription management. Please add a primary pharmacy to continue.';
  static const noSearchMyCareTeamMemberMessage =
      'No items found. You can add the new item yourself.';
  static const noSearchPharmaciesMessage =
      "No items were found to match your criteria";

  //My Condition
  static const myConditionTitle = 'My Conditions';
  static const myConditionDes = 'Navigating my health conditions';
  static const notSelectedConditionError =
      'Please select a condition to add to "My Conditions"';
  static const allreadyExistMyConditionError =
      'This condition exists in your "My Conditions" list.';

  //My Allergy
  static const myAllergyTitle = 'My allergies';
  static const myAllergyDes = 'Navigating my health allergies';
  static const notSelectedAllergyError =
      'Please select a allergy to add to "My Allergies"';
  static const allreadyExistMyAllergyError =
      'This allergy exists in your "My Allergies" list.';

  //My Care Team
  static const myCareTeamTitle = 'My care team';
  static const myCareTeamDes =
      'Access information and contact details of healthcare professionals.';
  static const addMyCareTeamTitle = 'Add care team member';
  static const addMyCareTeamDes = 'Add your own team member.';
  static const noPainAddedMessage =
      'Adding your pain allows you to monitor and understand your discomfort.';
  static const noWeightAddedMessage =
      'Adding your weight allows you to monitor and manage personal health.';
  static const noDietAddedMessage =
      'Adding your diet allows to keep a record of your food intake.';
  static const noBloodPressureAddedMessage =
      'Adding your blood pressure allows to track your blood pressure level.';
  static const addMyCareTeamFromQRCodeLabel =
      'Scan team member\'s CDMpal QR code';
  static const addMyCareTeamMemberLabel = 'Add member';

  //My medications
  static const myMedicationsTitle = 'My medications';
  static const myMedicationsDes =
      'Don’t forget to take your daily medication. Here’s what you need to take.';
  static const addMyMedicationTitle = 'Add medications';
  static const editMyMedicationTitle = 'Edit medications';
  static const addMyMedicationDes = 'Add your own medication details.';
  static const myMedicationReminderTitle = 'Set the reminder';

  // FAQ
  static const faqTitle = 'FAQ';
  static const faqDes = 'Answers at your fingertips';
  static const faqTopQuestionTitle = 'Top questions';
  static const faqTopQuestionDes = 'Answers at your fingertips';

  // My Pharmacy
  static const myPharmacyTitle = 'My pharmacy';
  static const myPharmacyDes = 'Your trusted medication provider';

  // Pharmacies
  static const pharmaciesTitle = 'Pharmacies';
  static const pharmaciesDes = 'Pharmacies available for medical review';

  // My Pharmacy Settings
  static const myPharmacySettingsTitle = 'Settings';
  static const myPharmacySettingsDes = 'Personalized pharmacy experience';
}
