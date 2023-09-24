import 'package:flutter/material.dart';
import 'package:meu_imc/constraints/colors.dart';
import 'package:meu_imc/pages/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

enum AgeRange { child, adult }

enum Gender { male, female }

const List<String> ageList = <String>[
  '5 anos e 1 mês',
  '5 anos e 2 meses',
  '5 anos e 3 meses',
  '5 anos e 4 meses',
  '5 anos e 5 meses',
  '5 anos e 6 meses',
  '5 anos e 7 meses',
  '5 anos e 8 meses',
  '5 anos e 9 meses',
  '5 anos e 10 meses',
  '5 anos e 11 meses',
  '6 anos',
  '6 anos e 1 mês',
  '6 anos e 2 meses',
  '6 anos e 3 meses',
  '6 anos e 4 meses',
  '6 anos e 5 meses',
  '6 anos e 6 meses',
  '6 anos e 7 meses',
  '6 anos e 8 meses',
  '6 anos e 9 meses',
  '6 anos e 10 meses',
  '6 anos e 11 meses',
  '7 anos',
  '7 anos e 1 mês',
  '7 anos e 2 meses',
  '7 anos e 3 meses',
  '7 anos e 4 meses',
  '7 anos e 5 meses',
  '7 anos e 6 meses',
  '7 anos e 7 meses',
  '7 anos e 8 meses',
  '7 anos e 9 meses',
  '7 anos e 10 meses',
  '7 anos e 11 meses',
  '8 anos',
  '8 anos e 1 mês',
  '8 anos e 2 meses',
  '8 anos e 3 meses',
  '8 anos e 4 meses',
  '8 anos e 5 meses',
  '8 anos e 6 meses',
  '8 anos e 7 meses',
  '8 anos e 8 meses',
  '8 anos e 9 meses',
  '8 anos e 10 meses',
  '8 anos e 11 meses',
  '9 anos',
  '9 anos e 1 mês',
  '9 anos e 2 meses',
  '9 anos e 3 meses',
  '9 anos e 4 meses',
  '9 anos e 5 meses',
  '9 anos e 6 meses',
  '9 anos e 7 meses',
  '9 anos e 8 meses',
  '9 anos e 9 meses',
  '9 anos e 10 meses',
  '9 anos e 11 meses',
  '10 anos',
  '10 anos e 1 mês',
  '10 anos e 2 meses',
  '10 anos e 3 meses',
  '10 anos e 4 meses',
  '10 anos e 5 meses',
  '10 anos e 6 meses',
  '10 anos e 7 meses',
  '10 anos e 8 meses',
  '10 anos e 9 meses',
  '10 anos e 10 meses',
  '10 anos e 11 meses',
  '11 anos',
  '11 anos e 1 mês',
  '11 anos e 2 meses',
  '11 anos e 3 meses',
  '11 anos e 4 meses',
  '11 anos e 5 meses',
  '11 anos e 6 meses',
  '11 anos e 7 meses',
  '11 anos e 8 meses',
  '11 anos e 9 meses',
  '11 anos e 10 meses',
  '11 anos e 11 meses',
  '12 anos',
  '12 anos e 1 mês',
  '12 anos e 2 meses',
  '12 anos e 3 meses',
  '12 anos e 4 meses',
  '12 anos e 5 meses',
  '12 anos e 6 meses',
  '12 anos e 7 meses',
  '12 anos e 8 meses',
  '12 anos e 9 meses',
  '12 anos e 10 meses',
  '12 anos e 11 meses',
  '13 anos',
  '13 anos e 1 mês',
  '13 anos e 2 meses',
  '13 anos e 3 meses',
  '13 anos e 4 meses',
  '13 anos e 5 meses',
  '13 anos e 6 meses',
  '13 anos e 7 meses',
  '13 anos e 8 meses',
  '13 anos e 9 meses',
  '13 anos e 10 meses',
  '13 anos e 11 meses',
  '14 anos',
  '14 anos e 1 mês',
  '14 anos e 2 meses',
  '14 anos e 3 meses',
  '14 anos e 4 meses',
  '14 anos e 5 meses',
  '14 anos e 6 meses',
  '14 anos e 7 meses',
  '14 anos e 8 meses',
  '14 anos e 9 meses',
  '14 anos e 10 meses',
  '14 anos e 11 meses',
  '15 anos',
  '15 anos e 1 mês',
  '15 anos e 2 meses',
  '15 anos e 3 meses',
  '15 anos e 4 meses',
  '15 anos e 5 meses',
  '15 anos e 6 meses',
  '15 anos e 7 meses',
  '15 anos e 8 meses',
  '15 anos e 9 meses',
  '15 anos e 10 meses',
  '15 anos e 11 meses',
  '16 anos',
  '16 anos e 1 mês',
  '16 anos e 2 meses',
  '16 anos e 3 meses',
  '16 anos e 4 meses',
  '16 anos e 5 meses',
  '16 anos e 6 meses',
  '16 anos e 7 meses',
  '16 anos e 8 meses',
  '16 anos e 9 meses',
  '16 anos e 10 meses',
  '16 anos e 11 meses',
  '17 anos',
  '17 anos e 1 mês',
  '17 anos e 2 meses',
  '17 anos e 3 meses',
  '17 anos e 4 meses',
  '17 anos e 5 meses',
  '17 anos e 6 meses',
  '17 anos e 7 meses',
  '17 anos e 8 meses',
  '17 anos e 9 meses',
  '17 anos e 10 meses',
  '17 anos e 11 meses',
  '18 anos',
  '18 anos e 1 mês',
  '18 anos e 2 meses',
  '18 anos e 3 meses',
  '18 anos e 4 meses',
  '18 anos e 5 meses',
  '18 anos e 6 meses',
  '18 anos e 7 meses',
  '18 anos e 8 meses',
  '18 anos e 9 meses',
  '18 anos e 10 meses',
  '18 anos e 11 meses',
  '19 anos'
];

