import 'package:flutter/material.dart';

class DiscordFormField extends StatelessWidget {
  /// Display a text for as a hint inside the  form field.
  /// Style can be changed by overriding the [InputDecorationTheme]
  /// of your app theme
  final String hint;

  /// Pass a function that validates the field input.
  /// You should return a string in case of error,
  /// and return null if the input is valid.
  ///
  /// If you set it to null, no validations will apply
  final String Function(String) validator;

  /// Pass a function that you would like to trigger
  /// whenever the field is modified
  final Function(String) onChanged;

  /// If set to true, text will be obscured
  final bool isPassword;

  /// If set to true, the keyboard type will
  /// be [TextInputType.emailAddress]
  final bool isEmail;

  /// The suffix icon inside the field.
  /// Set it to null if you don't want to show
  /// an icon
  final Icon icon;

  /// A controller to store the state of the field.
  /// Can't be null
  final TextEditingController controller;

  /// Use this widget as a textField in [DiscordForm].
  DiscordFormField({
    this.hint = 'Field',
    this.validator,
    @required this.onChanged,
    this.isPassword = false,
    this.isEmail = false,
    this.icon,
    this.controller,
  })  : assert(hint != null),
        assert(onChanged != null),
        assert(isPassword != null),
        assert(isEmail != null),
        assert(controller != null);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      /// if isEmail is false, show a regular keyboard
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: icon,
        contentPadding: const EdgeInsets.all(12.0),

        /// The fill color is [Theme.inputDecorationTheme.fillColor]
        filled: true,
        enabledBorder: _border(),
        focusedBorder: _border(color: Theme.of(context).primaryColor),
        errorBorder: _border(color: Theme.of(context).errorColor),
        focusedErrorBorder: _border(color: Theme.of(context).errorColor),
      ),
    );
  }

  OutlineInputBorder _border({Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Colors.black,
        width: 1,
      ),
    );
  }
}
