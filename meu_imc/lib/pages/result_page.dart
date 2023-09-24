import 'package:flutter/material.dart';
import 'package:meu_imc/constraints/colors.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this._image, this._bmi, this._adult_bmi_description,
      {super.key});

  final String _image;
  final String _bmi;
  final String _adult_bmi_description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor().lightestBackground,
        centerTitle: true,
        title: const Text('Entenda o seu resultado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Seu IMC é:',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  _bmi,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: Text(
                  'Como chegamos ao número acima: o índice de massa corporal de um adulto é o seu peso em quilos (por exemplo, 80 kg), dividido por sua altura ao quadrado (vamos imaginar, 1,80 m x 1,80 m).',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Image.asset(
                _image,
                fit: BoxFit.cover,
                height: 160,
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Text(
                  _adult_bmi_description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
