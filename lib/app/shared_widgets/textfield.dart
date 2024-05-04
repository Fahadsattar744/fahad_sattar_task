import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_constant/App_colors.dart';
import '../app_constant/app_fonts.dart';
class UnderLineTextField extends StatefulWidget {
  final String? title;
  final double? height;
  final double? width;
  final double? fontSize;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmit;
  final Function(String)? onChanged;
  final String? hintText;
  final Function? onTapSuffixIcon;
  final Function? onTap;
  final Function? onTapPrefixIcon;
  final suffixIconData;
  final bool? multiIcon;
  final IconData? prefixIconData;
  final FocusNode? focusNode;
  final Color backgroundColor;
  final Color? hintTextColor;
  final Color cursorColor;
  final Color? textColor;
  final Color? errorColor;
  final Color? borderColor;
  final Color? borderEnableColor;
  final Color prefixIconColor;
  final Color sufixIconColor;
  final Widget? prefixWidget;
  final TextInputType inputType;
  final bool obs, read;
  final Widget? suffixIcons;
  final Widget? prefixIcons;
  final bool? fullBorder;
  final bool? family;
  final String? label;
  final String? fontFamily;
  final bool? multiLine;
  final bool? contentPadding;
  final bool? autoFocus;
  final String? error;
  final TextInputAction? inputAction;
  final bool? showUnderline;
  final List<TextInputFormatter>? inputFormatters;
  // ignore: deprecated_member_use
  final FilteringTextInputFormatter? inputFormat;
  final TextCapitalization? capital;
  final InputBorder? borderDecoration;
  final InputBorder? errorBorderDecoration;

  static const Color _textFieldThemeColor = Color(0xff707070);

  const UnderLineTextField(
      {Key? key,
        this.onChanged,this.inputFormatters,
        this.borderColor,
        this.fontSize = 13.5,
        this.inputFormat,
        this.height,
        this.width,
        this.fullBorder,
        this.multiIcon,
        this.error,
        this.title,
        this.onTap,
        this.controller,
        this.validator,
        this.label,
        this.fontFamily,
        this.family,
        this.borderDecoration,
        this.onFieldSubmit,
        this.hintText,
        this.borderEnableColor,
        this.onTapSuffixIcon,
        this.suffixIconData,
        this.errorBorderDecoration,
        this.prefixIconData,
        this.onTapPrefixIcon,
        this.focusNode,
        this.backgroundColor = Colors.transparent,
        this.hintTextColor = _textFieldThemeColor,
        this.cursorColor = _textFieldThemeColor,
        this.textColor = _textFieldThemeColor,
        this.prefixIconColor = _textFieldThemeColor,
        this.sufixIconColor = _textFieldThemeColor,
        this.errorColor,
        this.prefixWidget,
        this.inputType = TextInputType.text,
        this.obs = false,
        this.inputAction,
        this.suffixIcons,
        this.prefixIcons,
        this.read = false,
        this.multiLine ,
        this.capital,
        this.showUnderline = true,
        this.contentPadding = false,
        this.autoFocus})
      : super(key: key);

  @override
  _UnderLineTextFieldState createState() => _UnderLineTextFieldState();
}

class _UnderLineTextFieldState extends State<UnderLineTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      focusNode: widget.focusNode,
      readOnly: widget.read,
      obscureText: widget.obs,
      onChanged: widget.onChanged,
      textInputAction: widget.inputAction,
      controller: widget.controller,
      inputFormatters:widget.inputFormatters,
      keyboardType: widget.inputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding==true ? EdgeInsets.fromLTRB(12, 0, 12, 8) : EdgeInsets.zero,
        errorStyle: TextStyle(
          color: widget.errorColor ?? Colors.red,
          fontSize: widget.fontSize,
        ),
        border: widget.borderDecoration,
        errorText: widget.error,
        prefix: widget.prefixWidget,
        suffixIcon: widget.suffixIcons,
        prefixIcon: widget.prefixIcons,
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: widget.borderColor?? AppColors.greyColor)),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color:widget.borderColor??  AppColors.secondary)),
        hintText: widget.hintText,
        labelText: widget.label,
        hintStyle: TextStyle(
          color: widget.hintTextColor?? AppColors.black,
          fontSize: 13.5,
        ),
        labelStyle: const TextStyle(
          color:  AppColors.greyColor,
          fontFamily: AppFonts.helveticaRegular,
          fontSize: 13.5,
        ),
      ),

    );
  }
}

