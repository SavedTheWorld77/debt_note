import 'package:bloc/bloc.dart';
import 'package:debt_note/di.dart';
import 'package:debt_note/src/features/auth/data/data_sources/remote/firebase_auth_service.dart';
import 'package:debt_note/src/features/auth/domain/entities/user.dart';
import 'package:debt_note/src/features/auth/domain/usecases/login_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase _loginUserUseCase;
  LoginBloc(this._loginUserUseCase) : super(LoginInitial()) {
    on<Login>((event, Emitter<LoginState> emit) async {
      print("onLogin");
      await _loginUserUseCase(params: event.user).then((value) => value.fold(
          (l) => print("nag error"), (r) => print("shit ${r.user!.uid}")));
    });

    on<LoginTest>((event, Emitter<LoginState> emit) async {
      addReminderToFirebase();
    });

    on<LoginTest1>((event, Emitter<LoginState> emit) async {
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
