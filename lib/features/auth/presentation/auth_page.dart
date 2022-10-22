import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/common/components/common_button.dart';
import 'package:price_tracker/features/auth/bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  final TextEditingController tokenTextController =
      TextEditingController(text: 'Z9V23cGIopkORLr');

  AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Trying to connect..."),
              SizedBox(height: 100),
              TextField(
                controller: tokenTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "API Token",
                ),
              ),
              SizedBox(height: 100),
              CustomButton(
                title: "Connect Now",
                onPressed: () {
                  final token = tokenTextController.text;
                  BlocProvider.of<AuthBloc>(context).add(TryLogin(token));
                },
              ),
              SizedBox(height: 50),
              Text(
                state.errorMessage,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.red),
              ),
            ],
          );
        },
      ),
    );
  }
}
