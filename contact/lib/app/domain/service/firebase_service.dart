import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore database = FirebaseFirestore.instance;

Future<List> getAllContacts() async {
  await Future.delayed(const Duration(milliseconds: 100));

  /* List contacts = [];
  CollectionReference contactsCollectionReference =
      database.collection('contacts');

  QuerySnapshot contactsQuerySnapshot = await contactsCollectionReference.get();

  for (var document in contactsQuerySnapshot.docs) {
    contacts.add(document.data());
  }
  return contacts; */

  final snapshot = await database.collection('contacts').get();
  return snapshot.docs.map((doc) => doc.data()).toList();
}

Future<void> addContact(String name, String phone, String email) async {
  await Future.delayed(const Duration(milliseconds: 100));
  await database.collection('contacts').add({
    'name': name,
    'phone': phone,
    'email': email,
  });

  /* CollectionReference contactsCollectionReference =
      database.collection('contacts');

  await contactsCollectionReference.add(contact); */
}
