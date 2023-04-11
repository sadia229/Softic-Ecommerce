import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.name,
    required this.barcode,
    required this.description,
    required this.subCategory,
    required this.brand,
    required this.quantity,
    required this.productPrice,
    required this.image,
  });

  int id;
  String name;
  String barcode;
  String description;
  Brand subCategory;
  Brand brand;
  Quantity quantity;
  ProductPrice productPrice;
  String image;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["name"],
        barcode: json["barcode"],
        description: json["description"],
        subCategory: Brand.fromJson(json["subCategory"]),
        brand: Brand.fromJson(json["brand"]),
        quantity: Quantity.fromJson(json["quantity"]),
        productPrice: ProductPrice.fromJson(json["productPrice"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "barcode": barcode,
        "description": description,
        "subCategory": subCategory.toJson(),
        "brand": brand.toJson(),
        "quantity": quantity.toJson(),
        "productPrice": productPrice.toJson(),
        "image": image,
      };
}

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.description,
    this.image,
    this.category,
  });

  int id;
  String name;
  String description;
  String? image;
  Brand? category;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        category:
            json["category"] == null ? null : Brand.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "category": category?.toJson(),
      };
}

class ProductPrice {
  ProductPrice({
    required this.id,
    required this.price,
    required this.unitPrice,
    required this.mrp,
  });

  int id;
  int price;
  int unitPrice;
  int mrp;

  factory ProductPrice.fromJson(Map<String, dynamic> json) => ProductPrice(
        id: json["id"],
        price: json["price"],
        unitPrice: json["unitPrice"],
        mrp: json["mrp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "unitPrice": unitPrice,
        "mrp": mrp,
      };
}

class Quantity {
  Quantity({
    required this.id,
    required this.quantity,
    required this.unit,
    required this.unitValue,
    required this.pastQuantity,
  });

  int id;
  int quantity;
  String unit;
  int unitValue;
  int pastQuantity;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        id: json["id"],
        quantity: json["quantity"],
        unit: json["unit"],
        unitValue: json["unitValue"],
        pastQuantity: json["pastQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "unit": unit,
        "unitValue": unitValue,
        "pastQuantity": pastQuantity,
      };
}
