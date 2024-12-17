class FormData {
  String? username;
  String? email;
  String? phone;
  String? password;

  FormData({
    this.username,
    this.email,
    this.phone,
    this.password,
  });

  Map<String, String?> toMap() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
} 