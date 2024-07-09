import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/count_provider.dart';
import 'package:provider_tutorial/provider/example_provider.dart';
import 'package:provider_tutorial/provider/favourite_provider.dart';
import 'package:provider_tutorial/provider/theme_changerProvider.dart';
import 'package:provider_tutorial/screens/count_provider_screen.dart';
import 'package:provider_tutorial/screens/example_one_screen.dart';
import 'package:provider_tutorial/screens/favourite/favourite_screen.dart';
import 'package:provider_tutorial/screens/home_screen.dart';
import 'package:provider_tutorial/screens/statefulwidget_screen.dart';
import 'package:provider_tutorial/screens/themeChange/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerprovider())
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerprovider>(context);

          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: DarkThemeScreen(),
          );
        }));
  }
}
