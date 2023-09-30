// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DiscModel {
  int? id;
  String? image;
  String? name;
  String? desc;
  String? offText;
  DiscModel({
    this.id,
    this.image,
    this.name,
    this.desc,
    this.offText,
  });

  DiscModel copyWith({
    int? id,
    String? image,
    String? name,
    String? desc,
    String? offText,
  }) {
    return DiscModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      offText: offText ?? this.offText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'desc': desc,
      'offText': offText,
    };
  }

  factory DiscModel.fromMap(Map<String, dynamic> map) {
    return DiscModel(
      id: map['id'] != null ? map['id'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      offText: map['offText'] != null ? map['offText'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscModel.fromJson(String source) =>
      DiscModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DiscModel(id: $id, image: $image, name: $name, desc: $desc, offText: $offText)';
  }

  @override
  bool operator ==(covariant DiscModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.name == name &&
        other.desc == desc &&
        other.offText == offText;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        offText.hashCode;
  }
}
