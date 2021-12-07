class User {
  var username;
  var password;
  var email;
  var phonenumber;

  // Constructor
  User({this.username, this.password, this.email, this.phonenumber});

  // Stringga o`tkazib olish
  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        email = json['email'],
        phonenumber = json['phonenumber'];

  // Json ni Map ga o`tkazish
  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
        'phonenumber': phonenumber
      };
}
