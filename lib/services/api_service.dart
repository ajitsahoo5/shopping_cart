import 'package:dio/dio.dart';
import 'package:shopping_cart/models/product.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get('$_baseUrl/products');
      List data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } catch(e) {
      throw Exception('Failed to load products');
    }
  }
}