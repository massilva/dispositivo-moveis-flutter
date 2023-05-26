import 'package:flutter/material.dart';

import '../shared/constants.dart';

class AddClickPage extends StatelessWidget {
  // const AddClickPage({Key? key });
  const AddClickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                //ao clique voltar para a página anterior
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back),
              ),
              const Text(
                AppConstants.newPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
