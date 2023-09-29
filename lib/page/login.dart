import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation/bloc/login_bloc.dart';
import 'package:formvalidation/bloc/login_event.dart';
import 'package:formvalidation/bloc/login_state.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  controller: emailController,
                  onChanged: (val) {
                    BlocProvider.of<LoginBloc>(context)
                        .add(EmailChangedEvent(emailController.text));
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Email',
                      hintText: 'Email address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      )),
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is EmailErrorState) {
                    return Text(
                      state.errorEmail,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              TextField(
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<LoginBloc>(context)
                      .add(PasswordChangedEvent(passwordController.text));
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: "Password:",
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is PasswordErrorState) {
                    return Text(
                      state.errorPassword,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return CircularProgressIndicator();
                    }
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor:
                              (state is LoginValidState) ? Colors.blue : null,
                        ),
                        onPressed: () {
                          if (state is LoginValidState) {
                            BlocProvider.of<LoginBloc>(context).add(
                                LoginSubmittedEvent(emailController.text,
                                    passwordController.text));
                          }
                        },
                        child: Text("Sign In"));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
