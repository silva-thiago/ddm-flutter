import 'package:aponte_me/app/pages/feedback/success_page.dart';
import 'package:aponte_me/app/pages/sing_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController();
  final _userConfirmPasswordController = TextEditingController();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;
  bool _acceptTerms = false;

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
          child: SizedBox(
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
                        'Criar conta',
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
                        'Informe seus dados para se registrar.',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Image.asset(
                    'lib/assets/images/undraw_icon_design.png',
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
                          keyboardType: TextInputType.name,
                          controller: _userNameController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Nome',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
                        const SizedBox(height: 16.0),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userEmailController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _userPasswordController,
                          textInputAction: TextInputAction.next,
                          obscureText: _obscureTextPassword,
                          obscuringCharacter: '•',
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, informe sua senha';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _userConfirmPasswordController,
                          obscuringCharacter: '•',
                          obscureText: _obscureTextConfirmPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirmar senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureTextConfirmPassword =
                                      !_obscureTextConfirmPassword;
                                });
                              },
                              child: Icon(
                                _obscureTextConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                semanticLabel: _obscureTextConfirmPassword
                                    ? 'Mostrar senha'
                                    : 'Esconder senha',
                                size: 20.0,
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, confirme sua senha';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Switch(
                              value: _acceptTerms,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _acceptTerms = value;
                                  },
                                );
                              },
                            ),
                            const Text.rich(
                              TextSpan(
                                text: 'Concordo com os ',
                                children: [
                                  TextSpan(
                                    text: 'Termos de Serviço',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: '\ne com a '),
                                  TextSpan(
                                    text: 'Política de Privacidade',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        FilledButton(
                          // onPressed: _submitForm,
                          onPressed: () {
                            try {
                              if (_acceptTerms) {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SuccessPage(),
                                    ),
                                  );
                                } else {
                                  throw 'Você precisa preencher todos os campos obrigatórios.';
                                }
                              } else if (!_formKey.currentState!.validate()) {
                                throw 'Você precisa aceitar os termos de serviço e a política de privacidade.';
                              } else {
                                throw 'Você precisa aceitar os termos de serviço e a política de privacidade.';
                              }
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    error.toString(),
                                  ),
                                ),
                              );
                            }
                            const CircularProgressIndicator.adaptive();
                          },
                          // style: primaryButtonStyle,
                          child: Text(
                            'Registrar'.toUpperCase(),
                          ),
                        ),
                      ],
                    ),
                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}
