import 'package:aponte_me/app/pages/success/success_page.dart';
import 'package:flutter/material.dart';

class UpdateEmergencyContactPage extends StatefulWidget {
  const UpdateEmergencyContactPage({super.key});

  @override
  State<UpdateEmergencyContactPage> createState() =>
      _UpdateEmergencyContactPageState();
}

class _UpdateEmergencyContactPageState
    extends State<UpdateEmergencyContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final contactNameController = TextEditingController();
  final contactEmailController = TextEditingController();
  final contactPhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Editar contato'),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autofocus: true,
                      // textInputAction: TextInputAction.next,
                      controller: contactNameController,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
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
                      controller: contactEmailController,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
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
                      controller: contactPhoneNumberController,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
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
                    FilledButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessPage(),
                            ),
                          );
                        }
                      },
                      // style: primaryButtonStyle,
                      child: Text(
                        'Adicionar'.toUpperCase(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
