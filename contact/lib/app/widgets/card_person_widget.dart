import 'package:contacts/app/domain/service/firebase_service.dart';
import 'package:flutter/material.dart';

class CardPersonWidget extends StatefulWidget {
  const CardPersonWidget({super.key});

  @override
  State<CardPersonWidget> createState() => _CardPersonWidgetState();
}

class _CardPersonWidgetState extends State<CardPersonWidget> {
  final contactNameController = TextEditingController();
  final contactPhoneNumberController = TextEditingController();
  final contactEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      title: const Text(
        'Dados do contato',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            keyboardType: TextInputType.name,
            autofocus: true,
            controller: contactNameController,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            cursorColor: Theme.of(context).colorScheme.primary,
            decoration: InputDecoration(
              hintText: 'Nome',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            keyboardType: TextInputType.phone,
            autofocus: true,
            controller: contactPhoneNumberController,
            cursorColor: Theme.of(context).colorScheme.primary,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            decoration: InputDecoration(
              hintText: 'Telefone',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            controller: contactEmailController,
            cursorColor: Theme.of(context).colorScheme.primary,
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancelar',
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            FilledButton(
              onPressed: () async {
                await addContact(
                  contactNameController.text,
                  contactPhoneNumberController.text,
                  contactEmailController.text,
                ).then(
                  (_) => Navigator.pop(context),
                );
                contactNameController.clear();
                contactPhoneNumberController.clear();
                contactEmailController.clear();
              },
              child: const Text(
                'Adicionar',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
