import 'package:cloud_firestore/cloud_firestore.dart';

getUserName(String documentId) async {
  String name = "Initial";
  await FirebaseFirestore.instance
  .collection('users')
  .where('id', isEqualTo: documentId)
  .get()
  .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            name = doc["name"];
        });
    });
    return name;
}
