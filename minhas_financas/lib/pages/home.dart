import 'package:flutter/material.dart';
import 'package:minhas_financas/routes/routes_generator.dart';
import 'package:minhas_financas/shared/constants.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required String title}) : _title = title, super(key: key);
  const MyHomePage({super.key, required String title}) : _title = title;

  final String _title;
  get name => _title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.name),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppConstants.clickNewPage),
          ],
        ),
      ),
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
