import 'package:flutter/material.dart';

class UserPersonalDataForm extends StatefulWidget {
  const UserPersonalDataForm({super.key});

  @override
  State<UserPersonalDataForm> createState() => _UserPersonalDataFormState();
}

class _UserPersonalDataFormState extends State<UserPersonalDataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final userCPFController = TextEditingController();
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPhoneNumberController = TextEditingController();
  final userDataNascimentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        // color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: userCPFController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu CPF';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.name,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: userNameController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Nome completo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: userEmailController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.phone,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: userPhoneNumberController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu número de telefone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.datetime,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: userDataNascimentoController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Data de nascimento',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe sua data de nascimento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              FilledButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    /* await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessPage(),
                      ),
                    ); */
                    () {};
                  }
                },
                // style: primaryButtonStyle,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*const Icon(
                      Icons.save,
                      size: 20.0,
                    ),
                    const SizedBox(width: 4.0),*/
                    Text(
                      'Salvar'.toUpperCase(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
