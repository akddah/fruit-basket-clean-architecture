import '../../domain/entities/product_rate.dart';

class ProductRateModel extends ProductRate {
  const ProductRateModel({required super.value, required super.comment, required super.clientImage, required super.clientName});
  factory ProductRateModel.fromJson(Map<String, dynamic> json) => ProductRateModel(
        value: json["value"],
        comment: json["comment"],
        clientImage: json["client_image"],
        clientName: json["client_name"],
      );
}
