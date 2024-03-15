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
  static const String getDashboardApi = '${baseUrl}dashboard/get-dashboard';

  /// Store
  static const String getStoreDetailApi = '${baseUrl}vendor/get-vendor/';

  /// Wishlist
  static const String addToWishlistApi = '${baseUrl}wish/add-to-wish-list';
  static const String removeToWishlistApi = '${baseUrl}wish/remove-to-wish';
  static const String myWishlistApi = '${baseUrl}wish/my-wish-list';

  /// Profile
  static const String getCouponApi = '${baseUrl}coupon/get-coupon';

  /// Cart
  static const String getAllReviewApi = '${baseUrl}review/get-all-review';
  static const String addToCartApi = '${baseUrl}cart/add-to-cart';
  static const String myCartApi = '${baseUrl}cart/my-cart';
  static const String removeToCartApi = '${baseUrl}cart/remove-to-cart';
  static const String addCartQuantityApi = '${baseUrl}cart/add-quantity';
  static const String addAddressApi = '${baseUrl}user/add-address';
  static const String editAddressApi = '${baseUrl}user/edit-address';
  static const String userAddressApi = '${baseUrl}user/user-address';
  static const String getMyOrderApi = '${baseUrl}order/get-order';

  /// Profile

  static const String userProfileApi = '${baseUrl}user/user-profile';

  /// Account
  static const String accountApi = '${baseUrl}user/user-profile';
}
