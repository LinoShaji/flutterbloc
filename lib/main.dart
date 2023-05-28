import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/logic/auth_repo/auth_repo.dart';
import 'package:flutterbloc/pages/authentication/Bloc/authentication_bloc.dart';
import 'package:flutterbloc/pages/authentication/authentication.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => AuthenticationBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
          ),
          child: GetMaterialApp(
            home: Authentication(),
          ),
        ));
  }
}
