import 'package:flutter/material.dart';

class UserPersonalData extends StatefulWidget {
  const UserPersonalData({super.key});

  @override
  State<UserPersonalData> createState() => _UserPersonalDataState();
}

class _UserPersonalDataState extends State<UserPersonalData> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /* const Row(
          children: [
            Text(
              'Dados pessoais',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0), */
        Row(
          children: [
            Text(
              'Matenhas suas informações atualizadas\npara que a ajuda seja mais efetiva.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pessoal',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        CardUserPersonalData(),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Residencial',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        CardUserAddressData(),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Saúde',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        CardUserHealthData(),
      ],
    );
  }
}

class CardUserPersonalData extends StatelessWidget {
  const CardUserPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardCard(
      cardType: 'Pessoal',
      cardFieldData: [
        {
          Icons.badge: const {
            'label': 'CPF',
            'description': '123.456.789-00',
          },
        },
        {
          Icons.person: const {
            'label': 'Nome',
            'description': 'Thiago Silva',
          },
        },
        {
          Icons.email: const {
            'label': 'Email',
            'description': 'thiago@email.com',
          },
        },
        {
          Icons.phone_android: const {
            'label': 'Telefone',
            'description': '(84) 9 9999-9999',
          },
        },
        {
          Icons.cake: const {
            'label': 'Data de nascimento',
            'description': '01/01/2000',
          },
        },
      ],
    );
  }
}

class CardUserAddressData extends StatelessWidget {
  const CardUserAddressData({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardCard(
      cardType: 'Residencial',
      cardFieldData: [
        {
          Icons.house: const {
            'label': 'Logradouro',
            'description': 'Rua das Pedras',
          },
        },
        {
          Icons.pin: const {
            'label': 'Número',
            'description': '1536',
          },
        },
        {
          Icons.apartment: const {
            'label': 'Complemento',
            'description': 'Apartamento 4',
          },
        },
        {
          Icons.location_city: const {
            'label': 'Cidade',
            'description': 'Natal',
          },
        },
        {
          Icons.place: const {
            'label': 'Estado',
            'description': 'RN',
          },
        },
        {
          Icons.map: const {
            'label': 'CEP',
            'description': '59000-000',
          },
        },
        {
          Icons.public: const {
            'label': 'País',
            'description': 'Brasil',
          },
        },
      ],
    );
  }
}

class CardUserHealthData extends StatelessWidget {
  const CardUserHealthData({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardCard(
      cardType: 'Saúde',
      cardFieldData: [
        {
          Icons.bloodtype: const {
            'label': 'Tipo sanguíneo',
            'description': 'O+',
          },
        },
        {
          Icons.group: const {
            'label': 'Sexo biológico',
            'description': 'Masculino',
          },
        },
        {
          Icons.medical_information: const {
            'label': 'Alergias',
            'description': 'Anti-inflamatórios',
          },
        },
        {
          Icons.medication_liquid: const {
            'label': 'Medicamentos de uso contínuo',
            'description':
                'Losartana potássica 50mg +\nHidroclorotiazida 12.5mg',
          },
        },
        {
          Icons.medication: const {
            'label': 'Doenças pré-existentes',
            'description': 'Hipertensão',
          },
        },
        {
          Icons.medical_services: const {
            'label': 'Tratamentos',
            'description': '',
          },
        },
        {
          Icons.monitor_heart: const {
            'label': 'Cirurgias',
            'description': '',
          },
        },
      ],
    );
  }
}

class StandardCard extends StatelessWidget {
  const StandardCard({
    super.key,
    required this.cardType,
    required this.cardFieldData,
  });

  final String cardType;
  final List<Map<IconData, Map<String, String>>> cardFieldData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        /*elevation: 1.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),*/
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          itemCount: cardFieldData.length,
          itemBuilder: (context, index) {
            final cardData = cardFieldData[index];
            final cardEntry = cardData.entries.first;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Icon(
                    cardEntry.key,
                    size: 18.0,
                    color: cardEntry.key == Icons.bloodtype
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: cardEntry.value['label'],
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 4.0),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: cardEntry.value['description'] != ''
                                ? cardEntry.value['description']
                                : 'Nenhum',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
