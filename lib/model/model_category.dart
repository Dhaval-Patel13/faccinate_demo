import 'dart:convert';

List<ModelCategory> modelCategoryFromJson(String str) => List<ModelCategory>.from(json.decode(str).map((x) => ModelCategory.fromJson(x)));

String modelCategoryToJson(List<ModelCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelCategory {
  ModelCategory({
     this.id,
      this.name,
      this.icon,
  });

  int? id;
  String? name;
  String? icon;

  factory ModelCategory.fromJson(Map<String, dynamic> json) => ModelCategory(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
  };
}
