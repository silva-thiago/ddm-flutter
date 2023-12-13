import 'package:aponte_me/app/pages/sing_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(
                      'lib/assets/images/undraw_celebration.png',
                      semanticLabel: 'Imagem ilustrativa de sucesso',
                      height: 200,
                    ),
                    const Spacer(),
                    Center(
                      child: Text.rich(
                        const TextSpan(
                          text: 'Sua conta foi criada com sucesso!',
                        ),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () async {
                        // Process data.
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                        );
                      },
                      // style: primaryButtonStyle,
                      child: Text(
                        'Acessar sua conta'.toUpperCase(),
                      ),
                    ),
                    const Spacer(),
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
