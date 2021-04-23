import 'package:http/http.dart' as http;

import '../models/product.dart';

class RemoteServices{
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async{
    print("Calling Api");

    // var uri = 'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
    var response = await client.get(
        Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if(response.statusCode == 200){
        var jsonString = response.body;
        var products = productFromJson(jsonString);
        for(var item in products){
          print(item.name);
        }
        return products;
    }else{
      print("API response code ${response.statusCode}");
    }
  }
}