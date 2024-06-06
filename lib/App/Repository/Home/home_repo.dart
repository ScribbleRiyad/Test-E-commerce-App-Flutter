import 'dart:convert';

import 'package:flutter/services.dart';

import '../../Model/Product/product_model_data.dart';



class HomeRepository {
   Future<List<Product>> fetchProducts() async {
      final String response = await rootBundle.loadString('assets/Json/response.json');
      final data = await json.decode(response);
      print(response);
      return (data as List).map((json) => Product.fromJson(json)).toList();
   }

}



