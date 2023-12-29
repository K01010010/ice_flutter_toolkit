part of '../../../ice_flutter_toolkit.dart';

class TextFieldStack extends StatelessWidget {
  const TextFieldStack({
    Key? key,
    this.stackSuffixWidget,
    required this.textField,
  }) : super(key: key);

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
    Key? key,
    this.titleOffset = 12,
    this.title,
    this.titles = const [],
    this.text,
    this.error,
    required this.hint,
    this.onChanged,
    this.onTap,
    required this.controller,
    this.showObscureButton = false,
    this.suffixTitleWidget,
    this.stackSuffixWidget,
    this.underlineText,
    this.underlineTap,
    BoxData? box,
    BoxData? errorBox,
    this.contentPadding,
    this.widgetMargin,
    this.keyboardType,
    this.inputFormatters,
    this.isDense = false,
    this.minLines = 1,
    this.maxLines = 1,
  })  : _box = box ?? BoxData.r15All(),
        _errorBox =
            errorBox ?? BoxData.r15All(borderColor: AppColors.errorText),
        super(key: key);

  final CustomTextFieldController controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  final double titleOffset;
  final TextData? title;
  final List<TextData> titles;
  final TextData? text;
  final TextData hint;
  final TextData? error;

  final BoxData _box;
  final BoxData _errorBox;

  final bool showObscureButton;
  final Widget? suffixTitleWidget;
  final Widget? stackSuffixWidget;
  final String? underlineText;
  final void Function()? underlineTap;
  final EdgeInsets? contentPadding;
  final EdgeInsets? widgetMargin;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isDense;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: widgetMargin ?? EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Text(
                title!.text,
                textScaleFactor : 1.0,
                style: title!.style,
              ),
            if (title != null) SizedBox(height: titleOffset),
            if (titles.isNotEmpty)
              RichText(textScaleFactor : 1.0,
                text: TextSpan(
                  children: titles
                      .map(
                        (titleElem) => TextSpan(
                          text: titleElem.text,
                          style: titleElem.style,
                        ),
                      )
                      .toList(),
                ),
              ),
            if (titles.isNotEmpty) SizedBox(height: titleOffset),
            TextField(
              key: key,
              onTap: onTap,
              onChanged: (text) {
                controller.updateText(text);
                if (onChanged != null) onChanged!(text);
              },
              controller: controller.textEditingController,
              obscureText: controller.obscure,
              style: text?.style ?? AppStyle.style.text,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 21),
                errorText: controller.errorMessage,
                errorStyle: error?.style ?? AppStyle.style.errorText,
                border: OutlineInputBorder(
                    borderRadius: _box.radius, borderSide: _box.side),
                focusedBorder: OutlineInputBorder(
                    borderRadius: _box.radius, borderSide: _box.side),
                disabledBorder: OutlineInputBorder(
                    borderRadius: _box.radius, borderSide: _box.side),
                enabledBorder: OutlineInputBorder(
                    borderRadius: _box.radius, borderSide: _box.side),
                errorBorder: OutlineInputBorder(
                    borderRadius: _errorBox.radius, borderSide: _errorBox.side),
                filled: true,
                fillColor: _box.fillColor ?? AppColors.white,
                hintText: hint.text,

                hintStyle: hint.style,
                suffix: !showObscureButton &&
                        (controller.errorMessage?.isEmpty ?? true)
                    ? suffixTitleWidget
                    : SizedBox(
                        child: GestureDetector(
                          onTap: controller.switchObscure,
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: !showObscureButton
                                ? SvgPicture.asset(
                                    'assets/svg/warning.svg',
                                    color: _errorBox.side.color,
                                  )
                                : Icon(
                                    controller.obscure
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: (controller.errorMessage?.isEmpty ??
                                            true)
                                        ? AppColors.gray85
                                        : _errorBox.side.color,
                                  ),
                          ),
                        ),
                      ),
                isDense: isDense,
              ),
              inputFormatters: inputFormatters,
              minLines: minLines,
              maxLines: maxLines,
            ),
          ],
        ),
      );
    });
  }
}
