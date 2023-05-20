import 'package:flutter/material.dart';
import 'package:minhas_financas/routes/routes_generator.dart';

import 'pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myHome = const MyHomePage(title: 'Flutter Demo Home Page');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo', //título
      theme: ThemeData(
        //Tema do aplicativo
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        // useMaterial3: false,
      ),
      home: myHome,
      // Rota inicial
      initialRoute: RoutesGenerator.homePage,
      // Função geradora de rota
      onGenerateRoute: RoutesGenerator.generate,
    );
  }
}
