import 'package:aponte_me/app/pages/dashboard/user/widget/user_address_data_form.dart';
import 'package:aponte_me/app/pages/dashboard/user/widget/user_health_data_form.dart';
import 'package:aponte_me/app/pages/dashboard/user/widget/user_personal_data_form.dart';
import 'package:flutter/material.dart';

class CreateUserPersonalData extends StatefulWidget {
  const CreateUserPersonalData({super.key});

  @override
  State<CreateUserPersonalData> createState() => _CreateUserPersonalDataState();
}

class _CreateUserPersonalDataState extends State<CreateUserPersonalData> {
  late PageController _pageController;

  int _pageIndex = 0;

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          formsList[_pageIndex].title,
        ),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int value) {
                  setState(() {
                    _pageIndex = value;
                  });
                },
                itemCount: formsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return formsList[index].form;
                },
              ),
            ),
            Row(
              children: [
                if (_pageIndex == 0) const SizedBox(width: 72.0),
                if (_pageIndex != 0)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                const Spacer(),
                ...List.generate(
                  formsList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: DotIndicator(active: index == _pageIndex),
                  ),
                ),
                const Spacer(),
                if (_pageIndex == formsList.length - 1)
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Informações adicionadas com sucesso!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      /*backgroundColor: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                      foregroundColor: Theme
                          .of(context)
                          .colorScheme
                          .onPrimary,*/
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 20.0,
                    ),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      // backgroundColor: Theme.of(context).colorScheme.primary,
                      // foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 20.0,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.active = false,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: active ? 12.0 : 4.0,
      width: 4.0,
      decoration: BoxDecoration(
        color: active
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
    );
  }
}

class UserDataForm {
  final String title;
  final Widget form;

  const UserDataForm({
    required this.title,
    required this.form,
  });
}

final List<UserDataForm> formsList = [
  const UserDataForm(
    title: 'Dados pessoais',
    form: UserPersonalDataForm(),
  ),
  const UserDataForm(
    title: 'Endereço',
    form: UserAddressDataForm(),
  ),
  const UserDataForm(
    title: 'Contatos de emergência',
    form: UserHealthDataForm(),
  ),
];

class FormContent extends StatelessWidget {
  const FormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
