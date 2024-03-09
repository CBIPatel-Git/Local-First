class ApiConfig {
  static const String appName = "Local First";

  static const String methodPOST = "post";
  static const String methodGET = "get";
  static const String methodPUT = "put";
  static const String methodDELETE = "delete";

  static const String error = "Error";
  static const String success = "Success";
  static const String warning = "Warning";
  static const String rDeviceType = "device-type";
  static const String rToken = "Authorization";

  /// API
  // static const String baseUrl = "https://localfirstapi.testdevteam.xyz/";
  static const String baseUrl = "https://localfirstapi.devteamandro.co.in/";

  /// Authentication
  static const String signInApi = '${baseUrl}api/register';
  static const String logInApi = '${baseUrl}api/login';
  static const String forgotPassApi = '${baseUrl}api/forgot-password';
  static const String createNewPassApi = '${baseUrl}api/create-new-password';

  /// Home & Category
  static const String allCategoryApi = '${baseUrl}api/category/get-products-category';
  static const String getProductByIdApi = '${baseUrl}api/product/get-products';
  static const String getProductsByCategoryApi = '${baseUrl}api/product/get-products-by-category/';

  /// Account
  static const String accountApi = '${baseUrl}api/user/user-profile';
}
