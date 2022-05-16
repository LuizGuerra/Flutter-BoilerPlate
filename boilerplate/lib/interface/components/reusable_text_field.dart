import 'package:flutter/cupertino.dart';

import '../../resources/app_colors.dart';

/// TextField type
enum TextFieldFinality {
  regular, email, password
}

///Text Fields's configurations class
class TextFieldConfigurations {
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Color fieldColor = AppColors.background2;
  final Color fontColor = AppColors.white;
  final double fontSize = 16;
  final double height = 48;
  final double width = 200;

  ///Initializer
  TextFieldConfigurations({
    required this.fontWeight,
    required this.backgroundColor,
  });
}

/// Enumeration for types of TextFields
enum TextFieldType {
  lightGray,
}

/// Text Field Configurations' Factory
extension TextFieldTypeExtension on TextFieldType {
  TextFieldConfigurations configuration() {
    switch (this) {
      case TextFieldType.lightGray:
        return TextFieldConfigurations(
          fontWeight: FontWeight.w400,
          backgroundColor: AppColors.lightGray,
        );
    }
  }
}

/// Reusable button for the application
class ReusableTextField extends StatefulWidget {
  /// Text field placeholder text
  final String placeholderText;

  /// Text field text controller
  final TextEditingController textEditingController;

  /// Text field configurations
  final TextFieldConfigurations configuration;

  /// Text field should be regular or special
  final TextFieldFinality finality;

  /// Text field border radius
  final BorderRadius borderRadius;

  ///Initializer
  ReusableTextField(
      {Key? key, required this.placeholderText,
      required this.textEditingController,
      TextFieldType type = TextFieldType.lightGray,
      double borderRadius = 50.0,
      this.finality = TextFieldFinality.regular})
      : configuration = type.configuration(),
      this.borderRadius = BorderRadius.all(Radius.circular(borderRadius)), super(key: key);

  @override
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  ///Initializer
  _ReusableTextFieldState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.configuration.height,
      width: widget.configuration.width,
      child: CupertinoTextField(
        obscureText: _isPassword(),
        keyboardType: _keyboard(),
        autocorrect: !_isEmail(),
        controller: widget.textEditingController,
        placeholderStyle: TextStyle(
          color: widget.configuration.fieldColor,
          fontSize: widget.configuration.fontSize,
          fontWeight: widget.configuration.fontWeight,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20.0),
        placeholder: widget.placeholderText,
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
