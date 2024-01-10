part of '../../../ice_flutter_toolkit.dart';

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton({
    super.key,
    required this.controller,
    this.onTapAfterChangeController,
    this.onTap,
    this.text,
    this.titleOffset,
    List<TextData>? titles,
    String? title,
    TextStyle? titleStyle,
    required String hintText,
    TextStyle? hintStyle,
    BoxData? box,
    BoxData? errorBox,
    this.error,
    this.errorPadding,
    this.contentPadding,
    this.widgetMargin,
    this.itemHeight,
    this.dropdownColor,
  })  : _box = box ?? AppStyle.style.fieldStyle.box,
        _errorBox = errorBox ?? AppStyle.style.fieldStyle.errorBox,
        _titles = titles ??
            [
              if (title != null)
                TextData(title, titleStyle ?? AppStyle.style.fieldStyle.title)
            ],
        _hintData =
            TextData(hintText, hintStyle ?? AppStyle.style.fieldStyle.hint);

  final CustomDropdownController controller;

  final Function(int)? onTapAfterChangeController;
  final void Function()? onTap;

  final List<TextData> _titles;
  final double? titleOffset;

  final TextData _hintData;
  final TextStyle? text;
  final TextStyle? error;

  final BoxData _box; // ?? style.box
  final BoxData _errorBox; // ?? style.errorBox

  final EdgeInsets? errorPadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? widgetMargin;

  final double? itemHeight;
  final Color? dropdownColor;

  CustomFieldStyle get style => AppStyle.style.fieldStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widgetMargin ?? style.widgetMargin,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (_titles.length == 1)
          Text(
            _titles.first.text,
            style: _titles.first.style,
          ),
        if (_titles.isNotEmpty)
          RichText(
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                hint: selected(
                  _hintData,
                  isError: controller.errorMessage != null,
                ),
                elevation: 0,
                dropdownColor: dropdownColor ?? GrayColors.transparent,
                isExpanded: true,
                value: controller.indexContent,
                itemHeight: itemHeight ?? kMinInteractiveDimension,
                // menuMaxHeight: (itemHeight ?? kMinInteractiveDimension) * 5,
                selectedItemBuilder: (ctx) => controller.variants
                    .map((variant) => selected(
                        TextData(
                          variant,
                          text ?? style.text,
                        ),
                        isError: controller.errorMessage != null))
                    .toList(),
                items: [
                  for (int index = 0;
                      index < controller.variants.length;
                      index++)
                    selectableMenuItem(
                      index,
                      TextData(
                        controller.variants[index],
                        text ?? style.text,
                      ),
                      index == controller.variants.length - 1,
                    )
                ],
                onChanged: (index) {
                  controller.errorMessage = null;
                  controller.turnNext(index: index);
                  if (onTapAfterChangeController != null) {
                    onTapAfterChangeController!(index);
                  }
                },
                icon: const SizedBox(),
                underline: Container(color: GrayColors.transparent),
              ),
              if (controller.errorMessage != null)
                Padding(
                  padding:
                      errorPadding ?? const EdgeInsets.only(left: 8.0, top: 2),
                  child: Text(
                    controller.errorMessage!,
                    style: error ?? style.error,
                  ),
                ),
            ],
          );
        }),
      ]),
    );
  }

  Widget selected(TextData textData, {bool isError = false}) {
    return Container(
      decoration: BoxDecoration(
        color: (isError ? _errorBox : _box).fillColor ?? GrayColors.white,
        borderRadius: (isError ? _errorBox : _box).borderRadius,
        border: (isError ? _errorBox : _box).border,
      ),
      padding: contentPadding ?? style.contentPadding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              textData.text,
              style: textData.style,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.arrow_drop_down,
              color: style.suffixWidgetColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem selectableMenuItem(
    int index,
    TextData textData,
    bool last,
  ) {
    var first = index == 0;

    return DropdownMenuItem(
      value: index,
      child: Material(
        elevation: 5,
        // boxShadow: const [
        //   BoxShadow(
        //     color: AppColors.black.withOpacity(0.5),
        //     color: AppColors.shadow15,
        //     blurRadius: 7,
        //     spreadRadius: 0,
        //     offset: Offset(0, 2),
        //   ),
        // ],
        borderRadius: first || last
            ? BorderRadius.only(
                topLeft: first ? _box.radius : Radius.zero,
                topRight: first ? _box.radius : Radius.zero,
                bottomLeft: last ? _box.radius : Radius.zero,
                bottomRight: last ? _box.radius : Radius.zero,
              )
            : null,
        child: Container(
          height: itemHeight ?? kMinInteractiveDimension,
          width: double.maxFinite,
          padding: contentPadding ?? style.contentPadding,
          decoration: BoxDecoration(
            color: _box.fillColor,
            borderRadius: first || last
                ? BorderRadius.only(
                    topLeft: first ? _box.radius : Radius.zero,
                    topRight: first ? _box.radius : Radius.zero,
                    bottomLeft: last ? _box.radius : Radius.zero,
                    bottomRight: last ? _box.radius : Radius.zero,
                  )
                : null,
          ),
          child: Text(
            textData.text,
            overflow: TextOverflow.ellipsis,
            style: textData.style,
          ),
        ),
      ),
    );
  }
}
