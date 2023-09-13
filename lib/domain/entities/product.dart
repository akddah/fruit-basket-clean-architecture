import 'package:equatable/equatable.dart';
import '../../../../domain/entities/price_unit.dart';

class Product extends Equatable {
  final int id;
  final List<String> images;
  final String name;
  final int percentage;
  final double price;
  final double priceBeforeDiscount;
  final PriceUnit unit;
  final String productCode;
  final String description;

  const Product(
      {required this.images,
      required this.name,
      required this.id,
      required this.percentage,
      required this.price,
      required this.priceBeforeDiscount,
      required this.unit,
      required this.productCode,
      required this.description});

  @override
  List<Object?> get props => [id, images, name, percentage, price, priceBeforeDiscount, unit, productCode, description];
}
