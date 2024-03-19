class ApiConstants {
  // MARK: Google Maps API
  static const googleMapsApiBaseUrl = 'https://maps.googleapis.com/maps/api/';

  static const googleApiKey = 'AIzaSyD-12YmA1R4BWBRMB18h-Lk33cbMd7l0xg';

  //MARK: CDMpal API
  // static const baseUrl = 'https://api-chauffeur.com/api/';
  static const baseUrl = 'http://localhost:5051/api/';

  static const defaultUserName = 'denverb@mexxar.com';
  static const defaultPassword = 'Thot4hm!';
  static const timeOutInSeconds = Duration(seconds: 60);

  //Urls
  static const loginUser = 'Auth/login';
  static const loginWithOtp = 'Auth/LoginWith2FA';
  static const signupUser = 'Auth/register';
  static const getAllVehicleList = 'Vehicle/GetAllVehicles';
  static const getPassengerByID = 'Passenger/GetPassengerByID';
}