part of '../../../ice_flutter_toolkit.dart';

class TextFieldStack extends StatelessWidget {
  const TextFieldStack({
    super.key,
    this.stackSuffixWidget,
    required this.child,
  });

  final Widget? stackSuffixWidget;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
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

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
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
      required this.borderType,
      String? underlineText,
      TextStyle? underlineStyle,
      this.underlineTap})
      : _box = box ?? AppStyle.style.fieldStyle.box,
        _errorBox = errorBox ?? AppStyle.style.fieldStyle.errorBox,
        _titles = titles ??
            [
              if (title != null)
                TextData(title, titleStyle ?? AppStyle.style.fieldStyle.title)
            ],
        _hintData =
            TextData(hintText, hintStyle ?? AppStyle.style.fieldStyle.hint),
        _underlineData = underlineText == null
            ? null
            : TextData(underlineText,
                underlineStyle ?? AppStyle.style.fieldStyle.title);

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
  final InputBorderType borderType;

  final TextData? _underlineData;
  final void Function()? underlineTap;

  CustomFieldStyle get style => AppStyle.style.fieldStyle;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
            _SubTextFieldOutlined(
              text: text,
              error: error,
              onChanged: onChanged,
              onTap: onTap,
              controller: controller,
              useWarningSvg: useWarningSvg,
              showObscureButton: showObscureButton,
              suffixTitleWidget: suffixTitleWidget,
              hintData: _hintData,
              box: _box,
              errorBox: _errorBox,
              contentPadding: contentPadding,
              widgetMargin: widgetMargin,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              isDense: isDense,
              minLines: minLines,
              maxLines: maxLines,
              borderType: borderType,
            ),
            if (_underlineData != null) const SizedBox(height: 2),
            if (_underlineData != null)
              GestureDetector(
                onTap: underlineTap,
                child: Text(
                  _underlineData.text,
                  style: _underlineData.style,
                ),
              ),
          ],
        ),
      );
    });
  }
}

class _SubTextFieldOutlined extends StatelessWidget {
  _SubTextFieldOutlined({
    this.text,
    this.error,
    this.onChanged,
    this.onTap,
    required this.controller,
    this.useWarningSvg = false,
    this.showObscureButton = false,
    this.suffixTitleWidget,
    required this.hintData,
    required this.box,
    required this.errorBox,
    this.contentPadding,
    this.widgetMargin,
    this.keyboardType,
    this.inputFormatters,
    this.isDense = false,
    this.minLines = 1,
    this.maxLines = 1,
    required InputBorderType borderType,
  })  : border = switch (borderType) {
          InputBorderType.none => InputBorder.none,
          InputBorderType.underline => UnderlineInputBorder(
              borderRadius: box.borderRadius, borderSide: box.side),
          InputBorderType.outline => OutlineInputBorder(
              borderRadius: box.borderRadius, borderSide: box.side),
        },
        errorBorder = switch (borderType) {
          InputBorderType.none => InputBorder.none,
          InputBorderType.underline => UnderlineInputBorder(
              borderRadius: box.borderRadius, borderSide: box.side),
          InputBorderType.outline => OutlineInputBorder(
              borderRadius: box.borderRadius, borderSide: box.side),
        };

  final InputBorder border;
  final InputBorder errorBorder;

  final TextData hintData;
  final TextStyle? text;
  final TextStyle? error;

  final CustomTextFieldController controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  final BoxData box;
  final BoxData errorBox;

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
    return TextField(
      key: key,
      onTap: onTap,
      readOnly: controller.readOnly,
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
        border: border,
        focusedBorder: border,
        disabledBorder: border,
        enabledBorder: border,
        errorBorder: errorBorder,
        filled: true,
        fillColor: box.fillColor,
        hintText: hintData.text,
        hintStyle: hintData.style,
        suffix: !showObscureButton && (controller.errorMessage?.isEmpty ?? true)
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
                                colorFilter: errorBox.side.color.filter,
                              )
                            : Icon(
                                Icons.error_outline_rounded,
                                color: errorBox.side.color,
                              ))
                        : Icon(
                            controller.obscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: (controller.errorMessage?.isEmpty ?? true)
                                ? style.suffixWidgetColor
                                : errorBox.side.color,
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
  }
}
