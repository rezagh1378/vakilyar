import '../module/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TxtFeild extends StatefulWidget {
  const TxtFeild(
      {Key? key,
      this.keyboadtype,
      this.labelText,
      this.obscureText,
      this.onChanged,
      this.onSaved,
      this.prefixIcon,
      this.styleTextStyleTextForm,
      this.suffixIcon,
      this.textInputAction,
      this.validator,
        this.maxLines,
        this.tapped=false,
        this.ontap,
        this.customIconColor,
        this.auttoFocus,
        this.controller,

  this.wi,
  this.customWidthSize=false,
  this.he,
        this.minLine,
        this.customHeightSize=false

      })
      : super(key: key);
  final keyboadtype;
  final textInputAction;
  final onSaved;
  final onChanged;
  final validator;
  final styleTextStyleTextForm;
  final obscureText;
  final labelText;
  final prefixIcon;
  final suffixIcon;
  final customWidthSize;
  final customHeightSize;
  final he;
  final wi;
  final maxLines;
  final minLine;
  final ontap;
  final bool tapped;
  final  customIconColor;
  final  auttoFocus;
  final controller;

  @override
  State<TxtFeild> createState() => _TxtFeildState();
}

class _TxtFeildState extends State<TxtFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.customHeightSize?widget.he:60,
      width: widget.customWidthSize? widget.wi:Get.width - 30,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: widget.controller,
          onTap: widget.ontap,
          cursorColor: bl,
          autofocus: widget.auttoFocus??true,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboadtype,
          textInputAction: widget.textInputAction,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          validator: widget.validator,
          style: widget.styleTextStyleTextForm,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
              labelText: widget.labelText,
              fillColor: bg,

              labelStyle: Get.textTheme.subtitle1,
              filled: true,
              prefixIcon: Icon(
                widget.prefixIcon,
                size: 16,
               // color: tapped==true?customIconColor:itemTextFeild,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: borderTextFeild, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(

                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: bl, width: 1.5),
              ),
            suffixIcon: GestureDetector(
              // onTap: ()=>widget.obscureText==true?widget.obscureText=false:,
              child: Icon(
                widget.suffixIcon,
                size: 16,
                // color: tapped==true?customIconColor:itemTextFeild,
              ),
            ),
             ),
        ),
      ),
    );
  }
}
