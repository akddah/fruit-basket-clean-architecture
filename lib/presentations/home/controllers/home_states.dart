import 'package:equatable/equatable.dart';
import '../../../domain/entities/home_categories.dart';
import '../../../domain/entities/home_products.dart';
import '../../../domain/entities/home_slider.dart';

import '../../../../core/utils/enums.dart';

class HomeState extends Equatable {
  final String sliderMsg;
  final RequestState sliderState;
  final List<HomeSlider> homeSlider;

  final String categoriesMsg;
  final RequestState categoriesState;
  final List<HomeCategories> homeCategories;

  final String productsMsg;
  final RequestState productsState;
  final List<HomeProducts> homeProducts;

  final String searchProductsMsg;
  final RequestState searchProductsState;
  final List<HomeProducts> searchProducts;
  final bool isSearch;

  const HomeState({
    this.sliderMsg = '',
    this.sliderState = RequestState.isLoading,
    this.homeSlider = const [],
    this.categoriesMsg = '',
    this.categoriesState = RequestState.isLoading,
    this.homeCategories = const [],
    this.productsMsg = '',
    this.productsState = RequestState.isLoading,
    this.homeProducts = const [],
    this.searchProductsMsg = '',
    this.searchProductsState = RequestState.init,
    this.searchProducts = const [],
    this.isSearch = false,
  });

  HomeState copyWith({
    String? sliderMsg,
    RequestState? sliderState,
    List<HomeSlider>? homeSlider,
    String? categoriesMsg,
    RequestState? categoriesState,
    List<HomeCategories>? homeCategories,
    String? productsMsg,
    RequestState? productsState,
    List<HomeProducts>? homeProducts,
    String? searchProductsMsg,
    RequestState? searchProductsState,
    List<HomeProducts>? searchProducts,
    bool? isSearch,
  }) =>
      HomeState(
        sliderMsg: sliderMsg ?? this.sliderMsg,
        sliderState: sliderState ?? this.sliderState,
        homeSlider: homeSlider ?? this.homeSlider,
        categoriesMsg: categoriesMsg ?? this.categoriesMsg,
        categoriesState: categoriesState ?? this.categoriesState,
        homeCategories: homeCategories ?? this.homeCategories,
        productsMsg: productsMsg ?? this.productsMsg,
        productsState: productsState ?? this.productsState,
        homeProducts: homeProducts ?? this.homeProducts,
        searchProductsMsg: searchProductsMsg ?? this.searchProductsMsg,
        searchProductsState: searchProductsState ?? this.searchProductsState,
        searchProducts: searchProducts ?? this.searchProducts,
        isSearch: isSearch ?? this.isSearch,
      );

  @override
  List<Object?> get props => [
        sliderMsg,
        sliderState,
        homeSlider,
        categoriesMsg,
        categoriesState,
        homeCategories,
        productsMsg,
        productsState,
        homeProducts,
        searchProductsMsg,
        searchProductsState,
        searchProducts
      ];
}
