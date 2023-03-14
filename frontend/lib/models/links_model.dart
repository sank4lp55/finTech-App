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
