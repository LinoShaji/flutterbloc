import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../logic/auth_repo/auth_repo.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  AuthenticationBloc({required this.authRepository}) : super(AuthenticationInitialState()) {
    on<SignupRequested>(event, emit) async {
      emit(AuthenticationInitialState());
      try {
        await AuthRepository().CreateAccountRequest(
            email: event.email, password: event.password);
        emit(AuthenticationCompletedState());
      }catch(e){emit(AuthenticationErrorState(e.toString()));
      emit(UnAuthenticatedState());}
    }
  }
}
