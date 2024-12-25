class AlaaFormData {
  String? username;
  String? email;
  String? phone;
  String? password;

  AlaaFormData({this.username, this.email, this.phone, this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory AlaaFormData.fromMap(Map<String, dynamic> map) {
    return AlaaFormData(
      username: map['username'],
      email: map['email'],
      phone: map['phone'],
      password: map['password'],
    );
  }
}
