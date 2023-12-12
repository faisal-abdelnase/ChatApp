// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import '../../../helper/show_snack_bar.dart';

// part 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   Future<void> loginUser(
//       {required String email, required String password}) async {
//     emit(LoginLoading());
//     try {
//       UserCredential user = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);

//       emit(LoginSucccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(LoginFailure(errMessage: 'User Not Found'));
//       } else if (e.code == 'wrong-password') {
//         emit(LoginFailure(errMessage: 'Wrong password'));
//       }
//     } catch (ex) {
//       emit(LoginFailure(errMessage: 'Somthing went wrong'));
//       // TODO
//     }
//   }
// }
