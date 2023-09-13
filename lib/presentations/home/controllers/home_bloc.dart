import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/core/utils/enums.dart';
import 'package:fruit_basket/core/utils/extension.dart';

import '../../../domain/usecases/home_categories_usecase.dart';
import '../../../domain/usecases/home_products_usecase.dart';
import '../../../domain/usecases/home_slider_usecase.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final HomeSliderUsecase homeSliderUsecase;
  final HomeCategoriesUsecase homeCategoriesUsecase;
  final HomeProductsUseCase homeProductsUseCase;

  final searchController = TextEditingController();
  Timer? searchTimer;

  HomeBloc(this.homeSliderUsecase, this.homeCategoriesUsecase, this.homeProductsUseCase) : super(const HomeState()) {
    on<GetHomeSlidersEvent>(_getHomeSliders);
    on<GetHomeCategoriesEvent>(_getHomeCategories);
    on<GetHomeProductsEvent>(_getHomeProducts);
    on<GetSearchProductsEvent>(_getSearchProduct);
  }

  Future<void> _getHomeSliders(GetHomeSlidersEvent event, Emitter<HomeState> emit) async {
    final result = await homeSliderUsecase(NoPrams());
    result.fold(
      (l) => emit(state.copyWith(sliderState: RequestState.isError, sliderMsg: l.message)),
      (r) => emit(state.copyWith(homeSlider: r, sliderState: RequestState.isLoaded)),
    );
  }

  Future<void> _getHomeCategories(GetHomeCategoriesEvent event, Emitter<HomeState> emit) async {
    final result = await homeCategoriesUsecase(NoPrams());
    result.fold(
      (l) => emit(state.copyWith(categoriesState: RequestState.isError, categoriesMsg: l.message)),
      (r) => emit(state.copyWith(homeCategories: r, categoriesState: RequestState.isLoaded)),
    );
  }

  Future<void> _getHomeProducts(GetHomeProductsEvent event, Emitter<HomeState> emit) async {
    final result = await homeProductsUseCase(const ProductsPrams());
    result.fold(
      (l) => emit(state.copyWith(productsState: RequestState.isError, productsMsg: l.message)),
      (r) => emit(state.copyWith(homeProducts: r, productsState: RequestState.isLoaded)),
    );
  }

  searchListener(String text) {
    // searchController.addListener(() {
    //   if (searchController.text.isEmpty && state.searchProductsState != RequestState.init) {
    //     emit(state.copyWith(searchProductsState: RequestState.init));
    //   }
    // });
    if (searchTimer?.isActive == true) searchTimer?.cancel();
    searchTimer = Timer(500.milliseconds, () {
      add(GetSearchProductsEvent());
    });
  }

  Future<void> _getSearchProduct(GetSearchProductsEvent event, Emitter<HomeState> emit) async {
    if (searchController.text.isEmpty) {
      emit(state.copyWith(searchProductsState: RequestState.init, isSearch: false));
    } else {
      emit(state.copyWith(searchProductsState: RequestState.isLoading, isSearch: true));
      final result = await homeProductsUseCase(ProductsPrams(searchController.text));
      result.fold(
        (l) => emit(state.copyWith(searchProductsState: RequestState.isError, searchProductsMsg: l.message, isSearch: true)),
        (r) => emit(state.copyWith(searchProducts: r, searchProductsState: RequestState.isLoaded, isSearch: true)),
      );
    }
  }
}
