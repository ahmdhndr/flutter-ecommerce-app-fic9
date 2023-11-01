import 'package:flutter_fic9_ecommerce_app/common/constants/images.dart';
import 'package:flutter_fic9_ecommerce_app/common/extensions/currency_format.dart';

class ProductModel {
  final List<String> images;
  final String name;
  final int price;

  ProductModel({required this.images, required this.name, required this.price});

  String get priceFormat => price.currencyFormatRp;
}

final products = [
  ProductModel(
    images: [Images.product1],
    name: 'Tas Kekinian',
    price: 200000,
  ),
  ProductModel(
    images: [Images.product2],
    name: 'Earphone',
    price: 199999,
  ),
  ProductModel(
    images: [Images.product3],
    name: 'Sepatu Pria',
    price: 700000,
  ),
  ProductModel(
    images: [Images.product4],
    name: 'Earphone',
    price: 670000,
  ),
];
