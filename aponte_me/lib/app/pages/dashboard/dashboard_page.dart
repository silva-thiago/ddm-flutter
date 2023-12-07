import 'package:aponte_me/app/pages/dashboard/contacts/create_emergency_contacts.dart';
import 'package:aponte_me/app/pages/dashboard/contacts/emergency_contacts.dart';
import 'package:aponte_me/app/pages/dashboard/security/security.dart';
import 'package:aponte_me/app/pages/dashboard/tags/qrcode_tags.dart';
import 'package:aponte_me/app/pages/dashboard/user/create_user_personal_data.dart';
import 'package:aponte_me/app/pages/dashboard/user/update_user_personal_data.dart';
import 'package:aponte_me/app/pages/dashboard/user/user_personal_data.dart';
import 'package:aponte_me/app/pages/sing_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: buildAppBar(),
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
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: <StatelessWidget>[
                const _UserEmergencyContactsWidget(),
                const _UserDataWidget(),
                const _UserTagsWidget(),
                const _UserSecurityWidget(),
              ][_currentPageIndex],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        height: 64.0,
        onDestinationSelected: (index) => setState(() {
          _currentPageIndex = index;
        }),
        indicatorColor: Theme.of(context).colorScheme.primary,
        selectedIndex: _currentPageIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.contact_emergency,
              color: Theme.of(context).colorScheme.primary,
            ),
            selectedIcon: Icon(
              Icons.contact_emergency,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: 'Contatos',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
            ),
            selectedIcon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: 'Informações',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.qr_code,
              color: Theme.of(context).colorScheme.primary,
            ),
            selectedIcon: Icon(
              Icons.qr_code,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: 'Etiquetas',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.security,
              color: Theme.of(context).colorScheme.primary,
            ),
            selectedIcon: Icon(
              Icons.security,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: 'Segurança',
          ),
        ],
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateEmergencyContactPage(),
            ),
          );
        },
        tooltip: 'Adicionar contato',
        child: const Icon(Icons.person_add),
      ), */
    );
  }

  AppBar buildAppBar() {
    AppBar? appBar;
    switch (_currentPageIndex) {
      case 0:
        appBar = appBarForFirstPage();
        break;
      case 1:
        appBar = appBarForSecondPage();
        break;
      case 2:
        appBar = appBarForThirdPage();
        break;
      case 3:
        appBar = appBarForFourthPage();
        break;
      default:
        appBar = null;
    }
    return appBar ?? AppBar();
  }

  AppBar appBarForFirstPage() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      automaticallyImplyLeading: false,
      title: const Text('Meus contatos'),
      actions: [
        IconButton(
          icon: Icon(
            color: Theme.of(context).colorScheme.primary,
            Icons.person_add,
            semanticLabel: 'Adicionar contato',
          ),
          iconSize: 20.0,
          tooltip: 'Adicionar contato',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateEmergencyContactPage(),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(
            color: Theme.of(context).colorScheme.primary,
            Icons.logout,
            semanticLabel: 'Sair da aplicação',
          ),
          iconSize: 20.0,
          tooltip: 'Sair',
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  AppBar appBarForSecondPage() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      automaticallyImplyLeading: false,
      title: const Text('Minhas informações'),
      actions: [
        IconButton(
          icon: Icon(
            color: Theme.of(context).colorScheme.primary,
            Icons.add,
            semanticLabel: 'Adicionar informações',
          ),
          iconSize: 20.0,
          tooltip: 'Adicionar informações',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateUserPersonalData(),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(
            color: Theme.of(context).colorScheme.primary,
            Icons.edit,
            semanticLabel: 'Editar informações',
          ),
          iconSize: 20.0,
          tooltip: 'Editar informações',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpdateUserPersonalData(),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(
            color: Theme.of(context).colorScheme.primary,
            Icons.logout,
            semanticLabel: 'Sair da aplicação',
          ),
          iconSize: 20.0,
          tooltip: 'Sair',
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  AppBar appBarForThirdPage() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      automaticallyImplyLeading: false,
      title: const Text('Minhas etiquetas'),
      actions: [
        /*IconButton(
          icon: Icon(
            color: Theme.of(context).colorScheme.primary,
            Icons.qr_code_scanner,
            semanticLabel: 'Adicionar etiqueta',
          ),
          iconSize: 20.0,
          tooltip: 'Adicionar etiqueta',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateQRCodeWidget(),
              ),
            );
          },
        ),*/
        IconButton(
          icon: Icon(
            color: Theme.of(context).colorScheme.primary,
            Icons.logout,
            semanticLabel: 'Sair da aplicação',
          ),
          iconSize: 20.0,
          tooltip: 'Sair',
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  AppBar appBarForFourthPage() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      automaticallyImplyLeading: false,
      title: const Text('Minha segurança'),
      actions: [
        IconButton(
          icon: Icon(
            color: Theme.of(context).colorScheme.primary,
            Icons.logout,
            semanticLabel: 'Sair da aplicação',
          ),
          iconSize: 20.0,
          tooltip: 'Sair',
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _UserEmergencyContactsWidget extends StatelessWidget {
  const _UserEmergencyContactsWidget();

  @override
  Widget build(BuildContext context) {
    return const EmergencyContactsPage();
  }
}

class _UserDataWidget extends StatelessWidget {
  const _UserDataWidget();

  @override
  Widget build(BuildContext context) {
    return const UserPersonalData();
  }
}

class _UserTagsWidget extends StatelessWidget {
  const _UserTagsWidget();

  @override
  Widget build(BuildContext context) {
    return const QRCodeTagsPage();
  }
}

class _UserSecurityWidget extends StatelessWidget {
  const _UserSecurityWidget();

  @override
  Widget build(BuildContext context) {
    return const SecurityPage();
  }
}
