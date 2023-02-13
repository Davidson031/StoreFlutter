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
  final TextEditingController _addressTextController =
      TextEditingController(text: "");

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

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
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                TextWidget(
                    text: "email@email.com",
                    color: color,
                    textSize: 18,
                    isTitle: false),
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
                    onPressed: () async {
                      _showAddressDialog();
                    }),
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
                  title: TextWidget(
                      text:
                          themeState.getDarkTheme ? "Dark mode" : "Light mode",
                      color: color,
                      textSize: 18,
                      isTitle: false),
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
                  onPressed: () {
                    _showLogoutDialog();
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "assets/images/warning-sign.png",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 8),
              const Text("Sign Out"),
            ],
          ),
          content: Text("Do you wanna sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              },
              child:
                  TextWidget(text: "Cancel", color: Colors.cyan, textSize: 14),
            ),
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              },
              child: TextWidget(text: "Ok", color: Colors.red, textSize: 14),
            )
          ],
        );
      },
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Address"),
          content: TextField(
            onChanged: (value) {},
            controller: _addressTextController,
            maxLines: 5,
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text("Update"),
            ),
          ],
        );
      },
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
      onTap: () => onPressed(),
    );
  }
}
