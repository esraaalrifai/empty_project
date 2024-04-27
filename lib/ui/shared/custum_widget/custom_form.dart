import 'package:darrebni/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:darrebni/ui/shared/colors.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    Key? key,
    required this.hinttext,
    this.prifex,
    this.suffix,
    this.textinputtype,
    this.color = const Color.fromRGBO(242, 242, 242, 1),
    this.hintcolor = const Color.fromRGBO(185, 181, 181, 1),
    this.bordercolor = const Color.fromRGBO(185, 181, 181, 1),
    this.controller,
    this.onSubmit,
    this.onChange,
    this.validate,
    this.textalign,
    this.maxlenghth,
    this.padding,
  }) : super(key: key);
  final String hinttext;
  final IconData? prifex;
  final IconData? suffix;
  final TextInputType? textinputtype;
  final Color? color;
  final Color? hintcolor;
  final Color? bordercolor;
  final Function? onSubmit;
  final TextAlign? textalign;
  final Function? onChange;
  final int? maxlenghth;
  final EdgeInsets? padding;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHieght(5),
      child: TextFormField(
        onChanged: (value) {
          if (onChange != null) onChange!();
        },
        onFieldSubmitted: (value) {
          if (onSubmit != null) onSubmit!();
        },
        maxLines: 10,
        validator: validate,
        controller: controller,
        keyboardType: textinputtype,
        autofocus: true,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxlenghth),
        ],
        textAlign: textalign ?? TextAlign.start,
        enableInteractiveSelection: true,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          fillColor: color,
          filled: true,
          prefixIcon: Icon(
            prifex,
            color: AppColors.greytextColor,
          ),
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          hintText: hinttext,
          hintStyle: TextStyle(
            color: hintcolor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.greytextColor),
          ),
        ),
      ),
    );
  }
}
