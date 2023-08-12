import 'package:ecommerce_flutter_app/Views/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/Provider.dart';
import 'Views/DetailsPage.dart';
import 'Views/IntroScreen.dart';
import 'Views/SplashScreen.dart';
import 'Views/cartPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // bool visited = pref.getBool("isIntroVisited") ?? false;
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PlatformProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ItemIncrement(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ConnectionProvider(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => WeatherProvider(),
        ],
        builder: (context, _) {
          return MaterialApp(
            // theme: ThemeData(
            //   useMaterial3: true,
            //   // colorScheme: const ColorScheme.light(),
            // ),
            // darkTheme: ThemeData(
            //   useMaterial3: true,
            //   colorScheme: const ColorScheme.dark(
            //     brightness: Brightness.dark,
            //   ),
            // ),
            // themeMode: Provider.of<ThemeProvider>(context).isdark
            //     ? ThemeMode.dark
            //     : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            // initialRoute: (visited) ? 'SplashScreen' : 'IntroScreen',
            initialRoute: 'home',
            routes: {
              'home': (context) => const homePage(),
              'detail': (context) => const DetailPage(),
              'cart': (context) => const CartPage(),
            },
          );
        }),
  );
}
