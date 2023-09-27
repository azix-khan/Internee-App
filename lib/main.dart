import 'package:flutter/material.dart';
import 'package:mytasks/Screens/welcome_screen.dart';
import 'package:mytasks/provider/checkbox_provider.dart';
import 'package:mytasks/provider/theme_changer_provider.dart';
import 'package:mytasks/provider/visibility_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IconVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => CheckboxProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: const Color(0xff78C6F2),
            scaffoldBackgroundColor: const Color(0xff78C6F2),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: const WelcomeScreen(),
        );
      }),
    );
  }
}
