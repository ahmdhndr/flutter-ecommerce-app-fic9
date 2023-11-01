import 'package:dartz/dartz.dart';
import 'package:flutter_fic9_ecommerce_app/common/constants/variables.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/products_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  Future<Either<String, ProductsResponseModel>> getAllProduct() async {
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/api/products?populate=*'));

    if (response.statusCode == 200) {
      return right(ProductsResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }
}
