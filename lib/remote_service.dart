import 'package:flutter_arch_app_getx/model.dart';
import 'package:http/http.dart' as http;
class RemoteServices {

  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var res = await client.get('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    if (res.statusCode == 200) {
      var jsonString = res.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

}