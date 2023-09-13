import 'package:equatable/equatable.dart';

class ProductRate extends Equatable {
  final int value;
  final String? comment;
  final String clientImage;
  final String clientName;

  const ProductRate({required this.value, required this.comment, required this.clientImage, required this.clientName});

  @override
  List<Object?> get props => [value, comment, clientImage];
}
