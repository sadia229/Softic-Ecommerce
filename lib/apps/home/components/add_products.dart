import 'package:flutter/material.dart';
import 'package:softic_ecommerce/apps/home/controller/products_controller.dart';
import 'package:softic_ecommerce/widget/appbar/k_appbar.dart';
import 'package:softic_ecommerce/widget/button/custom_btn.dart';
import 'package:softic_ecommerce/widget/textfield/text_field.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController name = TextEditingController();
  TextEditingController barcode = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController unit = TextEditingController();
  ViewProductsController controller = ViewProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: KAppBar(title: "Add Products"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            KTextField(
              controller: name,
              hintText: "Enter Product Name",
              passwordVisible: false,
            ),
            const SizedBox(height: 20),
            KTextField(
              controller: barcode,
              hintText: "Enter Product Barcode",
              passwordVisible: false,
            ),
            const SizedBox(height: 20),
            KTextField(
              controller: description,
              hintText: "Enter Product Description",
              passwordVisible: false,
            ),
            const SizedBox(height: 20),
            KTextField(
              controller: unit,
              hintText: "Enter Quantity Unit",
              passwordVisible: false,
            ),
            const SizedBox(height: 20),
            KButton(
              data: "Add Products",
              onPressed: () {
                controller.addProducts(
                  context,
                  productName: name.text,
                  productBarcode: barcode.text,
                  productDescription: description.text,
                  productImage: "",
                  productQuantityUnit: unit.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
