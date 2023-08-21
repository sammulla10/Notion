import 'package:flutter/material.dart';
import 'package:notion_app/stream/cart_stream.dart';
import 'package:notion_app/utils/response.dart';

enum SingingCharacter { lafayette, jefferson }

class AddSheet extends StatefulWidget {
  final int menu_id;
  final int partner_id;
  final String size;
  final int dprice;
  final int rdprice;
  final int mdprice;
  final int ldprice;

  const AddSheet(
      {super.key,
      required this.menu_id,
      required this.partner_id,
      required this.size,
      required this.dprice,
      required this.rdprice,
      required this.mdprice,
      required this.ldprice});

  @override
  State<AddSheet> createState() => _AddSheetState();
}

class _AddSheetState extends State<AddSheet> {
  CartStream? _cartStream;
  int qty = 1;
  late int? amount = widget.size != "Standard" ? widget.rdprice : widget.dprice;

  @override
  void initState() {
    _cartStream = CartStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quantity"),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      qty = qty - 1;
                    });
                  },
                  icon: Icon(Icons.remove)),
              Text('$qty'),
              IconButton(
                  onPressed: () {
                    setState(() {
                      qty = qty + 1;
                    });
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
          Text("Size"),
          widget.size != "Standard"
              ? Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Regular - ${widget.rdprice}'),
                      leading: Radio<int>(
                        value: widget.rdprice,
                        groupValue: amount,
                        onChanged: (int? value) {
                          setState(() {
                            amount = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Medium - ${widget.mdprice}'),
                      leading: Radio<int>(
                        value: widget.mdprice,
                        groupValue: amount,
                        onChanged: (int? value) {
                          setState(() {
                            amount = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Large - ${widget.ldprice}'),
                      leading: Radio<int>(
                        value: widget.ldprice,
                        groupValue: amount,
                        onChanged: (int? value) {
                          setState(() {
                            amount = value;
                          });
                        },
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  height: 0,
                ),
          StreamBuilder<ApiResponse<bool>>(
              stream: _cartStream!.cartStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data?.status) {
                    case Status.LOADING:
                      return loadingBtn();
                    case Status.DONE:
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pop(context);
                      });
                      break;
                    case Status.ERROR:
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          snapshot.data!.msg,
                          style: TextStyle(fontSize: 20),
                        )));
                      });
                      return addtoCartBtn();
                    default:
                      return addtoCartBtn();
                  }
                }
                return addtoCartBtn();
              }),
          MaterialButton(
            minWidth: double.infinity,
            onPressed: () => Navigator.pop(context),
            color: Colors.redAccent,
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  MaterialButton addtoCartBtn() {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {
        _cartStream!.addtoCart(
            widget.menu_id, widget.partner_id, widget.size, qty, amount);
      },
      color: Colors.amber,
      child: Text("Add to cart"),
    );
  }

  MaterialButton loadingBtn() {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {},
      color: Colors.amber,
      child: CircularProgressIndicator(),
    );
  }
}
