import 'package:flutter/material.dart';

class UserAddressDataForm extends StatefulWidget {
  const UserAddressDataForm({super.key});

  @override
  State<UserAddressDataForm> createState() => _UserAddressDataFormState();
}

class _UserAddressDataFormState extends State<UserAddressDataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final addressZIPCodeController = TextEditingController();
  final addressStreetNameController = TextEditingController();
  final addressNumberBuildingController = TextEditingController();
  final addressComplmentBuildingController = TextEditingController();
  final addressCityController = TextEditingController();
  final addressStateController = TextEditingController();

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
                controller: addressZIPCodeController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'CEP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o CEP';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: addressStreetNameController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Logradouro',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o logradouro';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: addressNumberBuildingController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Número',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o número';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: addressComplmentBuildingController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Complemento',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                /*validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o complemento';
                  }
                  return null;
                },*/
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: addressCityController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe a cidade';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: addressStateController,
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
                    return 'Por favor, informe o estado';
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
