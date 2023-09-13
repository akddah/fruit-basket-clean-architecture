
import '../../domain/entities/price_unit.dart';

class PriceUnitModel extends PriceUnit {
  const PriceUnitModel(super.id, super.name);
  factory PriceUnitModel.fromJson(Map<String, dynamic> json) => PriceUnitModel(json["id"], json["name"]);
}
