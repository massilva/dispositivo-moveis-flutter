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
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        // useMaterial3: false,
      ),
      // Rota inicial
      initialRoute: RoutesGenerator.homePage,
      // Função geradora de rota
      onGenerateRoute: RoutesGenerator.generate,
    );
  }
}
