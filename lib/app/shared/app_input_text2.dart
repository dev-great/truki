import 'package:flutter/material.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/core/constant/app_colors.dart';

class CustomInputText2 extends StatefulWidget {
  const CustomInputText2({
    super.key,
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
  });
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
  State<CustomInputText2> createState() => _CustomInputText2State();
}

class _CustomInputText2State extends State<CustomInputText2> {
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
    return TextField(
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
        filled: true,
        fillColor: AppColor.primaryLiteColor.withOpacity(0.3),
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        hintText: widget.hint,
        hintStyle: bodyTextStyle.copyWith(color: AppColor.textColor2),
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.ashColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.errorColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.errorColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
