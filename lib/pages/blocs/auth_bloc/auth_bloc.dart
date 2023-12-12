import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);

          emit(LoginSucccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(errMessage: 'User Not Found'));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailure(errMessage: 'Wrong password'));
          }
        } catch (ex) {
          emit(LoginFailure(errMessage: 'Somthing went wrong'));
          // TODO
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoding());
        try {
          UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterFailuer(errMessage: 'Weak Password'));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFailuer(errMessage: 'email already in use'));
          }
        } catch (e) {
          emit(RegisterFailuer(
              errMessage: 'There was an error please try again'));
          // TODO
        }
      }
      // TODO: implement event handler
    });
  }
}
