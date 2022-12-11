class Profile {
  int? attorneyCode;
  int? customers;
  double? debt;
  String? fullName;
  String? mail;
  int? nationalCode;
  int? phone;
  double? receipt;
  String? username;

  Profile(
      {this.attorneyCode,
        this.customers,
        this.debt,
        this.fullName,
        this.mail,
        this.nationalCode,
        this.phone,
        this.receipt,
        this.username});

  Profile.fromJson(Map<String, dynamic> json) {
    attorneyCode = json['attorneyـcode'];
    customers = json['customers'];
    debt = json['debt'];
    fullName = json['full_name'];
    mail = json['mail'];
    nationalCode = json['nationalـcode'];
    phone = json['phone'];
    receipt = json['receipt'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attorneyـcode'] = this.attorneyCode;
    data['customers'] = this.customers;
    data['debt'] = this.debt;
    data['full_name'] = this.fullName;
    data['mail'] = this.mail;
    data['nationalـcode'] = this.nationalCode;
    data['phone'] = this.phone;
    data['receipt'] = this.receipt;
    data['username'] = this.username;
    return data;
  }
}
