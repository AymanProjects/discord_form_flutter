import 'package:flutter/material.dart';
import 'package:discord_form_flutter/discord_form_flutter.dart';

main() {
  runApp(
    MaterialApp(
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// to preserve the state of form fields, you have to
  /// create a controller for each.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// a form key, used for validation
  final _formKey = GlobalKey<FormState>();

  /// to store the entered email
  String _email;

  /// to store the entered password
  String _password;

  /// control when the button should be loading
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return DiscordForm(
      formKey: _formKey,
      children: [
        DiscordFormField(
          /// to show an email keybaord, set this to true
          isEmail: true,
          hint: 'Email',
          icon: Icon(Icons.email),
          onChanged: (value) {
            /// update our local variable
            _email = value;
          },
          controller: emailController,

          /// return null when the used input is valid
          validator: (value) => value.isEmpty ? 'can\'t be empty' : null,
        ),

        /// add vertical spacing between fields
        SizedBox(height: 25),

        ///
        DiscordFormField(
          /// to hide the password, set this to true
          isPassword: true,
          hint: 'Password',
          icon: Icon(Icons.lock),
          onChanged: (value) {
            _password = value;
          },
          controller: passwordController,

          /// return null when the used input is valid
          validator: (value) =>
              value.length < 6 ? 'minimum 6 characters' : null,
        ),
        SizedBox(height: 35),
        DiscordButton(
          isLoading: _loading,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              print('Signed up succesfully!'
                  ' Email: $_email, Password: $_password');
            }
          },
          text: Text(
            'Sign up',
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}