class _HomePageState extends State<HomePage> {
  AgeRange ageRangeView = AgeRange.adult;
  Gender genderView = Gender.male;
  String dropdownValue = ageList.first;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    void _disabledButton() {
      bool disabledButton = false;

      setState(() => disabledButton = true);
    }

    void _resetFields() {
      weightController.text = '';
      heightController.text = '';
      ageRangeView = AgeRange.adult;
      genderView = Gender.male;
      dropdownValue = ageList.first;

      setState(() {
        _formKey.currentState!.reset();
      });
    }

    void _calculateAdultBMI() {
      setState(() {
        bool _child = ageRangeView == AgeRange.child;

        String _image = '';
        String _bmi = '';
        String _child_bmi_description = '';
        String _adult_bmi_description = '';

        double weight = double.parse(weightController.text);
        double height = double.parse(heightController.text) / 100;
        double bmi = weight / (height * height);

        // IMC = Peso / (Altura/100)^2
        // IdadeMeses = Idade * 12
        // EscoreZ = ((IMC/M)L - 1) / (L * S)
        // Percentil = ZparaPercentil (EscoreZ)

        // if (_child) {}

        if (bmi < 18.6) {
          _image = genderView == Gender.male
              ? 'src/assets/images/imc_m_06.png'
              : 'src/assets/images/imc_f_06.png';
          _bmi = 'Abaixo do peso ideal (${bmi.toStringAsPrecision(3)})';
          _adult_bmi_description =
              'Procure um médico. Algumas pessoas têm um baixo peso por características do seu organismo e tudo bem. Outras podem estar enfrentando problemas, como a desnutrição. É preciso saber qual é o caso.';
        } else if (bmi >= 18.6 && bmi < 24.9) {
          _image = genderView == Gender.male
              ? 'src/assets/images/imc_m_05.png'
              : 'src/assets/images/imc_f_05.png';
          _bmi = 'Peso ideal (${bmi.toStringAsPrecision(3)})';
          _adult_bmi_description =
              'Que bom que você está com o peso normal! E o melhor jeito de continuar assim é mantendo um estilo de vida ativo e uma alimentação equilibrada.';
        } else if (bmi >= 24.9 && bmi < 29.9) {
          _image = genderView == Gender.male
              ? 'src/assets/images/imc_m_04.png'
              : 'src/assets/images/imc_f_04.png';
          _bmi = 'Sobrepeso (${bmi.toStringAsPrecision(3)})';
          _adult_bmi_description =
              'Ele é, na verdade, uma pré-obesidade e muitas pessoas nessa faixa já apresentam doenças associadas, como diabetes e hipertensão. Importante rever hábitos e buscar ajuda antes de, por uma série de fatores, entrar na faixa da obesidade pra valer.';
        } else if (bmi >= 29.9 && bmi < 34.9) {
          _image = genderView == Gender.male
              ? 'src/assets/images/imc_m_03.png'
              : 'src/assets/images/imc_f_03.png';
          _bmi = 'Obesidade Grau I (${bmi.toStringAsPrecision(3)})';
          _adult_bmi_description =
              'Sinal de alerta! Chegou na hora de se cuidar, mesmo que seus exames sejam normais. Vamos dar início a mudanças hoje! Cuide de sua  alimentação. Você precisa iniciar um acompanhamento com nutricionista e/ou endocrinologista.';
        } else if (bmi >= 34.9 && bmi < 39.9) {
          _image = genderView == Gender.male
              ? 'src/assets/images/imc_m_02.png'
              : 'src/assets/images/imc_f_02.png';
          _bmi = 'Obesidade Grau II (${bmi.toStringAsPrecision(3)})';
          _adult_bmi_description =
              'Mesmo que seus exames aparentem estar normais, é hora de se cuidar, iniciando mudanças no estilo de vida com o acompanhamento próximo de profissionais de saúde';
        } else if (bmi >= 40) {
          _image = genderView == Gender.male
              ? 'src/assets/images/imc_m_01.png'
              : 'src/assets/images/imc_f_01.png';
          _bmi = 'Obesidade Grau III (${bmi.toStringAsPrecision(3)})';
          _adult_bmi_description =
              'Aqui o sinal é vermelho, com forte probabilidade de já existirem doenças muito graves associadas. O tratamento deve ser ainda mais urgente.';
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              _image,
              _bmi,
              _adult_bmi_description,
            ),
          ),
        );
      });
    }

    return Scaffold(
      // backgroundColor: AppColor().lightBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor().lightestBackground,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _resetFields,
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Calcule seu IMC',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Selecione o seu perfil',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SegmentedButton(
                  segments: const <ButtonSegment<AgeRange>>[
                    ButtonSegment<AgeRange>(
                      value: AgeRange.child,
                      label: Text('Criança'),
                      icon: Icon(Icons.boy),
                    ),
                    ButtonSegment<AgeRange>(
                      value: AgeRange.adult,
                      label: Text('Adulto'),
                      icon: Icon(Icons.man),
                    ),
                  ],
                  selected: <AgeRange>{ageRangeView},
                  onSelectionChanged: (Set<AgeRange> newSelection) {
                    setState(() {
                      ageRangeView = newSelection.first;
                    });
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Selecione o seu gênero',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SegmentedButton(
                  segments: const <ButtonSegment<Gender>>[
                    ButtonSegment<Gender>(
                      value: Gender.male,
                      label: Text('Homem'),
                      icon: Icon(Icons.male),
                    ),
                    ButtonSegment<Gender>(
                      value: Gender.female,
                      label: Text('Mulher'),
                      icon: Icon(Icons.female),
                    ),
                  ],
                  selected: <Gender>{genderView},
                  onSelectionChanged: (Set<Gender> newSelection) {
                    setState(() {
                      genderView = newSelection.first;
                    });
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                if (ageRangeView == AgeRange.child)
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 18,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: ageList.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  controller: weightController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite seu peso.';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Altura (cm)',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  controller: heightController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite sua altura.';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculateAdultBMI();
                      }
                    },
                    child: const Text(
                      'Calcular',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
