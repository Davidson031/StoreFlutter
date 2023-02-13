// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'package:seller_app/provider/dark_theme_provider.dart';
import 'package:seller_app/services/utils.dart';
import 'package:seller_app/widgets/text_widget.dart';

class CategoriesWidget extends StatelessWidget {

  final String catText;
  final String imgPath;
  final Color color;

  const CategoriesWidget({
    Key? key,
    required this.catText,
    required this.imgPath,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    double _screenWidth = MediaQuery.of(context).size.width;
    Utils utils = Utils(context);
    final Color colorTheme = utils.getColor;

    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.7), width: 2)),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            TextWidget(text: catText, color: colorTheme, textSize: 20, isTitle: true)
          ],
        ),
      ),
    );
  }
}
