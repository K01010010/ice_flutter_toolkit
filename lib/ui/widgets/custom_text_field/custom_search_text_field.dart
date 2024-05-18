part of '../../../ice_flutter_toolkit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.controller,
    BoxData? selectedBox,
    BoxData? errorBox,
    this.dividerColor,
    this.onPickVariant,
    this.showVariantsInsideWidget = true,
    required this.customTextField,
  });

  final CustomSearchTextFieldController controller;
  final Future<bool?> Function(int, SearchVariantResponse)? onPickVariant;
  final Color? dividerColor;
  final bool showVariantsInsideWidget;
  final CustomTextField customTextField;

  CustomFieldStyle get style => AppStyle.style.fieldStyle;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          customTextField,
          if (controller.variants.isNotEmpty && showVariantsInsideWidget)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text("Выберите вариант для сохранения",
                  style: customTextField._hintData.style.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )),
            ), //SizedBox(height: variantsOffset),
          if (controller.variants.isNotEmpty && showVariantsInsideWidget)
            Container(
              padding: customTextField.contentPadding ?? style.contentPadding,
              margin: customTextField.widgetMargin ?? style.widgetMargin,
              decoration: BoxDecoration(
                color: customTextField._box.fillColor ?? style.box.fillColor,
                borderRadius: customTextField._box.borderRadius,
                border: customTextField._box.border,
              ),
              child: Observer(builder: (context) {
                var scrollView = SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      controller.variants.length,
                      (index) => GestureDetector(
                        onTap: () async {
                          if (onPickVariant == null) {
                            controller.pickVariant(index);
                          } else {
                            var keepCallPicker = await onPickVariant!(
                                index, controller.variants[index]);
                            if (keepCallPicker ?? true) {
                              controller.pickVariant(index);
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: GrayColors.white,
                                border: dividerColor == null
                                    ? null
                                    : Border(
                                        top: index == 0
                                            ? BorderSide.none
                                            : BorderSide(
                                                color: dividerColor!,
                                                width: 0.5),
                                        bottom: index ==
                                                controller.variants.length - 1
                                            ? BorderSide.none
                                            : BorderSide(
                                                color: dividerColor!,
                                                width: 0.5),
                                      )),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 8,
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.variants[index].text ?? "",
                                style: customTextField.text ?? style.text,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );

                return controller.variants.length == 1
                    ? scrollView
                    : SizedBox(
                        height: 34 *
                            controller.variants.length.clamp(1, 5).toDouble(),
                        width: double.maxFinite,
                        // child: Scrollbar(
                        //   thumbVisibility: true,
                        //   thickness: 3,
                        child: scrollView,
                        // ),
                      );
              }),
            )
        ],
      );
    });
  }
}
