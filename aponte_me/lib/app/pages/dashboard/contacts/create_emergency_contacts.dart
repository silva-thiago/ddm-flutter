import 'package:aponte_me/app/pages/feedback/success_page.dart';
import 'package:flutter/material.dart';

class CreateEmergencyContactPage extends StatefulWidget {
  const CreateEmergencyContactPage({super.key});

  @override
  State<CreateEmergencyContactPage> createState() =>
      _CreateEmergencyContactPageState();
}

class _CreateEmergencyContactPageState
    extends State<CreateEmergencyContactPage> {
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
        title: const Text('Adicionar contato'),
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
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      controller: contactNameController,
                      // textInputAction: TextInputAction.next,
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
