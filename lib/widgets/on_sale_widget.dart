import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:seller_app/services/utils.dart';
import 'package:seller_app/widgets/favorite_button.dart';
import 'package:seller_app/widgets/price_widget.dart';
import 'package:seller_app/widgets/text_widget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final Size size = utils.screenSize;
    final bool theme = utils.getTheme;
    final Color color = utils.getColor;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
                      height: size.width * 0.22,
                      width: size.width * 0.22,
                      boxFit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: "1KG",
                          color: color,
                          textSize: 22,
                          isTitle: true,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag,
                                size: 22,
                                color: color,
                              ),
                            ),
                            FavoriteButton()
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                PriceWidget(isOnSale: true, normalPrice: 1.99, salePrice: 1.49, textPrice: "1"),
                const SizedBox(height: 5),
                TextWidget(
                  text: "Product Title",
                  color: color,
                  textSize: 16,
                  isTitle: true,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
