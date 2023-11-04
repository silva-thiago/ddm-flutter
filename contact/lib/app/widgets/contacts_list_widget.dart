import 'package:flutter/material.dart';

class ContactsListWidget extends StatefulWidget {
  const ContactsListWidget({super.key});

  @override
  State<ContactsListWidget> createState() => _ContactsListWidgetState();
}

class _ContactsListWidgetState extends State<ContactsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  style: ListTileStyle.list,
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: const Text('Nome'),
                  subtitle: const Text('Telefone'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.edit,
                      semanticLabel: 'Editar contato',
                      color: Theme.of(context).colorScheme.primary,
                      size: 16.0,
                    ),
                    onPressed: () {},
                  ),
                ),
                Divider(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withAlpha(1),
                  height: 0.0,
                  thickness: 1.0,
                ),
              ],
            ).toList(),
          ),
        ),
      ),
    );
  }
}
