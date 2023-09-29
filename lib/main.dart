import 'package:flutter/material.dart';
import 'package:formvalidation/bloc/login_bloc.dart';
import 'package:formvalidation/page/login.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        title: 'form validation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(255, 0, 0, 1),
            primary: Color.fromRGBO(246, 97, 97, 1),
          ),
        ),
        home: Login(),
      ),
    );
  }
}
