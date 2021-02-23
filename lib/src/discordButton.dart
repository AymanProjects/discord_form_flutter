import 'package:flutter/material.dart';

class DiscordButton extends StatelessWidget {
  /// The [Text] widget inside the button.
  /// Can't be null
  /// Default is white
  final Text text;

  /// Pass a function that you would like to trigger
  /// whenever the button is pressed
  final VoidCallback onPressed;

  /// [isLoading] is used to control the button ability to be pressed,
  /// it's [false] by default, but if you set it to [true]
  /// it will be disabled and will show a [CircularProgressIndicator]
  /// in the center of the button
  final bool isLoading;

  /// Use this widget as a button in [DiscordForm].
  /// text and isLoading must not be null
  DiscordButton({
    @required this.text,
    this.onPressed,
    this.isLoading = false,
  })  : assert(text != null),
        assert(isLoading != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      /// expand to available width
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),

        /// control the button color using [Theme.primaryColor]
        color: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).primaryColor.withOpacity(0.3),

        /// disable the button if isLoading is true
        onPressed: isLoading ? null : onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: isLoading
              ? Container(
                  height: 20.0,
                  width: 20.0,

                  /// Indicator color will be the same as [Theme.accentColor]
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : text,
        ),
      ),
    );
  }
}
