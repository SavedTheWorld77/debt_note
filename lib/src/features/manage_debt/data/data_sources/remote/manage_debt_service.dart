import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debt_note/src/core/firebase_helpers.dart';
import 'package:debt_note/src/features/manage_debt/domain/entities/debt.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ManageDebtService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getActiveDebts() async {
    var debts = await _firebaseFirestore.userCollection.userIdDoc.debtCollection
        .where("status", isEqualTo: true)
        .get();
    return debts;
  }

  Future<DocumentReference> addDebt(Debt debt) async {
    var doc = await _firebaseFirestore.userCollection.userIdDoc.debtCollection
        .add(debt.toJson());
    return doc;
  }

  Future deleteDebt(Debt debt) async {
    var doc = await FirebaseFirestore
        .instance.userCollection.userIdDoc.debtCollection
        .where("debt_id", isEqualTo: debt.debtId)
        .get();

    await FirebaseFirestore.instance.userCollection.userIdDoc.debtCollection
        .doc(doc.docs[0].id)
        .delete();
  }

  Future updateDebt(Debt debt) async {
    var doc = await FirebaseFirestore
        .instance.userCollection.userIdDoc.debtCollection
        .where("debt_id", isEqualTo: debt.debtId)
        .get();

    await FirebaseFirestore.instance.userCollection.userIdDoc.debtCollection
        .doc(doc.docs[0].id)
        .update(debt.toJson());
  }
}
