import 'dart:async';

import 'package:notion_app/service/menu_service.dart';
import 'package:notion_app/utils/response.dart';
import 'package:notion_app/model/menu_model.dart';

class MenuStream {
  late MenuApi _menuApi;

// controller
  late StreamController<ApiResponse<List<MenuModel>>> _menuController;

  // sink
  StreamSink<ApiResponse<List<MenuModel>>> get menuSink => _menuController.sink;

  // stream
  Stream<ApiResponse<List<MenuModel>>> get menuStream => _menuController.stream;

  MenuStream() {
    _menuApi = MenuApi();
    _menuController = StreamController<ApiResponse<List<MenuModel>>>();
  }

  // function that streambuilder will call and will be responsible for changing the stream

  FetchMenu() async {
    menuSink.add(ApiResponse.loading("Fetching data"));

    try{
      List<MenuModel> data = await _menuApi.menuList();
      menuSink.add(ApiResponse.completed(data));
    } catch (e) {
      menuSink.add(ApiResponse.error(e.toString()));
    }
  }
}
