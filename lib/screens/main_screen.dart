import 'package:flutter/material.dart';
import 'package:notion_app/component/menu_card.dart';

import 'package:notion_app/model/menu_model.dart';
import 'package:notion_app/screens/add_sheet.dart';
import 'package:notion_app/stream/cart_stream.dart';
import 'package:notion_app/stream/menu_stream.dart';
import 'package:notion_app/utils/response.dart';
import 'package:notion_app/utils/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CartStream? _cartListStream;

  MenuStream? _menuStream;
  List<MenuModel>? data = [];

  @override
  void initState() {
    _menuStream = MenuStream();
    _menuStream?.FetchMenu();
    super.initState();
  }

  void _addsheet(int menu_id, int partner_id, String size, int dprice,
      int rdprice, int mdprice, int ldprice) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddSheet(
          menu_id: menu_id,
          partner_id: partner_id,
          size: size,
          dprice: dprice,
          rdprice: rdprice,
          mdprice: mdprice,
          ldprice: ldprice),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cart);
                },
                icon: Icon(Icons.shopping_cart_sharp))
          ],
          title: const Text(
            "Food App",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Menu",
              style: TextStyle(fontSize: 30),
            ),
            StreamBuilder<ApiResponse<List<MenuModel>>>(
              stream: _menuStream?.menuStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data?.status) {
                    case Status.LOADING:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.DONE:
                      data = snapshot.data?.data;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data?.length,
                        itemBuilder: (context, index) {
                          return MenuCard(
                              addCartmain: _addsheet,
                              amount: data![index].discounted_price,
                              menu_id: data![index].id,
                              partner_id: data![index].partner_id,
                              quantity: data![index].cart_quantity,
                              size: data![index].size_type,
                              foodName: data![index].name,
                              hotelName: data![index].hotel_name,
                              isVeg: data![index].food_type == "Veg",
                              dprice: data![index].discounted_price,
                              oprice: data![index].original_price,
                              rdprice: data![index].regular_discounted_price,
                              mdprice: data![index].medium_discounted_price,
                              ldprice: data![index].large_discounted_price,
                              rating: data![index].rating,
                              image: data![index]
                                  .image); // id, partner_id, size_type, cart_quantity, discounted_price
                        },
                      );
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
              },
            )
          ]),
        ),
      ),
    );
  }
}
