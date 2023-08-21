import 'package:flutter/material.dart';

import 'package:notion_app/stream/cart_stream.dart';
import 'package:notion_app/utils/appcolors.dart';
import 'package:notion_app/utils/response.dart';

class CartCard extends StatefulWidget {
  CartStream? stream;
  int id;
  int index;
  int menu_id;
  String customer_id;
  int partner_id;
  int quantity;
  String menu_name;
  String menu_image;
  int menu_price;
  String uploaded_from;
  String size;
  String hotel_name;
  void Function(int id) removeItm;
  CartCard({
    Key? key,
    required this.stream,
    required this.id,
    required this.index,
    required this.menu_id,
    required this.customer_id,
    required this.partner_id,
    required this.quantity,
    required this.menu_name,
    required this.menu_image,
    required this.menu_price,
    required this.uploaded_from,
    required this.size,
    required this.hotel_name,
    required this.removeItm,
  }) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  CartStream? _cartStream;

  @override
  void initState() {
    _cartStream = CartStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderClr)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.menu_name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.hotel_name,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  StreamBuilder<ApiResponse<int>>(
                    stream: _cartStream!.cartStatusStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return disabledquantityRow();
                          case Status.DONE:
                            return quantityRow(snapshot.data!.data);
                          case Status.ERROR:
                            return quantityRow(widget.quantity);
                          default:
                            return quantityRow(widget.quantity);
                        }
                      } else {
                        return quantityRow(widget.quantity);
                      }
                    },
                  ),
                  Text(
                    "${widget.menu_price}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 150,
              height: 150,
              child: Image.network(
                'https://mumbaimillionaires.in/mmApi${widget.menu_image}',
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {

                  return Image.asset(
                      'assets/images/No_Image_Available.jpg');
                },
              ),
            )
          ],
        ));
  }

  Row quantityRow(int qty) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            await _cartStream!.updateStatus(widget.id, "Remove");
            widget.stream!.getTotal();

            if (qty == 1) {
              widget.removeItm(widget.index);
            }
          },
          icon: const Icon(Icons.remove),
        ),
        Text("$qty"),
        IconButton(
          onPressed: () async {
            await _cartStream!.updateStatus(widget.id, "Add");
            widget.stream!.getTotal();
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  Row disabledquantityRow() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove),
        ),
        CircularProgressIndicator(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
