///
/// Code generated by jsonToDartModel http://json.fluttergeeks.in/
///
class SignUpModelDataUser {
/*
{
  "user_login": "kishan12",
  "user_nicename": "kishan12",
  "display_name": "kishan12",
  "user_registered": "2024-02-14 12:08:30",
  "user_email": "kishanan12dropedia@gmail.com",
  "user_pass": "$2y$10$R/EKKPZYn./A8MBQQuL9P.zZMGa.LyDdEID4Vub9AR1tsDf0NSJBG",
  "ID": 97
}
*/

  String? userLogin;
  String? userNicename;
  String? displayName;
  String? userRegistered;
  String? userEmail;
  String? userPass;
  int? ID;

  SignUpModelDataUser({
    this.userLogin,
    this.userNicename,
    this.displayName,
    this.userRegistered,
    this.userEmail,
    this.userPass,
    this.ID,
  });

  SignUpModelDataUser.fromJson(Map<String, dynamic> json) {
    userLogin = json['user_login']?.toString();
    userNicename = json['user_nicename']?.toString();
    displayName = json['display_name']?.toString();
    userRegistered = json['user_registered']?.toString();
    userEmail = json['user_email']?.toString();
    userPass = json['user_pass']?.toString();
    ID = json['ID']?.toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_login'] = userLogin;
    data['user_nicename'] = userNicename;
    data['display_name'] = displayName;
    data['user_registered'] = userRegistered;
    data['user_email'] = userEmail;
    data['user_pass'] = userPass;
    data['ID'] = ID;
    return data;
  }
}

class SignUpModelData {
/*
{
  "user": {
    "user_login": "kishan12",
    "user_nicename": "kishan12",
    "display_name": "kishan12",
    "user_registered": "2024-02-14 12:08:30",
    "user_email": "kishanan12dropedia@gmail.com",
    "user_pass": "$2y$10$R/EKKPZYn./A8MBQQuL9P.zZMGa.LyDdEID4Vub9AR1tsDf0NSJBG",
    "ID": 97
  }
}
*/

  SignUpModelDataUser? user;

  SignUpModelData({
    this.user,
  });

  SignUpModelData.fromJson(Map<String, dynamic> json) {
    user = (json['user'] != null) ? SignUpModelDataUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class SignUpModel {
/*
{
  "success": true,
  "message": "Register Successfully",
  "code": 200,
  "data": {
    "user": {
      "user_login": "kishan12",
      "user_nicename": "kishan12",
      "display_name": "kishan12",
      "user_registered": "2024-02-14 12:08:30",
      "user_email": "kishanan12dropedia@gmail.com",
      "user_pass": "$2y$10$R/EKKPZYn./A8MBQQuL9P.zZMGa.LyDdEID4Vub9AR1tsDf0NSJBG",
      "ID": 97
    }
  }
}
*/

  bool? success;
  String? message;
  int? code;
  SignUpModelData? data;

  SignUpModel({
    this.success,
    this.message,
    this.code,
    this.data,
  });

  SignUpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message']?.toString();
    code = json['code']?.toInt();
    data = (json['data'] != null) ? SignUpModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['code'] = code;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
