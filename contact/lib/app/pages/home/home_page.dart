import 'package:contacts/app/domain/service/firebase_service.dart';
import 'package:contacts/app/pages/contact/contacts_list_page.dart';
import 'package:contacts/app/widgets/card_person_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  void initState() {
    super.initState();
    updateContactsList();
  }

  void updateContactsList() async {
    await Future.delayed(const Duration(milliseconds: 100));
    await getAllContacts();
  }

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
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CardPersonWidget(),
                ),
              );
              updateContactsList();
            },
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(
              Icons.person_add_alt,
              semanticLabel: 'Adicionar contato',
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            updateContactsList();
          });
        },
        child: const ContactsListPage(),
      ),
    );
  }
}
