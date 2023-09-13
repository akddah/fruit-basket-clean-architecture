import '../../../../data/model/price_unit_model.dart';
import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.images,
      required super.name,
      required super.percentage,
      required super.price,
      required super.priceBeforeDiscount,
      required super.unit,
      required super.productCode,
      required super.description,
      required super.id});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        images: List<String>.from(json["images"].map((e) => e["url"])),
        name: json["title"],
        id: json["id"],
        percentage: json["discount"].toDouble().toInt(),
        price: json["price"].toDouble(),
        priceBeforeDiscount: json["price_before_discount"].toDouble(),
        unit: PriceUnitModel.fromJson(json["unit"]),
        productCode: json["code"],
        description: json["description"],
      );
}
