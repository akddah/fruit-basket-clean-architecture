import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/usecases/get_product_rates_usecase.dart';
import '../../../domain/usecases/get_product_usecase.dart';
import 'product_events.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUsecase getProductUsecase;
  final GetProductRateUsecase getProductRateUsecase;

  ProductBloc(this.getProductUsecase, this.getProductRateUsecase) : super(const ProductState()) {
    on<GetProductEvent>(_getProduct);
    on<GetProductRatesEvent>(_getProductRates);
  }

  Future<void> _getProduct(GetProductEvent event, Emitter<ProductState> emit) async {
    final result = await getProductUsecase(ProductPrams(event.id));
    result.fold(
      (l) => emit(state.copyWith(productState: RequestState.isError, productMsg: l.message)),
      (r) => emit(state.copyWith(product: r, productState: RequestState.isLoaded)),
    );
  }

  Future<void> _getProductRates(GetProductRatesEvent event, Emitter<ProductState> emit) async {
    final result = await getProductRateUsecase(ProductRatePrams(event.id));
    result.fold(
      (l) => emit(state.copyWith(rateState: RequestState.isError, rateMsg: l.message)),
      (r) => emit(state.copyWith(rates: r, rateState: RequestState.isLoaded)),
    );
  }
}
