import '../../domain/entities/home_categories.dart';

class HomeCategoryModel extends HomeCategories {
  const HomeCategoryModel({required super.id, required super.media, required super.name});
  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) => HomeCategoryModel(id: json["id"], media: json["media"], name: json["name"]);
}
