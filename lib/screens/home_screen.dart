import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:seller_app/inner_screens/feeds_screen.dart';
import 'package:seller_app/inner_screens/on_sale_screen.dart';
import 'package:seller_app/provider/dark_theme_provider.dart';
import 'package:seller_app/services/global_methods.dart';
import 'package:seller_app/services/utils.dart';
import 'package:seller_app/widgets/feed_items.dart';
import 'package:seller_app/widgets/on_sale_widget.dart';
import 'package:seller_app/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    'assets/images/offres/Offer1.jpg',
    'assets/images/offres/Offer2.jpg',
    'assets/images/offres/Offer3.jpg',
    'assets/images/offres/Offer4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.screenSize;
    final Color color = utils.getColor;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _offerImages.length,
                pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red),
                    alignment: Alignment.bottomCenter),
              ),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(ctx: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: "View all",
                color: Colors.blue,
                textSize: 20,
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: "On sale".toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.26,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return OnSaleWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Our products",
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(ctx: context, routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                      text: "Browse all",
                      color: Colors.blue,
                      textSize: 20,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.7),
              //crossAxisSpacing: 10,
              children: List.generate(4, (index){
                return FeedItems();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
