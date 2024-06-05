import 'package:flutter/material.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/core/constant/app_colors.dart';

class CustomInputText extends StatefulWidget {
  const CustomInputText({
    Key? key,
    required this.inputType,
    this.textColor,
    this.color,
    this.prefix,
    required this.hint,
    this.onChangeVal,
    this.suffix,
    this.obscure,
    this.onChanged,
    this.controller,
    this.maxLength,
  }) : super(key: key);
  final Widget? prefix;
  final Widget? suffix;
  final Color? color;
  final Color? textColor;
  final String hint;
  final bool? obscure;
  final String? onChangeVal;
  final TextInputType inputType;
  final Function? onChanged;
  final int? maxLength;
  final TextEditingController? controller;

  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    if (widget.controller != null && widget.onChangeVal != null) {
      _textEditingController.text = widget.onChangeVal!;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      style: bodyTextStyle,
      keyboardType: widget.inputType,
      obscureText: widget.obscure ?? false,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        hintText: widget.hint,
        hintStyle: bodyTextStyle,
        isDense: true,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primaryColor,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.text3Color,
            width: 1,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.errorColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.errorColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
