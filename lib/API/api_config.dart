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
  // static const String baseUrl = "https://localfirstapi.testdevteam.xyz/api/";
  static const String baseUrl = "https://localfirstapi.devteamandro.co.in/api/";

  /// Authentication
  static const String signInApi = '${baseUrl}register';
  static const String logInApi = '${baseUrl}login';
  static const String forgotPassApi = '${baseUrl}forgot-password';
  static const String submitOtpApi = '${baseUrl}check-otp';
  static const String createNewPassApi = '${baseUrl}create-new-password';
  static const String getLocationApi = '${baseUrl}location/get-location';

  /// Home & Category
  static const String allCategoryApi = '${baseUrl}category/get-products-category';
  static const String getProductByIdApi = '${baseUrl}product/get-products';
  static const String getProductsByCategoryApi = '${baseUrl}product/get-products-by-category/';

  /// Profile
  static const String getCouponApi = '${baseUrl}coupon/get-coupon';

  /// Cart
  static const String getAllReviewApi = '${baseUrl}review/get-all-review';
  static const String addToCartApi = '${baseUrl}cart/add-to-cart';
  static const String myCartApi = '${baseUrl}cart/my-cart';
  static const String removeToCartApi = '${baseUrl}cart/remove-to-cart';
  static const String addCartQuantityApi = '${baseUrl}cart/add-quantity';

  /// Profile

  static const String userProfileApi = '${baseUrl}user/user-profile';

  /// Account
  static const String accountApi = '${baseUrl}user/user-profile';
}
