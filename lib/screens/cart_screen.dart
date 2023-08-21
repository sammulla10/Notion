import 'package:flutter/material.dart';
import 'package:notion_app/component/cart_card.dart';
import 'package:notion_app/component/cart_total_card.dart';
import 'package:notion_app/model/cart_model.dart';
import 'package:notion_app/stream/cart_stream.dart';
import 'package:notion_app/utils/response.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartStream? _cartListStream;
  CartStream? _cartToStream;
  List<CartModel>? cartdata = [];

  @override
  void initState() {
    _cartListStream = CartStream();
    _cartToStream = CartStream();
    _cartListStream?.fetchCart();
    super.initState();
  }

  void removeItem(int id) {
    var rm = cartdata![id];
    setState(() {
      cartdata!.remove(rm);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CartTotalCard(stream: _cartToStream),
        appBar: AppBar(
          title: const Text(
            'Cart',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<ApiResponse<List<CartModel>>>(
                    stream: _cartListStream?.cartListStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data?.status) {
                          case Status.LOADING:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case Status.DONE:
                            cartdata = snapshot.data?.data;
                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cartdata?.length,
                                itemBuilder: (context, index) {
                                  return CartCard(
                                      removeItm: removeItem,
                                      index: index,
                                      stream: _cartToStream,
                                      id: cartdata![index].id,
                                      menu_id: cartdata![index].menu_id,
                                      customer_id: cartdata![index].customer_id,
                                      partner_id: cartdata![index].partner_id,
                                      quantity: cartdata![index].quantity,
                                      menu_name: cartdata![index].menu_name,
                                      menu_image: cartdata![index].menu_image,
                                      menu_price: cartdata![index].menu_price,
                                      uploaded_from:
                                          cartdata![index].uploaded_from,
                                      size: cartdata![index].size,
                                      hotel_name: cartdata![index].hotel_name);
                                });
                          case Status.ERROR:
                            return Center(
                              child: Text(snapshot.data!.msg),
                            );
                          default:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
