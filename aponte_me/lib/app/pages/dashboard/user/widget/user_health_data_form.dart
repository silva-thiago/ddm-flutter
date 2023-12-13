import 'package:flutter/material.dart';

class UserHealthDataForm extends StatefulWidget {
  const UserHealthDataForm({super.key});

  @override
  State<UserHealthDataForm> createState() => _UserHealthDataFormState();
}

class _UserHealthDataFormState extends State<UserHealthDataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final healthBloodTypeController = TextEditingController();
  final healthBiologicalSexController = TextEditingController();
  final healthAllergiesController = TextEditingController();
  final healthMedicationsController = TextEditingController();
  final healthIllnessesController = TextEditingController();
  final healthTreatmentsController = TextEditingController();
  final healthSurgeriesController = TextEditingController();

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
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: healthBloodTypeController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Tipo sanguíneo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu tipo sanguíneo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: healthBiologicalSexController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Sexo biológico',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                /*validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu sexo biológico';
                  }
                  return null;
                },*/
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: healthAllergiesController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Alergias',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                /*validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe sua alergias';
                  }
                  return null;
                },*/
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: healthMedicationsController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Medicamentos de uso contínuo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                /*validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seus medicamentos de uso contínuo';
                  }
                  return null;
                },*/
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: healthIllnessesController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Doenças pré-existentes',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                /*validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe suas doenças pré-existentes';
                  }
                  return null;
                },*/
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: healthTreatmentsController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Tratamentos',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                /*validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seus tratamentos';
                  }
                  return null;
                },*/
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                // textInputAction: TextInputAction.next,
                controller: healthSurgeriesController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Cirurgias',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                /*validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe suas cirurgias';
                  }
                  return null;
                },*/
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
