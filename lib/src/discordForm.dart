import 'package:flutter/material.dart';
import 'defaultTheme.dart';

class DiscordForm extends StatelessWidget {
  /// Pass a [FormState] key to use it for validation.
  /// All children of this form will be validated automatically
  final GlobalKey<FormState> formKey;

  /// The children of te form can be any widget
  /// but mostly you will only need [DiscordFormField] and [DiscordButton]
  final List<Widget> children;

  /// How the validation should behave.
  /// default is [AutovalidateMode.disabled]
  /// which means it will only validate when
  /// [formKey.currentState.validate()] is called
  final AutovalidateMode autovalidateMode;

  /// Setting this to [EdgeInsets.zero] will
  /// cause the form to expand and fit it's parent.
  /// default is horizontal: 40.0 and vertical: 30.0
  final Padding outerPadding;

  /// Limit the maximum width for the form.
  /// default is 450.0
  final double maxWidth;

  /// by default it's false, but
  /// if set to true then the theme used on the form
  /// and it's children will be derived from you app theme
  final bool useTheAppTheme;

  /// Simple and clean form.
  /// In the chilren, you can pass any widget but
  /// preferably [DiscordFormField] and [DiscordButton]
  DiscordForm({
    @required this.formKey,
    @required this.children,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.outerPadding,
    this.maxWidth = 450.0,
    this.useTheAppTheme = false,
  })  : assert(formKey != null),
        assert(children != null),
        assert(autovalidateMode != null),
        assert(maxWidth != null),
        assert(useTheAppTheme != null);

  @override
  Widget build(BuildContext context) {
    return Theme(
      /// if useTheAppTheme is false, then a pre-made theme will be applied
      data: useTheAppTheme ? Theme.of(context) : defaultTheme,
      child: Scaffold(
        body: Center(
          /// wrap children in SingleChildScrollView to avoid overflowing
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              width: double.infinity,
              padding: outerPadding ??
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: Form(
                autovalidateMode: autovalidateMode,
                key: formKey,
                child: Column(
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
