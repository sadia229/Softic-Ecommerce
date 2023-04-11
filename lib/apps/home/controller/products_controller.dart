import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:softic_ecommerce/apps/home/model/products_model.dart';
import 'package:softic_ecommerce/apps/home/repository/products_repository.dart';

class ViewProductsController extends GetxController {
  late final ProductsRepository _repository;
  final RxBool _isLoading = false.obs;
  final RxBool _hasError = false.obs;
  final RxInt count = 0.obs;

  bool get isLoading => _isLoading.value;

  bool get hasError => _hasError.value;

  ProductsModel? viewProductsModel;

  @override
  onInit() {
    super.onInit();
    _repository = ProductsRepository();
    fetchProductsData();
  }

  Future<void> fetchProductsData() async {
    _isLoading(true);
    var productList = await _repository.getProducts();
    if (productList.runtimeType != bool) {
      try {
        List<dynamic> productData = [];
        List<dynamic> products = productList;
        viewProductsModel = productList;
        debugPrint("my product : $productList");

      } catch (e, stackTrace) {
        log(e.toString());
        log(stackTrace.toString());
        _hasError(true);
      }
    } else {
      _hasError(true);
    }
    _isLoading(false);
  }

  addProducts(
    BuildContext context, {
    required String productName,
    required String? productBarcode,
    required String? productDescription,
    required String? productImage,
    required String? productQuantityUnit,
  }) async {
    final data = {
      "name": productName,
      "barcode": productBarcode,
      "description": productDescription,
      "image": productImage,
      "subCategory": 1851,
      "brand": 1901,
      "quantity": {
        "quantity": 0,
        "unit": productQuantityUnit,
        "unitValue": 0,
        "pastQuantity": 0
      },
      "productPrice": {"price": 0, "unitPrice": 0, "mrp": 0}
    };

    dio.Response response = await ProductsRepository.addProducts(payload: data);
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Successfully Add'),
        duration: Duration(seconds: 3),
      ));

      Get.offNamed('/main');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Add failed'),
        duration: Duration(seconds: 3),
      ));
      Navigator.pop(context);
      debugPrint("status code error");
    }
  }

  deleteProducts(BuildContext context, String productId) async {
    dio.Response response =
        await ProductsRepository.deleteProducts(id: productId);
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Successfully Delete'),
        duration: Duration(seconds: 3),
      ));

      Get.offNamed('/home');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Delete failed'),
        duration: Duration(seconds: 3),
      ));
      Navigator.pop(context);
      debugPrint("status code error");
    }
  }
}
