import 'package:aponte_me/app/pages/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userOldPassword = TextEditingController();
  final _userNewPassword = TextEditingController();
  final _userConfirmNewPassword = TextEditingController();

  bool _obscureTextOldPassword = true;
  bool _obscureTextConfirmNewPassword = true;
  bool _obscureTextNewPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /* const Row(
          children: [
            Text(
              'Atualizar senha',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0), */
        const Row(
          children: [
            Text(
              'Garanta que sua conta esteja usando uma senha longa\ne aleatória para se manter seguro.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _userOldPassword,
                        obscuringCharacter: '•',
                        obscureText: _obscureTextOldPassword,
                        decoration: InputDecoration(
                          labelText: 'Senha atual',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureTextOldPassword =
                                    !_obscureTextOldPassword;
                              });
                            },
                            child: Icon(
                              _obscureTextOldPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              semanticLabel: _obscureTextOldPassword
                                  ? 'Mostrar senha'
                                  : 'Esconder senha',
                              size: 20.0,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe sua senha atual';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _userNewPassword,
                        obscuringCharacter: '•',
                        obscureText: _obscureTextNewPassword,
                        decoration: InputDecoration(
                          labelText: 'Nova senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureTextNewPassword =
                                    !_obscureTextNewPassword;
                              });
                            },
                            child: Icon(
                              _obscureTextNewPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              semanticLabel: _obscureTextNewPassword
                                  ? 'Mostrar senha'
                                  : 'Esconder senha',
                              size: 20.0,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe sua nova senha';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _userConfirmNewPassword,
                        obscuringCharacter: '•',
                        obscureText: _obscureTextConfirmNewPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirmar senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureTextConfirmNewPassword =
                                    !_obscureTextConfirmNewPassword;
                              });
                            },
                            child: Icon(
                              _obscureTextConfirmNewPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              semanticLabel: _obscureTextConfirmNewPassword
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
                      FilledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Process data.
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashboardPage(),
                              ),
                            );
                          }
                        },
                        // style: primaryButtonStyle,
                        child: Text(
                          'Salvar'.toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
