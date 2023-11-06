import 'package:contacts/app/domain/service/firebase_service.dart';
import 'package:flutter/material.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
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
          child: FutureBuilder(
            future: getAllContacts(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (itemBuilder, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child:
                                        _avatarWidget(context, snapshot, index),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data?[index]['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data?[index]['phone'],
                                  ),
                                  Text(
                                    snapshot.data?[index]['email'],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      semanticLabel: 'Editar contato',
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 16.0,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      semanticLabel: 'Excluir contato',
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 16.0,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  _avatarWidget(BuildContext context, snapshot, index) {
    /* avatarImage = CircleAvatar(
      backgroundImage: NetworkImage(snapshot.data?[index]['photo']),
      radius: 24.0,
    ); */

    const avatarIcon = CircleAvatar(
      radius: 24.0,
      child: Icon(
        Icons.person,
        semanticLabel: 'Avatar',
        color: Colors.grey,
      ),
    );

    return avatarIcon;
  }
}
