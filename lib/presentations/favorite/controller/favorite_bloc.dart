import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_basket/domain/usecases/add_favorite_usecase.dart';

import '../../../../../core/use_case/base_usecase.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../domain/usecases/get_favorite_usecase.dart';
import '../../../../domain/usecases/remove_favorite_usecase.dart';
import 'favorite_events.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteUsecase getFavoriteUsecase;
  final AddFavoriteUsecase addFavoriteUsecase;
  final RemoveFavoriteUsecase removeFromFavorite;

  FavoriteBloc(this.getFavoriteUsecase, this.addFavoriteUsecase, this.removeFromFavorite) : super(const FavoriteState()) {
    on<GetFavoriteEvent>(_getFavorite);
    on<AddFavoriteEvent>(_addToFavorite);
    on<RemoveFromFavoriteEvent>(_removeFromFavorite);
  }

  Future<FutureOr<void>> _getFavorite(GetFavoriteEvent event, Emitter<FavoriteState> emit) async {
    final result = await getFavoriteUsecase(NoPrams());
    result.fold(
      (l) => emit(state.copyWith(getFavoriteState: RequestState.isError, getFavoriteMsg: l.message)),
      (r) => emit(state.copyWith(favorite: r, getFavoriteState: RequestState.isLoaded)),
    );
  }

  Future<void> _addToFavorite(AddFavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(updateFavoriteStatus: RequestState.isLoading, productId: event.productId));
    final result = await addFavoriteUsecase(AddFavoritePrams(event.productId));
    result.fold(
      (l) => emit(state.copyWith(updateFavoriteStatus: RequestState.isError, updateFavoriteMsg: l.message)),
      (r) => emit(state.copyWith(updateFavoriteMsg: r, updateFavoriteStatus: RequestState.isLoaded)),
    );
  }

  Future<void> _removeFromFavorite(RemoveFromFavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(updateFavoriteStatus: RequestState.isLoading, productId: event.productId));
    final result = await removeFromFavorite(RemoveFavoritePrams(event.productId));
    result.fold(
      (l) => emit(state.copyWith(updateFavoriteStatus: RequestState.isError, updateFavoriteMsg: l.message)),
      (r) => emit(state.copyWith(updateFavoriteMsg: r, updateFavoriteStatus: RequestState.isLoaded)),
    );
  }
}
