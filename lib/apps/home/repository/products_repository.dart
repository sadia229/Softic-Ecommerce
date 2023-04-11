import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as dio;
import 'package:softic_ecommerce/general/api/base_client.dart';
import 'package:softic_ecommerce/general/constants/urls.dart';
import '../../../general/helpers/dio_esceptions.dart';
import '../model/products_model.dart';

class ProductsRepository {
  ProductsModel? productsModel;
  // Products
  Future<dynamic> getProducts({context}) async {
    try {
      var response = await BaseClient.get(url: Urls.getProductsUrl);
      if (response.statusCode == 200) {
        debugPrint("response ${response.data}");
        //ProductsModelroductsModel = ProductsModel.fromJson(response.data);
        var firstUser = response.data;
        return firstUser;
      } else {
        throw Exception("loading error");
      }
    } on dio.DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      debugPrint(errorMessage);
      rethrow;
    }
  }
  // Products Add
  static addProducts({payload}) async {
    try {
      var response =
          await BaseClient.post(url: Urls.addProductsUrl, payload: payload);
      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }

  // Delete Products
  static deleteProducts({payload, id}) async {
    try {
      var response = await BaseClient.delete(url: Urls.deleteProductsUrl(id));
      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }
}
