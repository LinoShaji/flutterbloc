import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../HomePageUI/HomePage.dart';
import 'Bloc/authentication_bloc.dart';
import 'package:get/get.dart';


class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context){
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) => current is AuthenticationActionState,
      buildWhen: (previous, current) => current is !AuthenticationActionState,
      listener: (context, state) {
       if(state is AuthenticationCompletedState){
         Get.to(HomePage());
       }
       if(state is AuthenticationErrorState){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error),));
       }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(children: [
            TextFormField()
          ]),
        );
      },
    );
  }
}
