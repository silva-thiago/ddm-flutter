import 'package:aponte_me/app/pages/feedback/recovery_page.dart';
import 'package:aponte_me/app/pages/sing_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final userEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Aponte Me'),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
            maxHeight: MediaQuery.of(context).size.height / 1,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      'Recuperar senha',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'Informe seu e-mail para recuperar sua senha',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Image.asset(
                  'lib/assets/images/undraw_forgot_password.png',
                  height: 150.0,
                ),
                const SizedBox(height: 16.0),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        controller: userEmailController,
                        textInputAction: TextInputAction.next,
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
                            return 'Por favor, informe seu e-mail';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      FilledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RecoveryPage(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Enviar'.toUpperCase(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Cancelar'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
