//import 'package:flexi_busines_platform/components/image_not_found.dart';

import 'package:flutter/material.dart';
import 'package:flutter_node_store/components/image_not_found.dart';
import 'package:flutter_node_store/models/bill_model.dart';
import 'package:flutter_node_store/utils/constants.dart';

class BillItem extends StatelessWidget {
  const BillItem({
    required this.bill,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final BillModel bill;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: onTap,
      child: LayoutBuilder(
        //map datetime sort
        builder: (context, constraint) => Stack(
            clipBehavior: Clip.none,
            alignment: Alignment(0.98, -0.65),
            children: [
              Container(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
                width: 50,
                height: 90,
                decoration: BoxDecoration(
                  color: _buildTapColor(),
                ),
              ),
              Card(
                shadowColor: const Color(0xFF2B00FF),
                elevation: 1.8,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildImage(constraint.maxHeight),
                      ],
                    ),
                    _buildInfo(),
                  ],
                ),
                //child: _buildInfo(),
              ),
            ]),
      ),
    );
  }

  // _buildTapColor Widget (Tiktok or Facebook or Line or Shopee or Lazada)
  Color _buildTapColor() {
    return (bill.platform == 'Tiktok')
        ? Color.fromARGB(255, 0, 0, 0)
        : (bill.platform == 'Line')
            ? Color.fromARGB(255, 102, 255, 143)
            : (bill.platform == 'Shopee')
                ? Color.fromARGB(255, 187, 0, 255)
                : (bill.platform == 'Lazada')
                    ? Color.fromARGB(255, 128, 0, 255)
                    : (bill.platform == 'Facebook')
                        ? Color.fromARGB(255, 50, 50, 255)
                        : const Color.fromARGB(255, 255, 255, 255);
  }

  // _buildImage Widget
  _buildImage(double maxHeight) {
    // Check list or grid view
    // Case of list view
    var height = maxHeight * 0.9;
    var width = maxHeight * 0.9;

    final image = bill.imageBill;

    return SizedBox(
      width: width,
      height: height,
      child: image != null && image.isNotEmpty
          ? _image(image)
          : const ImageNotFound(),
    );
  }

  // _image Widget
  Container _image(String image) {
    String imageUrl;
    if (image.contains('://')) {
      imageUrl = image;
    } else {
      imageUrl = '$baseURLImage$image';
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

// _buildInfo Widget
  Expanded _buildInfo() => Expanded(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 23.0,
          right: 18.0,
          top: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${bill.purchaseAt}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 155, 158, 168))),
                Text(' ${bill.payment}',
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF3700))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' ${bill.customerName}',
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF303F9F))),
                Text('${bill.promotion} ${bill.price}',
                    style: const TextStyle(
                        fontSize: 16.0, color: Color(0xFF898787))),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                icon: const Icon(Icons.phone_rounded),
                iconSize: 20,
                style: IconButton.styleFrom(foregroundColor: Colors.grey[600]),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.local_shipping_rounded),
                iconSize: 20,
                style: IconButton.styleFrom(foregroundColor: Colors.grey[600]),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.monetization_on_rounded),
                iconSize: 20,
                style: IconButton.styleFrom(
                    foregroundColor: const Color(0xFF757575)),
                onPressed: () {},
              )
            ])
          ],
        ),
      ));
}
