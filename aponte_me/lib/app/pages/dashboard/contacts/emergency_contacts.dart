import 'package:aponte_me/app/pages/dashboard/contacts/update_emergency_contacts.dart';
import 'package:flutter/material.dart';

class EmergencyContactsPage extends StatefulWidget {
  const EmergencyContactsPage({super.key});

  @override
  State<EmergencyContactsPage> createState() => _EmergencyContactsPageState();
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {
  late PageController _pageController;

  // int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /* const Row(
          children: [
            Text(
              'Contatos de emergência',
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
              'Seus contatos receberão um SMS com sua localização\nem caso de emergência.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        /*CardEmergencyContact(
          primaryButtonStyle: primaryButtonStyle,
          secondaryButtonStyle: secondaryButtonStyle,
        ),*/
        Expanded(
          child: ListView(
            children: const [
              CardEmergencyContact(),
            ],
          ),
        ),
      ],
    );
  }
}

class CardEmergencyContact extends StatelessWidget {
  const CardEmergencyContact({
    super.key,
    /*required this.primaryButtonStyle,
    required this.secondaryButtonStyle,*/
  });

  /*final ButtonStyle primaryButtonStyle;
  final ButtonStyle secondaryButtonStyle;*/

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    radius: 24.0,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: const Icon(
                      Icons.person,
                      semanticLabel: 'Avatar',
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thiago',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('84999123456'),
                    Text('thiago@email.com'),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    semanticLabel: 'Editar contato',
                    color: Theme.of(context).colorScheme.primary,
                    size: 16.0,
                  ),
                  iconSize: 20.0,
                  tooltip: 'Editar',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const UpdateEmergencyContactPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    semanticLabel: 'Excluir contato',
                    color: Theme.of(context).colorScheme.primary,
                    size: 16.0,
                  ),
                  iconSize: 20.0,
                  tooltip: 'Excluir',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        icon: const Icon(
                          Icons.warning,
                          color: Colors.yellow,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 1.0,
                              offset: Offset(
                                0.1,
                                0.1,
                              ),
                            ),
                          ],
                        ),
                        title: const Text(
                          'Esta ação não poderá ser desfeita.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            /* color: Colors.yellow,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 1.0,
                                offset: Offset(
                                  0.1,
                                  0.1,
                                ),
                              ),
                            ], */
                          ),
                        ),
                        content: const Text(
                          'Tem certeza que deseja excluir este contato?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          FilledButton(
                            autofocus: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            // style: primaryButtonStyle,
                            child: const Text(
                              'Não',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            // style: secondaryButtonStyle,
                            child: const Text(
                              'Sim',
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
