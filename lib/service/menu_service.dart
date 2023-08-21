import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:notion_app/model/menu_model.dart';
import 'package:notion_app/utils/api_exception.dart';

class MenuApi {
  // Menu list api
  Future<dynamic> menuList() async {
    try {
      http.Response res = await http.get(
          Uri.parse("https://mumbaimillionaires.in/mmApi/api/show/menu-list"),
          headers: {'Content-Type': 'application/json'});

      // {
      //  statusCode : 200,
      // body:{
      // main data}
      // }
      
      var responseBody = _returnResponse(res);
      
      List<MenuModel> menuData = List.from(responseBody['data'])
          .map((item) => MenuModel.fromMap(item))
          .toList();

      return menuData;
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }
}
// copied

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
