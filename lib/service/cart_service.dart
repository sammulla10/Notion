import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:notion_app/model/cart_model.dart';
import 'package:notion_app/model/cart_total_model.dart';
import 'package:notion_app/utils/api_exception.dart';

class CartApi {
  Future<dynamic> fetchCart() async {
    print("Calling fetch cart");
    try {
      http.Response res = await http.get(
          Uri.parse(
              "https://mumbaimillionaires.in/mmApi/api/show/cart?customer_id=976"),
          headers: {'Content-Type': 'application/json'});

      print("done calling api");
      var responseBody = _returnResponse(res);
      print("returing data");

      List<CartModel> cartData = List.from(responseBody['data'])
          .map((item) => CartModel.fromMap(item))
          .toList();

      print(cartData);
      return cartData;
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  Future<dynamic> addcart(int menu_id, int partner_id, String size,
      int quantity, int amount) async {
    try {
      http.Response res = await http.post(
          Uri.parse("https://mumbaimillionaires.in/mmApi/api/add/cart"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "menu_id": menu_id,
            "partner_id": partner_id,
            "customer_id": 976,
            "quantity": quantity,
            "size": size,
            "amount": amount,
          }));

      var responseBody = _returnResponse(res);

      return true;
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  Future<dynamic> fetchTotal() async {
    print("Calling fetch total");

    try {
      http.Response res = await http.post(
          Uri.parse('https://mumbaimillionaires.in/mmApi/api/cart/total'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'customer_id': 976}));

      var responseBody = _returnResponse(res);

      CartTotalModel data = CartTotalModel.fromMap(responseBody['data']);

      return data;
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  Future<dynamic> updateStatus(int cart_id, String status) async {
    try {
      http.Response res = await http.post(
          Uri.parse(
              'https://mumbaimillionaires.in/mmApi/api/add-remove/quantity/cart'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({"cart_id": cart_id, "status": status}));
      var responseBody = _returnResponse(res);

      return responseBody["cart"]["quantity"];
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 201:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 204:
      return "true";
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw BadRequestException(response.body.toString());
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
