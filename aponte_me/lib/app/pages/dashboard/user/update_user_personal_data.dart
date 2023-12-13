import 'package:aponte_me/app/pages/dashboard/user/widget/user_personal_data_form.dart';
import 'package:flutter/material.dart';

class UpdateUserPersonalData extends StatefulWidget {
  const UpdateUserPersonalData({super.key});

  @override
  State<UpdateUserPersonalData> createState() => _UpdateUserPersonalDataState();
}

class _UpdateUserPersonalDataState extends State<UpdateUserPersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Editar dados pessoais'),
        // centerTitle: true,
      ),
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
          child: const SizedBox(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Adicionar dados pessoais',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  UserPersonalDataForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
