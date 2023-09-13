import 'package:get_it/get_it.dart';

import '../../data/datasource/auth_remote_data_source.dart';
import '../../data/repository/auth_repository.dart';
import '../../domain/repository/base_auth_repository.dart';
import '../../domain/usecases/get_favorite_usecase.dart';
import '../../domain/usecases/get_product_rates_usecase.dart';
import '../../domain/usecases/get_product_usecase.dart';
import '../../domain/usecases/home_categories_usecase.dart';
import '../../domain/usecases/home_products_usecase.dart';
import '../../domain/usecases/home_slider_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../data/datasource/favorite_remote_datasource.dart';
import '../../domain/usecases/remove_favorite_usecase.dart';
import '../../presentations/auth/controllers/login_bloc.dart';
import '../../data/repository/favorite_repository.dart';
import '../../domain/repository/base_favorite_repository.dart';
import '../../domain/usecases/add_favorite_usecase.dart';
import '../../data/datasource/addressess_remote_datasource.dart';
import '../../data/datasource/home_remote_datasource.dart';
import '../../data/repository/address_repository.dart';
import '../../data/repository/home_repository.dart';
import '../../domain/repository/base_address_repository.dart';
import '../../domain/repository/base_home_repository.dart';
import '../../domain/usecases/address_delete_usecash.dart';
import '../../domain/usecases/address_insert_usecase.dart';
import '../../domain/usecases/address_update_usecase.dart';
import '../../domain/usecases/addresses_get_usecase.dart';
import '../../presentations/address/controller/address_bloc.dart';
import '../../data/datasource/product_remote_datasource.dart';
import '../../data/repository/product_repository.dart';
import '../../domain/repository/base_product_repository.dart';
import '../../presentations/favorite/controller/favorite_bloc.dart';
import '../../presentations/home/controllers/home_bloc.dart';
import '../../presentations/product/controllers/product_bloc.dart';
import '../network/dio.dart';
import '../utils/user_cashed.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ////// Bloc
    sl.registerFactory<LoginBloc>(() => LoginBloc(sl(), sl()));
    sl.registerLazySingleton<HomeBloc>(() => HomeBloc(sl(), sl(), sl()));
    sl.registerLazySingleton<AddressBloc>(() => AddressBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory<ProductBloc>(() => ProductBloc(sl(), sl()));
    sl.registerLazySingleton<FavoriteBloc>(() => FavoriteBloc(sl(), sl(), sl()));

    ////// Use Cases

    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => HomeSliderUsecase(sl()));
    sl.registerLazySingleton(() => HomeProductsUseCase(sl()));
    sl.registerLazySingleton(() => HomeCategoriesUsecase(sl()));
    sl.registerLazySingleton(() => AddressDeleteUsecase(sl()));
    sl.registerLazySingleton(() => InsertAddressUsecase(sl()));
    sl.registerLazySingleton(() => UpdateAddressUsecase(sl()));
    sl.registerLazySingleton(() => GetAddressessUsecase(sl()));
    sl.registerLazySingleton(() => GetProductUsecase(sl()));
    sl.registerLazySingleton(() => GetProductRateUsecase(sl()));
    sl.registerLazySingleton(() => GetFavoriteUsecase(sl()));
    sl.registerLazySingleton(() => AddFavoriteUsecase(sl()));
    sl.registerLazySingleton(() => RemoveFavoriteUsecase(sl()));

    ////// REPOSITORY
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepositroy(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));
    sl.registerLazySingleton<BaseAddressRepository>(() => AddressessRepository(sl()));
    sl.registerLazySingleton<BaseProductRepository>(() => ProductRepository(sl()));
    sl.registerLazySingleton<BaseFavoriteRepository>(() => FavoriteRepository(sl()));

    ////// DATA SOURCE
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(() => AuthRemoteDataSource(sl()));
    sl.registerLazySingleton<BaseHomeRemoteDatasource>(() => HomeRemoteDatasource(sl()));
    sl.registerLazySingleton<BaseAddressessRemoteDatasource>(() => AddressessRemoteDatasource(sl()));
    sl.registerLazySingleton<BaseProductRemoteDatasource>(() => ProductRemoteDatasource(sl()));
    sl.registerLazySingleton<BaseFavoriteRemoteDatasource>(() => FavoriteRemoteDatasourc(sl()));

    ////// services
    sl.registerLazySingleton<DioHelper>(() => DioHelper(sl()));
    sl.registerLazySingleton<UserCashed>(() => UserCashed());
  }
}
