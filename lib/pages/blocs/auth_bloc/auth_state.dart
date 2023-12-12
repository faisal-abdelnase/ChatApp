part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoding extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailuer extends AuthState {
  String errMessage;

  RegisterFailuer({required this.errMessage});
}

class LoginSucccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  String errMessage;
  LoginFailure({required this.errMessage});
}
