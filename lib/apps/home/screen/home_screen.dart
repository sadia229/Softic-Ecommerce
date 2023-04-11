import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:softic_ecommerce/apps/home/components/add_products.dart';
import 'package:softic_ecommerce/apps/home/controller/products_controller.dart';
import 'package:softic_ecommerce/widget/appbar/k_appbar.dart';
import 'package:get/get.dart';
import 'package:softic_ecommerce/widget/card/product_card.dart';

import '../../auth/model/auth_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ViewProductsController products = Get.put(ViewProductsController());
  ViewProductsController productsController = ViewProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: KAppBar(title: "Home"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Obx(() {
                if (products.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (products.hasError) {
                  return const Center(
                    child: Text("Opps, something went wrong"),
                  );
                }
                if (products.viewProductsModel! == null) {
                  return const Center(
                    child: Text("No data found."),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (ctx, index) {
                    return ProductsCard(
                      tap: () {
                        productsController.deleteProducts(
                          context,
                          products.viewProductsModel!.id.toString(),
                        );
                      },
                      name: products.viewProductsModel!.name,
                      price: products.viewProductsModel!.productPrice.price
                          .toString(),
                      img: products.viewProductsModel!.image,
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(const AddProducts());
        },
        // isExtended: true,
        child: const Icon(Icons.add),
      ),
    );
  }
}
