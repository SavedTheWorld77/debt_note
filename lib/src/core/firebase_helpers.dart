import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference get userCollection => collection("users");
}

extension CollectionReferenceX on CollectionReference {
  DocumentReference get userIdDoc =>
      doc(FirebaseAuth.instance.currentUser!.uid);
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference<Map<String, dynamic>> get debtCollection =>
      collection("debts");
}
