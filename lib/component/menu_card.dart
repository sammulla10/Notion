import 'package:flutter/material.dart';
import 'package:notion_app/stream/cart_stream.dart';
import 'package:notion_app/utils/appcolors.dart';

class MenuCard extends StatefulWidget {
  final void Function(int menu_id, int partner_id, String size, int dprice,
      int rdprice, int mdprice, int ldprice) addCartmain;

  final int menu_id;
  final int partner_id;
  final int? quantity;
  final String size;
  final int amount;
  final String foodName;
  final bool isVeg;
  final String hotelName;
  final int rating;
  final int dprice;
  final int oprice;
  final int rdprice;
  final int mdprice;
  final int ldprice;
  final String? image;

  const MenuCard({
    Key? key,
    required this.menu_id,
    required this.partner_id,
    this.quantity,
    required this.size,
    required this.amount,
    required this.foodName,
    required this.isVeg,
    required this.hotelName,
    required this.rating,
    required this.dprice,
    required this.oprice,
    required this.image,
    required this.addCartmain,
    required this.rdprice,
    required this.mdprice,
    required this.ldprice,
  }) : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderClr)),
      child: Row(
        children: [
          Expanded(
            // flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.foodName,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    widget.isVeg
                        ? VegChip('VEG', AppColors.veg)
                        : VegChip('Non-VEG', AppColors.nonveg)
                  ],
                ),
                Text(widget.hotelName),
                Text("(${widget.rating.toString()})"),
                Row(
                  children: [
                    Text(
                      "Rs ${widget.dprice}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${widget.oprice}",
                      style: const TextStyle(
                          fontSize: 12, decoration: TextDecoration.lineThrough),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                addtocartbtn(),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          widget.image == null
              ? Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/No_Image_Available.jpg'))
              : Container(
                  width: 150,
                  height: 150,
                  child: Image.network(
                    'https://mumbaimillionaires.in/mmApi${widget.image}',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                          'assets/images/No_Image_Available.jpg');
                    },
                  ),
                )
        ],
      ),
    );
  }

  ElevatedButton addtocartbtn() {
    return ElevatedButton(
      onPressed: () {
        widget.addCartmain(
          widget.menu_id,
          widget.partner_id,
          widget.size,
          widget.dprice,
          widget.rdprice,
          widget.mdprice,
          widget.ldprice,
        );
      },
      child: Icon(Icons.add_shopping_cart),
    );
  }

  Chip VegChip(String label, Color color) {
    return Chip(
      label: Text(
        label,
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
      labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: color,
    );
  }
}
