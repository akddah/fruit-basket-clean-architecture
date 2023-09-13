import '../../core/network/dio.dart';
import '../../domain/usecases/get_product_rates_usecase.dart';
import '../../domain/usecases/get_product_usecase.dart';

import '../../core/network/error_message_model.dart';
import '../../core/utils/app_constents.dart';
import '../model/product_model.dart';
import '../model/product_rate_model.dart';

abstract class BaseProductRemoteDatasource {
  final DioHelper dioHelper;

  BaseProductRemoteDatasource(this.dioHelper);
  Future<ProductModel> getProduct(ProductPrams prams);
  Future<List<ProductRateModel>> getProductRate(ProductRatePrams prams);
}

class ProductRemoteDatasource extends BaseProductRemoteDatasource {
  ProductRemoteDatasource(super.dioHelper);

  @override
  Future<ProductModel> getProduct(ProductPrams prams) async {
    final result = await dioHelper.get(AppConstances.getProduct(prams.id));
    if (result.statusCode == 200) {
      return ProductModel.fromJson(result.data["data"]);
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }

  @override
  Future<List<ProductRateModel>> getProductRate(ProductRatePrams prams) async {
    final result = await dioHelper.get(AppConstances.getProductRate(prams.productId));
    if (result.statusCode == 200) {
      return List<ProductRateModel>.from(result.data["data"].map((e) => ProductRateModel.fromJson(e)));
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }
}
