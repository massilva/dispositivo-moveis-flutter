import 'package:flutter/material.dart';
import 'package:minhas_financas/components/input_default.dart';
import 'package:minhas_financas/shared/styles.dart';

import '../../../components/image_header_default.dart';

class CategoryAddPage extends StatelessWidget {
  final TextEditingController? _nameController;

  CategoryAddPage({super.key}) : _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const ImageHeaderDefault(),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputDefault(
                  labelText: 'Nome',
                  controller: _nameController,
                ),
                const Divider(),
                const InputDefault(labelText: 'Cor'),
                const Divider(),
                const InputDefault(
                  labelText: 'Descrição',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppStyle.white,
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                AppStyle.primaryColor,
              ),
              foregroundColor: MaterialStatePropertyAll(
                AppStyle.white,
              ),
            ),
            onPressed: () {
              print('Clicado: ${_nameController!.text}');
            },
            child: const Text('Salvar'),
          ),
        ),
      ),
    );
  }
}
