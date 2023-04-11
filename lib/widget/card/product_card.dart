import 'package:flutter/material.dart';
import 'package:softic_ecommerce/general/utils/config.dart';

class ProductsCard extends StatelessWidget {
  final VoidCallback tap;
  final String name;
  final String price;
  final String img;

  const ProductsCard({
    Key? key,
    required this.tap,
    required this.name,
    required this.price,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Image.network(img),
        title: Text(name, textScaleFactor: 1.5),
        trailing: IconButton(onPressed: tap, icon: const Icon(Icons.delete)),
        subtitle: Text(price, textScaleFactor: 1),
      ),
    );
  }
}
