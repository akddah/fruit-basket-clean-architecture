import 'package:fruit_basket/data/model/price_unit_model.dart';

import '../../domain/entities/home_products.dart';

class HomeProductModel extends HomeProducts {
  const HomeProductModel(
      {required super.id,
      required super.mainImage,
      required super.title,
      required super.priceBeforeDiscount,
      required super.price,
      required super.discount,
      required super.unit});
  factory HomeProductModel.fromJson(Map<String, dynamic> json) => HomeProductModel(
        id: json["id"],
        mainImage: json["main_image"],
        title: json["title"],
        priceBeforeDiscount: json["price_before_discount"] + 0.0,
        price: json["price"] + 0.0,
        discount: json["discount"],
        unit: PriceUnitModel.fromJson(json["unit"]),
      );
}
