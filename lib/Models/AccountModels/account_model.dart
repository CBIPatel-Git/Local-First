class AccountModel {
  AccountModel({
    this.success,
    this.message,
    this.code,
    this.data,
  });

  final bool? success;
  final String? message;
  final num? code;
  final Data? data;

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      success: json["success"],
      message: json["message"],
      code: json["code"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.userLogin,
    this.userPass,
    this.userNicename,
    this.userEmail,
    this.userUrl,
    this.userRegistered,
    this.userActivationKey,
    this.userStatus,
    this.displayName,
  });

  final num? id;
  final String? userLogin;
  final String? userPass;
  final String? userNicename;
  final String? userEmail;
  final String? userUrl;
  final DateTime? userRegistered;
  final String? userActivationKey;
  final num? userStatus;
  final String? displayName;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["ID"],
      userLogin: json["user_login"],
      userPass: json["user_pass"],
      userNicename: json["user_nicename"],
      userEmail: json["user_email"],
      userUrl: json["user_url"],
      userRegistered: DateTime.tryParse(json["user_registered"] ?? ""),
      userActivationKey: json["user_activation_key"],
      userStatus: json["user_status"],
      displayName: json["display_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ID": id,
        "user_login": userLogin,
        "user_pass": userPass,
        "user_nicename": userNicename,
        "user_email": userEmail,
        "user_url": userUrl,
        "user_registered": userRegistered?.toIso8601String(),
        "user_activation_key": userActivationKey,
        "user_status": userStatus,
        "display_name": displayName,
      };
}
