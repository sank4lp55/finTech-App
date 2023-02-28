import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  bool? success;
  User? user;
  String? token;

  LoginResponseModel({this.success, this.user, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? uid;
  String? fullName;
  String? email;
  String? mobile;
  String? country;
  String? state;
  String? city;
  String? pincode;
  String? streetAddress;
  String? bio;
  String? image;
  Links? links;
  int? accountStatus;
  int? userType;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.uid,
      this.fullName,
      this.email,
      this.mobile,
      this.country,
      this.state,
      this.city,
      this.pincode,
      this.streetAddress,
      this.bio,
      this.image,
      this.links,
      this.accountStatus,
      this.userType,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    fullName = json['full_name'];
    email = json['email'];
    mobile = json['mobile'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    streetAddress = json['street_address'];
    bio = json['bio'];
    image = json['image'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    accountStatus = json['account_status'];
    userType = json['user_type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['street_address'] = this.streetAddress;
    data['bio'] = this.bio;
    data['image'] = this.image;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['account_status'] = this.accountStatus;
    data['user_type'] = this.userType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? linkedIn;
  String? twitter;
  String? instagram;
  String? facebook;
  String? website;

  Links(
      {this.linkedIn,
      this.twitter,
      this.instagram,
      this.facebook,
      this.website});

  Links.fromJson(Map<String, dynamic> json) {
    linkedIn = json['linkedIn'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkedIn'] = this.linkedIn;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['facebook'] = this.facebook;
    data['website'] = this.website;
    return data;
  }
}
