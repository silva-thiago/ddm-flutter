import 'package:contacts/app/widgets/contacts_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _newContact(context);
            },
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(
              Icons.person_add_alt,
              semanticLabel: 'Adicionar contato',
            ),
          ),
        ],
      ),
      body: const ContactsListWidget(),
    );
  }

  _newContact(BuildContext context) {
    final contactNameController = TextEditingController();
    final contactPhoneNumberController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          title: const Text(
            'Adicionar contato',
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
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  hintStyle: TextStyle(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(100),
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
                decoration: InputDecoration(
                  hintText: 'Telefone',
                  hintStyle: TextStyle(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(100),
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
                  onPressed: () {
                    /* addTodo(
                      Todo(
                        title: contactNameController.text,
                        subtitle: contactPhoneNumberController.text,
                        done: false,
                      ),
                    ); */
                    contactNameController.clear();
                    contactPhoneNumberController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Adicionar',
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
