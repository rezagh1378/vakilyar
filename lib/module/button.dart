import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constans.dart';

class Btn extends StatelessWidget {
  const Btn(
      {Key? key,
      this.alignmentText,
      this.customAlignmentText = false,
      this.hasBorder,
      this.title,
      this.customHeightSize,
      this.customHeight = false,
      this.customWidth = false,
      this.customWidthtSize,
      this.itemIcon,
      this.iconBtn = false,
      this.color,
      this.customeTextStyle,
      this.customColor = false})
      : super(key: key);
  final hasBorder;
  final customAlignmentText;
  final alignmentText;
  final title;
  final customHeight;
  final customWidth;
  final customHeightSize;
  final customWidthtSize;
  final iconBtn;
  final itemIcon;
  final customColor;
  final color;
  final customeTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: customHeight ? customHeightSize : 45,
      width: customWidth ? customWidthtSize : Get.width / 4,
      decoration: BoxDecoration(
          color: customColor ? color : (hasBorder ? white : bl),
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(color: bl)
              : Border.fromBorderSide(BorderSide.none)),
      child: Container(
        alignment: customAlignmentText ? alignmentText : Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconBtn
              ? [
                  itemIcon,
                  SizedBox(
                    width: 10,
                  ),
                  Text(title,
                      style: customeTextStyle == null
                          ? hasBorder
                              ? Get.textTheme.headline2!
                                  .copyWith(fontWeight: FontWeight.w900)
                              : Get.textTheme.headline2!.copyWith(
                                  fontWeight: FontWeight.w900, color: black)
                          : customeTextStyle),
                ]
              : [
                  Text(
                    title,
                    style: hasBorder
                        ? Get.textTheme.headline2!.copyWith(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            color: black)
                        : Get.textTheme.headline2!.copyWith(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            // color: black
                          ),
                  ),
                ],
        ),
      ),
    );
  }
}
