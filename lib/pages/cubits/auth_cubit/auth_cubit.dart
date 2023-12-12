// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());

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

//   Future<void> registerUser(
//       {required String email, required String password}) async {
//     emit(RegisterLoding());
//     try {
//       UserCredential user = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       emit(RegisterSuccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         emit(RegisterFailuer(errMessage: 'Weak Password'));
//       } else if (e.code == 'email-already-in-use') {
//         emit(RegisterFailuer(errMessage: 'email already in use'));
//       }
//     } catch (e) {
//       emit(RegisterFailuer(errMessage: 'There was an error please try again'));
//       // TODO
//     }
//   }

  // @override
  // void onChange(Change<AuthState> change) {
  //   super.onChange(change);
  //   print(change);
  // }
// }
