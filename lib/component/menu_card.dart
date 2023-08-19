import 'package:flutter/material.dart';
import 'package:notion_app/utils/appcolors.dart';

class MenuCard extends StatelessWidget {
  final String foodName;
  final bool isVeg;
  final String hotelName;
  final int rating;
  final int dprice;
  final int oprice;
  final String? image;

  const MenuCard({
    super.key,
    required this.foodName,
    required this.isVeg,
    required this.hotelName,
    required this.rating,
    required this.dprice,
    required this.oprice,
    required this.image,
  });

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
                        foodName,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    isVeg
                        ? VegChip('VEG', AppColors.veg)
                        : VegChip('Non-VEG', AppColors.nonveg)
                  ],
                ),
                Text(hotelName),
                Text("(${rating.toString()})"),
                Row(
                  children: [
                    Text(
                      "Rs $dprice",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Rs $oprice",
                      style: const TextStyle(
                          fontSize: 15, decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          image == null
              ? Text("KOKO")
              : Container(
                  width: 150,
                  height: 150,
                  // child: Image.network(
                  //   "https://mumbaimillionaires.in/mmApi$image",
                  //   errorBuilder: (context, error, stackTrace) {
                  //     return Text('No Image');
                  //   },
                  //   loadingBuilder: (BuildContext context, Widget child,
                  //       ImageChunkEvent? loadingProgress) {
                  //     if (loadingProgress == null) return child;
                  //     return Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   },
                  //   fit: BoxFit.cover,
                  // ),
                  // child: FadeInImage(
                  //   image: NetworkImage(
                  //       "https://mumbaimillionaires.in/mmApi$image",),
                  //   placeholder: const AssetImage(
                  //       "assets/images/No_Image_Available.jpg"),
                  //   imageErrorBuilder: (context, error, stackTrace) {
                  //     return Image.asset('assets/images/No_Image_Available.jpg',
                  //         fit: BoxFit.fitWidth);
                  //   },
                  //   fit: BoxFit.fitWidth,
                  // ),
                  // child: CachedNetworkImage(
                  //   placeholder: (context, url) =>
                  //       Center(child: new CircularProgressIndicator()),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  //   imageUrl: "https://mumbaimillionaires.in/mmApi$image",
                  //   imageBuilder: (context, imageProvider) => Container(
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: imageProvider,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  //   fit: BoxFit.fill,
                  // ),
                  child: Image.network(
                    'https://mumbaimillionaires.in/mmApi/public/storage/image/menu/juice.jpg',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      // Appropriate logging or analytics, e.g.
                      // myAnalytics.recordError(
                      //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                      //   exception,
                      //   stackTrace,
                      // );
                      return const Text('ð¢');
                    },
                  ),
                )
        ],
      ),
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
