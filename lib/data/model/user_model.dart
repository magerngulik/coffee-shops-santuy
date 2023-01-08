// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? id;
  String? email;
  String? name;
  String? photo;
  int? point;
  UserModel({
    this.id,
    this.email,
    this.name,
    this.photo,
    this.point,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'photo': photo,
      'point': point,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      point: map['point'] != null ? map['point'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? photo,
    int? point,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      point: point ?? this.point,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, photo: $photo, point: $point)';
  }
}
