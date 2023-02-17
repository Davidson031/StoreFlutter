import 'package:flutter/material.dart';
import 'package:seller_app/inner_screens/on_sale_screen.dart';

class GlobalMethods {

  static navigateTo({required BuildContext ctx, required String routeName}){

    Navigator.pushNamed(ctx, routeName);

  }


}