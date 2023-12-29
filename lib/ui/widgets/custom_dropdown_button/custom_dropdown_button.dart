part of '../../../ice_flutter_toolkit.dart';

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton({
    super.key,
    this.titleOffset = 12,
    this.title,
    this.titles = const [],
    this.text,
    this.error,
    required this.hint,
    required this.controller,
    this.onTapAfterChangeController,
    this.itemHeight,
    this.contentPadding,
    this.widgetMargin,
    BoxData? box,
    BoxData? errorBox,
  })  : _box = box ?? BoxData.r15All(),
        _errorBox = errorBox ?? BoxData.r15All();

  final CustomDropdownController controller;
  final Function(int)? onTapAfterChangeController;

  final double titleOffset;
  final TextData? title;
  final List<TextData> titles;
  final TextData? text;
  final TextData hint;
  final TextData? error;

  final BoxData _box;
  final BoxData _errorBox;

  final double? itemHeight;
  final EdgeInsets? contentPadding;
  final EdgeInsets? widgetMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widgetMargin ?? EdgeInsets.zero,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (title != null)
          Text(
            title!.text,
            textScaleFactor : 1.0,
            style: title!.style,
          ),
        if (titles.isNotEmpty)
          RichText(
            textScaleFactor : 1.0,
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
        if (title != null) SizedBox(height: titleOffset),
        Observer(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                hint: selected(hint.text,
                    style: hint.style, isError: controller.errorMessage != null),
                elevation: 0,
                dropdownColor: AppColors.transparent,
                isExpanded: true,
                value: controller.indexContent,
                itemHeight: itemHeight ?? kMinInteractiveDimension,
                // menuMaxHeight: (itemHeight ?? kMinInteractiveDimension) * 5,
                selectedItemBuilder: (ctx) => controller.variants
                    .map((e) =>
                        selected(e, isError: controller.errorMessage != null))
                    .toList(),
                items: [
                  for (int index = 0; index < controller.variants.length; index++)
                    selectableMenuItem(index, controller.variants[index],
                        index == controller.variants.length - 1)
                ],
                onChanged: (index) {
                  controller.errorMessage = null;
                  controller.turnNext(index: index);
                  if (onTapAfterChangeController != null) {
                    onTapAfterChangeController!(index);
                  }
                },
                icon: const SizedBox(),
                underline: Container(color: AppColors.transparent),
              ),
              if (controller.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 2),
                  child: Text(
                    controller.errorMessage!,
                    // textScaler: ,
                    textScaleFactor : 1.0,
                    style: error?.style ??
                        const TextStyle(

                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.errorText,
                        ),
                  ),
                ),
            ],
          );
        }),
      ]),
    );
  }

  Widget selected(String title, {TextStyle? style, bool isError = false}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: isError ? _errorBox.radius : _box.radius,
        border: _box.border,
      ),
      padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 13),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            // width: MediaQuery.of(context).size.width - 80,
            child: Text(
              title,
              textScaleFactor : 1.0,
              style: style ??
                  AppStyle.style.text,
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child:
                Icon(Icons.arrow_drop_down, color: AppColors.gray85, size: 24),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem selectableMenuItem(int index, String title, bool last,
      {TextStyle? style}) {
    return DropdownMenuItem(
      value: index,
      child: Material(
        elevation: 5,
        // boxShadow: const [
        //   BoxShadow(
        //     color: AppColors.shadow15,
        //     blurRadius: 7,
        //     spreadRadius: 0,
        //     offset: Offset(0, 2),
        //   ),
        // ],
        borderRadius: index == 0 || last
            ? BorderRadius.only(
                topLeft: Radius.circular(index == 0 ? 12 : 0),
                topRight: Radius.circular(index == 0 ? 12 : 0),
                bottomLeft: Radius.circular(last ? 12 : 0),
                bottomRight: Radius.circular(last ? 12 : 0),
              )
            : null,
        child: Container(
          height: itemHeight ?? kMinInteractiveDimension,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: index == 0 || last
                ? BorderRadius.only(
                    topLeft: Radius.circular(index == 0 ? 12 : 0),
                    topRight: Radius.circular(index == 0 ? 12 : 0),
                    bottomLeft: Radius.circular(last ? 12 : 0),
                    bottomRight: Radius.circular(last ? 12 : 0),
                  )
                : null,
            // boxShadow: [
            //   BoxShadow(
            //     color: AppColors.black.withOpacity(0.5),
            //     blurRadius: 7,
            //     spreadRadius: 2,
            //     offset: Offset(0, 0),
            //   ),
            // ],
          ),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            textScaleFactor : 1.0,
            style: style ?? AppStyle.style.text,
          ),
        ),
      ),
    );
  }
}
