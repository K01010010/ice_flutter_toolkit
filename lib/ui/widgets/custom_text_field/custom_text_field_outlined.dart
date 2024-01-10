part of '../../../ice_flutter_toolkit.dart';

class TextFieldStack extends StatelessWidget {
  const TextFieldStack({
    super.key,
    this.stackSuffixWidget,
    required this.textField,
  });

  final Widget? stackSuffixWidget;
  final Widget textField;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      textField,
      if (stackSuffixWidget != null)
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: stackSuffixWidget!,
          ),
        ),
    ]);
  }
}

class CustomTextFieldOutlined extends StatelessWidget {
  CustomTextFieldOutlined({
    super.key,
    this.text,
    this.error,
    this.onChanged,
    this.onTap,
    required this.controller,
    this.useWarningSvg = false,
    this.showObscureButton = false,
    this.suffixTitleWidget,
    this.titleOffset,
    List<TextData>? titles,
    String? title,
    TextStyle? titleStyle,
    required String hintText,
    TextStyle? hintStyle,
    BoxData? box,
    BoxData? errorBox,
    this.contentPadding,
    this.widgetMargin,
    this.keyboardType,
    this.inputFormatters,
    this.isDense = false,
    this.minLines = 1,
    this.maxLines = 1,
  })  : _box = box ?? AppStyle.style.fieldStyle.box,
        _errorBox = errorBox ?? AppStyle.style.fieldStyle.errorBox,
        _titles = titles ??
            [
              if (title != null)
                TextData(title, titleStyle ?? AppStyle.style.fieldStyle.title)
            ],
        _hintData =
            TextData(hintText, hintStyle ?? AppStyle.style.fieldStyle.hint);

  final List<TextData> _titles;
  final double? titleOffset;

  final TextData _hintData;
  final TextStyle? text;
  final TextStyle? error;

  final CustomTextFieldController controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  final BoxData _box;
  final BoxData _errorBox;

  final EdgeInsets? contentPadding;
  final EdgeInsets? widgetMargin;

  final bool showObscureButton;
  final bool useWarningSvg;
  final Widget? suffixTitleWidget;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isDense;
  final int minLines;
  final int maxLines;

  CustomFieldStyle get style => AppStyle.style.fieldStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widgetMargin ?? style.widgetMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_titles.isNotEmpty)
            _titles.length == 1
                ? Text(
                    _titles.first.text,
                    style: _titles.first.style,
                  )
                : RichText(
                    text: TextSpan(
                      children: _titles
                          .map(
                            (titleElem) => TextSpan(
                              text: titleElem.text,
                              style: titleElem.style,
                            ),
                          )
                          .toList(),
                    ),
                  ),
          if (_titles.isNotEmpty)
            SizedBox(height: titleOffset ?? style.titleOffset),
          Observer(builder: (context) {
            return TextField(
              key: key,
              onTap: onTap,
              onChanged: (text) {
                controller.updateText(text);
                if (onChanged != null) onChanged!(text);
              },
              controller: controller.textEditingController,
              obscureText: controller.obscure,
              style: text ?? style.text,
              decoration: InputDecoration(
                contentPadding: contentPadding ?? style.contentPadding,
                errorText: controller.errorMessage,
                errorStyle: error ?? style.error,
                border: OutlineInputBorder(
                    borderRadius: _box.borderRadius, borderSide: _box.side),
                focusedBorder: OutlineInputBorder(
                    borderRadius: _box.borderRadius, borderSide: _box.side),
                disabledBorder: OutlineInputBorder(
                    borderRadius: _box.borderRadius, borderSide: _box.side),
                enabledBorder: OutlineInputBorder(
                    borderRadius: _box.borderRadius, borderSide: _box.side),
                errorBorder: OutlineInputBorder(
                    borderRadius: _errorBox.borderRadius,
                    borderSide: _errorBox.side),
                filled: true,
                fillColor: _box.fillColor,
                hintText: _hintData.text,
                hintStyle: _hintData.style,
                suffix: !showObscureButton &&
                        (controller.errorMessage?.isEmpty ?? true)
                    ? suffixTitleWidget
                    : SizedBox(
                        child: GestureDetector(
                          onTap: controller.switchObscure,
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: !showObscureButton
                                ? (useWarningSvg
                                    ? SvgPicture.asset(
                                        'assets/svg/warning.svg',
                                        colorFilter:
                                            _errorBox.side.color.filter,
                                      )
                                    : Icon(
                                        Icons.warning_amber_rounded,
                                        color: _errorBox.side.color,
                                      ))
                                : Icon(
                                    controller.obscure
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: (controller.errorMessage?.isEmpty ??
                                            true)
                                        ? style.suffixWidgetColor
                                        : _errorBox.side.color,
                                  ),
                          ),
                        ),
                      ),
                isDense: isDense,
              ),
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              minLines: minLines,
              maxLines: maxLines,
            );
          }),
        ],
      ),
    );
  }
}
