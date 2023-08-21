import 'dart:async';
import 'package:notion_app/model/cart_model.dart';
import 'package:notion_app/model/cart_total_model.dart';
import 'package:notion_app/service/cart_service.dart';
import 'package:notion_app/utils/response.dart';

class CartStream {
  late CartApi _cartApi;

// controller
  late StreamController<ApiResponse<bool>> _cartController;
  late StreamController<ApiResponse<int>> _cartStatusController;
  late StreamController<ApiResponse<List<CartModel>>> _cartListController;
  late StreamController<ApiResponse<CartTotalModel>> _cartTotalController;

  // sink
  StreamSink<ApiResponse<bool>> get cartSink => _cartController.sink;
  StreamSink<ApiResponse<int>> get cartStatusSink => _cartStatusController.sink;
  StreamSink<ApiResponse<CartTotalModel>> get cartTotalSink =>
      _cartTotalController.sink;
  StreamSink<ApiResponse<List<CartModel>>> get cartListSink =>
      _cartListController.sink;

  // stream
  Stream<ApiResponse<bool>> get cartStream => _cartController.stream;
  Stream<ApiResponse<int>> get cartStatusStream => _cartStatusController.stream;
  Stream<ApiResponse<CartTotalModel>> get cartTotalStream =>
      _cartTotalController.stream;
  Stream<ApiResponse<List<CartModel>>> get cartListStream =>
      _cartListController.stream;

  CartStream() {
    _cartApi = CartApi();
    _cartController = StreamController<ApiResponse<bool>>();
    _cartStatusController = StreamController<ApiResponse<int>>();
    _cartTotalController = StreamController<ApiResponse<CartTotalModel>>();
    _cartListController = StreamController<ApiResponse<List<CartModel>>>();
  }

  // function that streambuilder will call and will be responsible for changing the stream

  addtoCart(menu_id, partner_id, size, quantity, amount) async {
    cartSink.add(ApiResponse.loading("Adding Data to cart"));

    try {
      bool data =
          await _cartApi.addcart(menu_id, partner_id, size, quantity, amount);
      cartSink.add(ApiResponse.completed(data));
    } catch (e) {
      cartSink.add(ApiResponse.error(e.toString()));
    }
  }

  fetchCart() async {
    cartListSink.add(ApiResponse.loading("Fetching data"));

    try {
      List<CartModel> data = await _cartApi.fetchCart();
      cartListSink.add(ApiResponse.completed(data));
    } catch (e) {
      cartListSink.add(ApiResponse.error(e.toString()));
    }
  }

  getTotal() async {
    print("callling gettotal");
    cartTotalSink.add(ApiResponse.loading("Fetching data"));

    try {
      CartTotalModel data = await _cartApi.fetchTotal();
      cartTotalSink.add(ApiResponse.completed(data));
    } catch (e) {
      cartTotalSink.add(ApiResponse.error(e.toString()));
    }
  }

  updateStatus(int cart_id, String status) async {
    cartStatusSink.add(ApiResponse.loading('Updating Quantity'));

    try {
      int data = await _cartApi.updateStatus(cart_id, status);
      cartStatusSink.add(ApiResponse.completed(data));
    } catch (e) {
      cartStatusSink.add(ApiResponse.error(e.toString()));
    }
  }
}
