// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:seller_app/services/utils.dart';
import 'package:seller_app/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {

  final double salePrice;
  final double normalPrice;
  final String textPrice;
  final bool isOnSale;


  const PriceWidget({
    Key? key,
    required this.salePrice,
    required this.normalPrice,
    required this.textPrice,
    required this.isOnSale,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    final Utils utils = Utils(context);
    final Size size = utils.screenSize;
    final bool theme = utils.getTheme;
    final Color color = utils.getColor;
    double userPrice = isOnSale ? salePrice : normalPrice;

    return FittedBox(
      child: Row(
        children: [
          TextWidget(text: "\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}", color: Colors.green, textSize: 18),
          const SizedBox(
            height: 5,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              "\$${(normalPrice * int.parse(textPrice)).toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.red,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          )
        ],
      ),
    );
  }
}
