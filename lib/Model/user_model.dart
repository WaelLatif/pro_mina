class UserModel {
  UserData? user;
  String? token;

  UserModel.fromJson(Map<String, dynamic>? json) {
    token = json!['token'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;

  UserData({
    this.id,
    this.name,
    this.email,
  });

  UserData.fromJson(Map<String, dynamic>? json) {
    id = json!['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
