class ShippingAddressModel {
  ShippingAddressModel({
    this.success,
    this.message,
    this.code,
    this.data,
  });

  final bool? success;
  final String? message;
  final num? code;
  final List<Datum>? data;

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json){
    return ShippingAddressModel(
      success: json["success"],
      message: json["message"],
      code: json["code"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "code": code,
    "data": data?.map((x) => x.toJson()).toList(),
  };

}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.type,
    required this.address1,
    required this.address2,
    required this.country,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.number,
  });

  final int? id;
  final int? userId;
  String? firstName;
  String? lastName;
  String? type;
  String? address1;
  String? address2;
  final String? country;
  final String? city;
  final String? state;
  final String? zipCode;
  final num? number;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      userId: json["user_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      type: json["type"],
      address1: json["address_1"],
      address2: json["address_2"],
      country: json["country"],
      city: json["city"],
      state: json["state"],
      zipCode: json["zip_code"],
      number: json["number"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "first_name": firstName,
    "last_name": lastName,
    "type": type,
    "address_1": address1,
    "address_2": address2,
    "country": country,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "number": number,
  };

}
