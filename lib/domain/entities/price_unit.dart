import 'package:equatable/equatable.dart';

class PriceUnit extends Equatable {
  final int id;
  final String name;

  const PriceUnit(this.id, this.name);

  @override
  List<Object?> get props => [id, name];
}
