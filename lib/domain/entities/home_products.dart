import 'package:equatable/equatable.dart';
import 'package:fruit_basket/domain/entities/price_unit.dart';

class HomeProducts extends Equatable {
  final int id;
  final String? mainImage;
  final String title;
  final double priceBeforeDiscount, price, discount;
  final PriceUnit unit;

  const HomeProducts({
    required this.id,
    required this.mainImage,
    required this.title,
    required this.priceBeforeDiscount,
    required this.price,
    required this.discount,
    required this.unit,
  });
  @override
  List<Object?> get props => [id, mainImage, title, priceBeforeDiscount, price, discount, unit];
}
