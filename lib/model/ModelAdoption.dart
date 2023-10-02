// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:petcare/helper/String.dart';

class ModelAdoption {
  String id;
  String name;
  String description;
  String age;
  String gender;
  String profile_img;
  String breed;
  String? weight;
  String user_id;
  String created_at;
  String updated_at;
  ModelAdoption({
    required this.id,
    required this.name,
    required this.description,
    required this.age,
    required this.gender,
    required this.profile_img,
    required this.breed,
    this.weight,
    required this.user_id,
    required this.created_at,
    required this.updated_at,
  });

  ModelAdoption copyWith({
    String? id,
    String? name,
    String? description,
    String? age,
    String? gender,
    String? profile_img,
    String? breed,
    String? weight,
    String? user_id,
    String? created_at,
    String? updated_at,
  }) {
    return ModelAdoption(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      profile_img: profile_img ?? this.profile_img,
      breed: breed ?? this.breed,
      weight: weight ?? this.weight,
      user_id: user_id ?? this.user_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'age': age,
      'gender': gender,
      'profile_img': profile_img,
      'breed': breed,
      'weight': weight,
      'user_id': user_id,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory ModelAdoption.fromMap(Map<String, dynamic> map) {
    return ModelAdoption(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      age: map['age'] as String,
      gender: map['gender'] as String,
      profile_img: map['profile_img'] as String,
      breed: map['breed'] as String,
      weight: map['weight'] != null ? map['weight'] as String : null,
      user_id: map['user_id'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelAdoption.fromJson(Map<String, dynamic> source) => ModelAdoption(
        id: source['id'] as String,
        name: source['name'] as String,
        description: source['description'] as String,
        age: source['age'] as String,
        gender: source['gender'] as String,
        profile_img: source['profile_img'] as String,
        breed: source['breed'] as String,
        weight: source['weight'] != null ? source['weight'] as String : null,
        user_id: source['user_id'] as String,
        created_at: source['created_at'] as String,
        updated_at: source['updated_at'] as String,
      );

  @override
  String toString() {
    return 'ModelAdoption(id: $id, name: $name, description: $description, age: $age, gender: $gender, profile_img: $profile_img, breed: $breed, weight: $weight, user_id: $user_id, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant ModelAdoption other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.age == age &&
        other.gender == gender &&
        other.profile_img == profile_img &&
        other.breed == breed &&
        other.weight == weight &&
        other.user_id == user_id &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        age.hashCode ^
        gender.hashCode ^
        profile_img.hashCode ^
        breed.hashCode ^
        weight.hashCode ^
        user_id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
