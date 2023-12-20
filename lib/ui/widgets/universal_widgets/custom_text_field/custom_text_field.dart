import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ice_flutter_toolkit/ui/widgets/universal_widgets/custom_text_field/custom_text_field_controller.dart';
import 'package:ice_flutter_toolkit/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.textTitle,
    this.titleStyle,
    required this.hintKey,
    this.hintStyle,
    this.onChanged,
    required this.controller,
    this.showObscureButton = false,
    this.suffixTitleWidget,
    this.underlineText,
    this.underlineTap,
  }) : super(key: key);

  final CustomTextFieldController controller;

  final void Function(String)? onChanged;
  final String? textTitle;
  final TextStyle? titleStyle;
  final String hintKey;
  final TextStyle? hintStyle;
  final bool showObscureButton;
  final Widget? suffixTitleWidget;
  final String? underlineText;
  final void Function()? underlineTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textTitle != null)
          Row(
            children: [
              Text(
                textTitle!,
                style: titleStyle ?? const TextStyle(
                      color: AppColors.gray52,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
              ),
              if (suffixTitleWidget != null) const Spacer(),
              if (suffixTitleWidget != null) suffixTitleWidget!,
            ],
          ),
        const SizedBox(height: 8),
        Observer(builder: (context) {
          return material.TextFormField(
            key: key,
            onChanged: (text) {
              controller.updateText(text);
              if (onChanged != null) onChanged!(text);
            },
            controller: controller.textEditingController,
            obscureText: controller.obscure,
            style: const TextStyle(
              fontFamily: 'Golos',
              color: AppColors.gray1A,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            decoration: material.InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
              errorText: controller.errorMessage,
              border: material.UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(color: AppColors.grayEF)),
              focusedBorder: material.UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(color: AppColors.grayEF)),
              disabledBorder: material.UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(color: AppColors.grayEF)),
              enabledBorder: material.UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(color: AppColors.grayEF)),
              filled: true,
              fillColor: AppColors.white,
              hintText: hintKey,
              hintStyle: const TextStyle(
                fontFamily: 'Golos',
                color: AppColors.gray7C,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              suffix: !showObscureButton
                  ? null
                  : SizedBox(
                      //alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          controller.obscure = !controller.obscure;

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Icon(
                            controller.obscure
                                ? material.Icons.visibility_outlined
                                : material.Icons.visibility_off_outlined,
                            color: AppColors.gray7C,
                          ),
                        ),
                      ),
                    ),
            ),
          );
        }),
        if (underlineText != null) const SizedBox(height: 2),
        if (underlineText != null)
          GestureDetector(
            onTap: underlineTap,
            child: Text(
              underlineText!,
              style: const TextStyle(
                fontFamily: 'Golos',
                color: AppColors.primary437,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}
