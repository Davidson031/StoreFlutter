import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:seller_app/provider/dark_theme_provider.dart';
import 'package:seller_app/services/utils.dart';

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

    return Scaffold(
      body: SizedBox(
        height: size.height *0.33,
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
              color: Colors.white,
              activeColor: Colors.red
            ),
            alignment: Alignment.bottomCenter
          ),
        ),
      ),
    );
  }
}
