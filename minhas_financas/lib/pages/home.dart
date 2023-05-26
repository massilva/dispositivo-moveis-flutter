import 'package:flutter/material.dart';

import '../routes/routes_generator.dart';
import '../shared/constants.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required String userName}) : _userName = userName, super(key: key);
  const MyHomePage({super.key, required String userName})
      : _userName = userName;

  final String _userName;
  get name => _userName;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'lib/assets/images/logo.png',
            width: 40,
          ),
        ),
        //title: Image.network(
        //  'https://cdn1.iconfinder.com/data/icons/sharovar-outline/128/Pie_chart-512.png',
        //),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // padding: EdgeInsets.symmetric(),
          // padding: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppConstants.welcome),
              Text(
                widget.name,
                style: const TextStyle(
                  color: Color(0xFF0055b3),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      // body: const Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //   ],
      // ),

      // const Center(
      //   child: Icon(
      //     Icons.money_off,
      //     size: 64,
      //     color: Colors.blueGrey,
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //chamar a página de cadastro
          Navigator.of(context).pushNamed(RoutesGenerator.addPage);
        },
        tooltip: AppConstants.newPage,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
