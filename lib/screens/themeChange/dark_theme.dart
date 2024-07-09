import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:provider_tutorial/provider/theme_changerProvider.dart";

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("themeChanger"),
      ),
      body: Column(
        children: [
          Center(child: Text("Theme Mode")),
          RadioListTile<ThemeMode>(
              title: Text("light Mode"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text("dark mode"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text("system mode"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
        ],
      ),
    );
  }
}
