import 'package:aponte_me/app/pages/password/password_recovery.dart';
import 'package:aponte_me/app/pages/sign_up/sign_up_page.dart';
import 'package:aponte_me/src/features/auth/interactor/atoms/atom_auth.dart';
import 'package:aponte_me/src/features/auth/interactor/dtos/dto_email_credential.dart';
import 'package:aponte_me/src/features/auth/interactor/states/state_auth.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();

  bool aceitarTermoPolitica = false;
  bool _obscureTextPassword = true;

  var dto = DTOEmailCredential();

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => stateAuth.value);
    final loading = state is LoadingAuth;

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
                      'Entrar',
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
                      'Informe seus dados para entar na sua conta.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Image.asset(
                  'lib/assets/images/undraw_login.png',
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
                        enabled: !loading,
                        onChanged: (value) {
                          dto.email = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe seu e-mail';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: userPasswordController,
                        obscuringCharacter: '•',
                        obscureText: _obscureTextPassword,
                        cursorColor: Theme.of(context).colorScheme.primary,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureTextPassword = !_obscureTextPassword;
                              });
                            },
                            child: Icon(
                              _obscureTextPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              semanticLabel: _obscureTextPassword
                                  ? 'Mostrar senha'
                                  : 'Esconder senha',
                              size: 20.0,
                            ),
                          ),
                        ),
                        enabled: !loading,
                        onChanged: (value) {
                          dto.password = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe sua senha';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      FilledButton(
                        onPressed: loading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  loginWithEmailAction.value = dto;
                                }
                              },
                        child: Text(
                          'Entrar'.toUpperCase(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Não tem uma conta?',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Criar conta',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PasswordRecoveryPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Recuperar senha',
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
