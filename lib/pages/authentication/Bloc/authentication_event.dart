part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}


class SignupRequested extends AuthenticationEvent{
  final String email;
  final String password;
  SignupRequested(this.email, this.password);
}
class LoginButtonClickedEvent{}