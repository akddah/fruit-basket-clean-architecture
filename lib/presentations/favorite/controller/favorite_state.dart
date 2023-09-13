import 'package:equatable/equatable.dart';
import 'package:fruit_basket/core/utils/enums.dart';

import '../../../domain/entities/home_products.dart';

class FavoriteState extends Equatable {
  final String getFavoriteMsg;
  final RequestState getFavoriteState;
  final List<HomeProducts> favorite;

  final String updateFavoriteMsg;
  final RequestState updateFavoriteStatus;
  final int? productId;

  const FavoriteState({
    this.getFavoriteMsg = '',
    this.getFavoriteState = RequestState.isLoading,
    this.favorite = const [],
    this.updateFavoriteMsg = '',
    this.updateFavoriteStatus = RequestState.init,
    this.productId,
  });
  FavoriteState copyWith(
          {String? getFavoriteMsg,
          RequestState? getFavoriteState,
          List<HomeProducts>? favorite,
          String? updateFavoriteMsg,
          RequestState? updateFavoriteStatus,
          int? productId}) =>
      FavoriteState(
        getFavoriteMsg: getFavoriteMsg ?? this.getFavoriteMsg,
        getFavoriteState: getFavoriteState ?? this.getFavoriteState,
        favorite: favorite ?? this.favorite,
        updateFavoriteMsg: updateFavoriteMsg ?? this.updateFavoriteMsg,
        updateFavoriteStatus: updateFavoriteStatus ?? this.updateFavoriteStatus,
        productId: productId ?? this.productId,
      );
  @override
  List<Object?> get props => [getFavoriteMsg, getFavoriteState, favorite, updateFavoriteMsg, updateFavoriteStatus, productId];
}
