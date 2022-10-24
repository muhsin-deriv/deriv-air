import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/common/components/common_button.dart';
import 'package:price_tracker/features/auth/bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController tokenTextController =
      TextEditingController(text: 'Z9V23cGIopkORLr');

  @override
  void didChangeDependencies() {
    BlocProvider.of<AuthBloc>(context).add(TryLoginWithSavedToken());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

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
