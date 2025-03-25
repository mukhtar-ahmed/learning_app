import 'dart:convert';

class LoginRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? avatar;
  String? openId;
  int? active;
  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.avatar,
    this.openId,
    this.active,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
      'description': description,
      'email': email,
      'avatar': avatar,
      'openId': openId,
      'active': active,
    };
  }

  factory LoginRequestEntity.fromMap(Map<String, dynamic> map) {
    return LoginRequestEntity(
      type: map['type']?.toInt(),
      name: map['name'],
      description: map['description'],
      email: map['email'],
      avatar: map['avatar'],
      openId: map['openId'],
      active: map['active']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestEntity.fromJson(String source) =>
      LoginRequestEntity.fromMap(json.decode(source));
}
