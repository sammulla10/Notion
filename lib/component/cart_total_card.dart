import 'package:flutter/material.dart';

import 'package:notion_app/model/cart_total_model.dart';
import 'package:notion_app/stream/cart_stream.dart';
import 'package:notion_app/utils/response.dart';

class CartTotalCard extends StatefulWidget {
  CartStream? stream;
  CartTotalCard({
    Key? key,
    required this.stream,
  }) : super(key: key);

  @override
  State<CartTotalCard> createState() => _CartTotalCardState();
}

class _CartTotalCardState extends State<CartTotalCard> {
  // CartStream? _cartStream;

  @override
  void initState() {
    // _cartStream = CartStream();
    widget.stream?.getTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<CartTotalModel>>(
        stream: widget.stream?.cartTotalStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data!.status) {
              case Status.LOADING:
                return loadingCard();

              case Status.DONE:
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sub Amount - Rs.${snapshot.data!.data.sub_amount}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "Shipping Charges - Rs.${snapshot.data!.data.shipping_price}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Total Amount - Rs.${snapshot.data!.data.amount}",
                        style: const TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                );
              case Status.ERROR:
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sub Amount - 0",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "Shipping Charges - 0",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "Total Amount - 0",
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                );
              default:
                return loadingCard();
            }
          }
          return loadingCard();
        });
  }

  Padding loadingCard() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [CircularProgressIndicator()],
      ),
    );
  }
}
