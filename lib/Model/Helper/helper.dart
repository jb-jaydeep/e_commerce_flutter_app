import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model.dart';

class APIHelper {
  APIHelper._();

  static APIHelper apiHelper = APIHelper._();

  Future<List<Product>?> callApi() async {
    String Url = "https://dummyjson.com/products?limit=100";

    http.Response response = await http.get(Uri.parse(Url));

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);
      List allData = decodedData['products'];
      List<Product> myData = [];
      allData.forEach((e) {
        myData.add(
          Product.formMap(data: e),
        );
      });
      return myData;
    }
    return null;
  }
}
