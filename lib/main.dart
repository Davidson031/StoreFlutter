import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:seller_app/consts/theme_data.dart';
import 'package:seller_app/provider/dark_theme_provider.dart';
import 'package:seller_app/screens/btm_bar.dart';
import 'screens/home_screen.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();

  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(MyApp());
    });
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme = await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sellers App',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: BottomBarScreen(),
          );
        }
      ),
    );
  }
}

