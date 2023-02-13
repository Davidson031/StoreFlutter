import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:seller_app/provider/dark_theme_provider.dart';
import 'package:seller_app/widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    text: "Hi,  ",
                    style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: "MyName",
                        style: TextStyle(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          print("my name was pressed");
                        }
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                TextWidget(text: "email@email.com", color: color, textSize: 18, isTitle: false),
                const SizedBox(height: 20),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(height: 20),
                _listTiles(
                    title: "Address",
                    subtitle: "my subtitle",
                    icon: IconlyBold.profile,
                    color: color,
                    onPressed: () {}),
                _listTiles(
                  title: "Orders",
                  subtitle: "my subtitle",
                  icon: IconlyBold.bag,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: "Wishlist",
                  icon: IconlyLight.heart,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: "Recover Password",
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: "Viewed Items",
                  icon: IconlyLight.show,
                  onPressed: () {},
                  color: color,
                ),
                SwitchListTile(
                  title: TextWidget(text: themeState.getDarkTheme ? "Dark mode" : "Light mode", color: color, textSize: 18, isTitle: false),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  value: themeState.getDarkTheme,
                  onChanged: (value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                ),
                _listTiles(
                  title: "Logout",
                  icon: IconlyLight.logout,
                  onPressed: () {},
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTiles(
      {required String title,
      String? subtitle,
      required IconData icon,
      required Function onPressed,
      required Color color}) {
    return ListTile(
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      title:
          TextWidget(text: title, color: color, textSize: 22, isTitle: false),
      subtitle: TextWidget(
          text: subtitle == null ? "" : subtitle,
          color: color,
          textSize: 15,
          isTitle: false),
      onTap: () => onPressed,
    );
  }
}
