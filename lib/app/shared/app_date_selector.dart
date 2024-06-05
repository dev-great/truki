import 'package:flutter/material.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/core/constant/app_colors.dart';

class CustomDateRangeFormField extends StatefulWidget {
  const CustomDateRangeFormField({
    super.key,
    required this.label,
    required this.value,
    this.hint,
    this.onDateSelected,
    this.suffixIcon,
  });

  final String label;
  final Widget? suffixIcon;
  final TextEditingController value;
  final String? hint;
  final VoidCallback? onDateSelected;

  @override
  State<CustomDateRangeFormField> createState() =>
      _CustomDateRangeFormFieldState();
}

class _CustomDateRangeFormFieldState extends State<CustomDateRangeFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: widget.value,
      onChanged: (_) {},
      onTap: () {
        widget.onDateSelected?.call();
      },
      style: bodyTextStyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.primaryLiteColor.withOpacity(0.3),
        hintText: widget.hint,
        hintStyle: bodyTextStyle.copyWith(color: AppColor.textColor2),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.ashColor,
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
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
