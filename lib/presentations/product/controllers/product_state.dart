import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/entities/product_rate.dart';

class ProductState extends Equatable {
  final String productMsg;
  final RequestState productState;
  final Product? product;

  final String rateMsg;
  final RequestState rateState;
  final List<ProductRate> rates;

  // final String productsMsg;
  // final RequestState productsState;
  // final List<HomeProducts> homeProducts;

  // final String searchProductsMsg;
  // final RequestState searchProductsState;
  // final List<HomeProducts> searchProducts;
  // final bool isSearch;

  const ProductState({
    this.productMsg = '',
    this.productState = RequestState.isLoading,
    this.product,
    this.rateMsg = '',
    this.rateState = RequestState.isLoading,
    this.rates = const [],
  });

  ProductState copyWith({
    String? productMsg,
    RequestState? productState,
    Product? product,
    String? rateMsg,
    RequestState? rateState,
    List<ProductRate>? rates,
  }) =>
      ProductState(
        productMsg: productMsg ?? this.productMsg,
        productState: productState ?? this.productState,
        product: product ?? this.product,
        rateMsg: rateMsg ?? this.rateMsg,
        rateState: rateState ?? this.rateState,
        rates: rates ?? this.rates,
      );

  @override
  List<Object?> get props => [
        productMsg,
        productState,
        product,
        rateMsg,
        rateState,
        rates,
      ];
}
