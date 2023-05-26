import 'package:flutter/material.dart';

import 'routes/routes_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo', //título
      theme: ThemeData(
        //Tema do aplicativo
        primarySwatch: MaterialColor(
          Colors.white.value,
          const {
            50: Colors.white,
            100: Colors.white,
            200: Colors.white,
            300: Colors.white,
            400: Colors.white,
            500: Colors.white,
            600: Colors.white,
            700: Colors.white,
            800: Colors.white,
            900: Colors.white,
          },
        ),
        // useMaterial3: false,
      ),
      //home: const MyHomePage(title: ""),
      // Rota inicial
      initialRoute: RoutesGenerator.homePage,
      // Função geradora de rota
      onGenerateRoute: RoutesGenerator.generate,
    );
  }
}
