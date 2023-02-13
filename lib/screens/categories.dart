import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seller_app/services/utils.dart';
import 'package:seller_app/widgets/categories_dart.dart';
import 'package:seller_app/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';

class CategoriesScreen extends StatelessWidget {

  CategoriesScreen({super.key});

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Spices',
    },
     {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
    },
  ];

  @override
  Widget build(BuildContext context) {

    final Utils utils = Utils(context);
    Color color = utils.getColor;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextWidget(text: "Categories", color: color, textSize: 24, isTitle: true,),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240/250,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: 
            List.generate(catInfo.length, (index){
              return CategoriesWidget(catText: catInfo[index]['catText'], color: gridColors[index], imgPath: catInfo[index]['imgPath'],);
            })
        ),
      ),
    );
  }
}
