part of 'authentication_bloc.dart';


@immutable
abstract class AuthenticationState {}
abstract class AuthenticationActionState extends AuthenticationState{}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState{}

class AuthenticationCompletedState extends AuthenticationState{}

class AuthenticationErrorState extends AuthenticationState{
  final String error;
  AuthenticationErrorState(this.error);
}

class UnAuthenticatedState extends AuthenticationState{}

FirebaseAuth auth = FirebaseAuth.instance;

class AuthenticateAndNavigateToHomePageActionState extends AuthenticationState{}
class CreateUserAndNavigateToHomePageActionState extends AuthenticationState{}