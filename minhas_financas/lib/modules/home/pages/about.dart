import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'SOBRE NÓS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/images/sobre.png'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            child: Text.rich(
              TextSpan(
                text: 'A ',
                children: [
                  TextSpan(
                    text: 'XPTO ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'é uma startup inovadora que está mudando a maneira como as pessoas pensam sobre desenvolvimento de aplicativos. Nós somos a Apple do mundo do desenvolvimento de aplicativos - sempre na vanguarda da tecnologia e liderando o caminho com nossos produtos e serviços de ponta.',
                  )
                ],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
