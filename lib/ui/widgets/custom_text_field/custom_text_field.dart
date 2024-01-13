part of '../../../ice_flutter_toolkit.dart';
//
// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     super.key,
//     // this.textTitle,
//     // this.titleStyle,
//     required this.hintKey,
//     this.hintStyle,
//     this.onChanged,
//     required this.controller,
//     this.showObscureButton = false,
//     this.suffixTitleWidget,
//     this.underlineText,
//     this.underlineTap,
//   });
//
//   final CustomTextFieldController controller;
//
//   final void Function(String)? onChanged;
//   // final String? textTitle;
//   // final TextStyle? titleStyle;
//   final String hintKey;
//   final TextStyle? hintStyle;
//   final bool showObscureButton;
//   final Widget? suffixTitleWidget;
//   final String? underlineText;
//   final void Function()? underlineTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (context) {
//       return TextField(
//         key: key,
//         onTap: onTap,
//         onChanged: (text) {
//           controller.updateText(text);
//           if (onChanged != null) onChanged!(text);
//         },
//         controller: controller.textEditingController,
//         obscureText: controller.obscure,
//         style: text ?? style.text,
//         decoration: InputDecoration(
//           contentPadding: contentPadding ?? style.contentPadding,
//           errorText: controller.errorMessage,
//           errorStyle: error ?? style.error,
//           border: OutlineInputBorder(
//               borderRadius: _box.borderRadius, borderSide: _box.side),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: _box.borderRadius, borderSide: _box.side),
//           disabledBorder: OutlineInputBorder(
//               borderRadius: _box.borderRadius, borderSide: _box.side),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: _box.borderRadius, borderSide: _box.side),
//           errorBorder: OutlineInputBorder(
//               borderRadius: _errorBox.borderRadius,
//               borderSide: _errorBox.side),
//           filled: true,
//           fillColor: _box.fillColor,
//           hintText: _hintData.text,
//           hintStyle: _hintData.style,
//           suffix: !showObscureButton &&
//               (controller.errorMessage?.isEmpty ?? true)
//               ? suffixTitleWidget
//               : SizedBox(
//             child: GestureDetector(
//               onTap: controller.switchObscure,
//               child: Padding(
//                 padding: const EdgeInsets.all(1),
//                 child: !showObscureButton
//                     ? (useWarningSvg
//                     ? SvgPicture.asset(
//                   'assets/svg/warning.svg',
//                   colorFilter:
//                   _errorBox.side.color.filter,
//                 )
//                     : Icon(
//                   Icons.warning_amber_rounded,
//                   color: _errorBox.side.color,
//                 ))
//                     : Icon(
//                   controller.obscure
//                       ? Icons.visibility_outlined
//                       : Icons.visibility_off_outlined,
//                   color: (controller.errorMessage?.isEmpty ??
//                       true)
//                       ? style.suffixWidgetColor
//                       : _errorBox.side.color,
//                 ),
//               ),
//             ),
//           ),
//           isDense: isDense,
//         ),
//         keyboardType: keyboardType,
//         inputFormatters: inputFormatters,
//         minLines: minLines,
//         maxLines: maxLines,
//       );
//       return TextField(
//         key: key,
//         onChanged: (text) {
//           controller.updateText(text);
//           if (onChanged != null) onChanged!(text);
//         },
//         controller: controller.textEditingController,
//         obscureText: controller.obscure,
//         style: const TextStyle(
//           fontFamily: 'Golos',
//           color: GrayColors.gray1A,
//           fontWeight: FontWeight.w400,
//           fontSize: 16,
//         ),
//         decoration: InputDecoration(
//           contentPadding:
//           const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
//           errorText: controller.errorMessage,
//           border: UnderlineInputBorder(
//               borderRadius: BorderRadius.circular(1),
//               borderSide: const BorderSide(color: GrayColors.grayEF)),
//           focusedBorder: UnderlineInputBorder(
//               borderRadius: BorderRadius.circular(1),
//               borderSide: const BorderSide(color: GrayColors.grayEF)),
//           disabledBorder: UnderlineInputBorder(
//               borderRadius: BorderRadius.circular(1),
//               borderSide: const BorderSide(color: GrayColors.grayEF)),
//           enabledBorder: UnderlineInputBorder(
//               borderRadius: BorderRadius.circular(1),
//               borderSide: const BorderSide(color: GrayColors.grayEF)),
//           filled: true,
//           fillColor: GrayColors.white,
//           hintText: hintKey,
//           hintStyle: const TextStyle(
//             fontFamily: 'Golos',
//             color: GrayColors.gray7C,
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//           ),
//           suffix: !showObscureButton
//               ? null
//               : SizedBox(
//             //alignment: Alignment.centerRight,
//             child: GestureDetector(
//               onTap: () {
//                 controller.obscure = !controller.obscure;
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(1),
//                 child: Icon(
//                   controller.obscure
//                       ? Icons.visibility_outlined
//                       : Icons.visibility_off_outlined,
//                   color: GrayColors.gray7C,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // if (textTitle != null)
//         //   Row(
//         //     children: [
//         //       Text(
//         //         textTitle!,
//         //         style: titleStyle ?? const TextStyle(
//         //               color: GrayColors.gray52,
//         //               fontWeight: FontWeight.w400,
//         //               fontSize: 16,
//         //             ),
//         //       ),
//         //       if (suffixTitleWidget != null) const Spacer(),
//         //       if (suffixTitleWidget != null) suffixTitleWidget!,
//         //     ],
//         //   ),
//         // const SizedBox(height: 8),
//         Observer(builder: (context) {
//           return TextField(
//             key: key,
//             onChanged: (text) {
//               controller.updateText(text);
//               if (onChanged != null) onChanged!(text);
//             },
//             controller: controller.textEditingController,
//             obscureText: controller.obscure,
//             style: const TextStyle(
//               fontFamily: 'Golos',
//               color: GrayColors.gray1A,
//               fontWeight: FontWeight.w400,
//               fontSize: 16,
//             ),
//             decoration: InputDecoration(
//               contentPadding:
//                   const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
//               errorText: controller.errorMessage,
//               border: UnderlineInputBorder(
//                   borderRadius: BorderRadius.circular(1),
//                   borderSide: const BorderSide(color: GrayColors.grayEF)),
//               focusedBorder: UnderlineInputBorder(
//                   borderRadius: BorderRadius.circular(1),
//                   borderSide: const BorderSide(color: GrayColors.grayEF)),
//               disabledBorder: UnderlineInputBorder(
//                   borderRadius: BorderRadius.circular(1),
//                   borderSide: const BorderSide(color: GrayColors.grayEF)),
//               enabledBorder: UnderlineInputBorder(
//                   borderRadius: BorderRadius.circular(1),
//                   borderSide: const BorderSide(color: GrayColors.grayEF)),
//               filled: true,
//               fillColor: GrayColors.white,
//               hintText: hintKey,
//               hintStyle: const TextStyle(
//                 fontFamily: 'Golos',
//                 color: GrayColors.gray7C,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 16,
//               ),
//               suffix: !showObscureButton
//                   ? null
//                   : SizedBox(
//                       //alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: () {
//                           controller.obscure = !controller.obscure;
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(1),
//                           child: Icon(
//                             controller.obscure
//                                 ? Icons.visibility_outlined
//                                 : Icons.visibility_off_outlined,
//                             color: GrayColors.gray7C,
//                           ),
//                         ),
//                       ),
//                     ),
//             ),
//           );
//         }),
//         if (underlineText != null) const SizedBox(height: 2),
//         if (underlineText != null)
//           GestureDetector(
//             onTap: underlineTap,
//             child: Text(
//               underlineText!,
//               style: const TextStyle(
//                 fontFamily: 'Golos',
//                 color: GrayColors.gray50,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
