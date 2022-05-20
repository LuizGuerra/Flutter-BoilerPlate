import 'package:flutter/cupertino.dart';

import '../../resources/app_colors.dart';

// ignore_for_file: avoid_init_to_null
/// TextField type
enum TextFieldFinality { regular, email, password }

///Text Fields's configurations class
class TextFieldConfigurations {
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Color fieldColor;
  final Color fontColor;
  final double fontSize;
  final double height;

  TextFieldConfigurations(
      {this.fontWeight = FontWeight.normal,
      this.backgroundColor = AppColors.lightGray,
      this.fieldColor = AppColors.background2,
      this.fontColor = AppColors.background,
      this.fontSize = 16,
      this.height = 54});

  static TextFieldConfigurations lightGray() => TextFieldConfigurations();
}

/// Reusable button for the application
class ReusableTextField extends StatefulWidget {
  /// Text field placeholder text
  final String placeholder;

  /// Text field text controller
  final TextEditingController controller;

  /// Text field configurations
  final TextFieldConfigurations configuration;

  /// Text field should be regular or special
  final TextFieldFinality finality;

  /// Text field border radius
  final BorderRadius borderRadius;

  ///Initializer
  ReusableTextField(
      {Key? key,
      required this.placeholder,
      required this.controller,
      TextFieldConfigurations? configurations = null,
      this.finality = TextFieldFinality.regular,
      double borderRadius = 20.0})
      : borderRadius = BorderRadius.all(Radius.circular(borderRadius)),
        configuration = configurations ?? TextFieldConfigurations.lightGray(),
        super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  ///Initializer
  _ReusableTextFieldState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.configuration.height,
      // width: widget.configuration.width,
      child: CupertinoTextField(
        obscureText: _isPassword(),
        keyboardType: _keyboard(),
        autocorrect: !_isEmail(),
        controller: widget.controller,
        placeholderStyle: TextStyle(
          color: widget.configuration.fieldColor,
          fontSize: widget.configuration.fontSize,
          fontWeight: widget.configuration.fontWeight,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20.0),
        placeholder: widget.placeholder,
        style: TextStyle(
          fontSize: widget.configuration.fontSize,
          fontWeight: widget.configuration.fontWeight,
          color: widget.configuration.fontColor,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.configuration.backgroundColor,
          ),
          borderRadius: widget.borderRadius,
          color: widget.configuration.backgroundColor,
        ),
      ),
    );
  }

  bool _isPassword() => widget.finality == TextFieldFinality.password;

  bool _isEmail() => widget.finality == TextFieldFinality.email;

  TextInputType _keyboard() {
    if (widget.finality == TextFieldFinality.email) {
      return TextInputType.emailAddress;
    }
    return TextInputType.emailAddress;
  }
}
