import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debt_note/di.dart';
import 'package:debt_note/src/features/auth/data/data_sources/remote/firebase_auth_service.dart';
import 'package:debt_note/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../domain/repository/auth_repository.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial()) {
    on<Login>((event, Emitter<LoginBlocState> emit) async {
      // TODO: implement event handler
      print("onLogin");
      // AuthRepositoryImpl().register("Sunbae@gmail.com", "Dancer@1");
      await locator<AuthRepository>()
          .login("Sunbae@gmail.com", "Dancer@1")
          .then((value) {
        print(value.fold((l) => null, (r) => print(r.user!.uid)));
      });
    });

    on<LoginTest>((event, Emitter<LoginBlocState> emit) async {
      addReminderToFirebase();
    });

    on<LoginTest1>((event, Emitter<LoginBlocState> emit) async {
      logOut();
    });
  }

  Future<void> addReminderToFirebase() async {
    // get all documents
    // var f = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc("C7fpRW35kla8CBGcOHHQ")
    //     .collection("debts")
    //     .get();
    // print(f.data());

    // get document for specific condition
    // var f = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc("C7fpRW35kla8CBGcOHHQ")
    //     .collection("debts")
    //     .where("id", isEqualTo: "c")
    //     .get();
    // print(f.docs[0].id);
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc("G62G9hr8xXZQpQfiCjcuKovmsD53")
    //     .collection("debts")
    //     .add(<String, dynamic>{
    //   'description': "Remember to do Laundryy",
    //   'name': "name",
    //   'payment_dates': [
    //     {"amount": 100, "date": "date", "is_paid": false}
    //   ],
    //   "status": false,
    //   // 'uid': FirebaseAuth.instance.currentUser!.uid,
    //   "uid": FirebaseAuth.instance.currentUser!.uid
    // });
    print(locator<FirebaseAuthService>().firebaseAuth.currentUser!.uid);
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
