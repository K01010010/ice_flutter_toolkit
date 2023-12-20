import 'package:mobx/mobx.dart';

part 'custom_dropdown_button_controller.g.dart';

class CustomDropdownController extends CustomDropdownControllerBase
    with _$CustomDropdownController {
  CustomDropdownController(List<String> variants, {int? initialIndex})
      : super(ObservableList()..addAll(variants), initialIndex: initialIndex);
}

abstract class CustomDropdownControllerBase with Store {
  @observable
  int? indexContent;
  @observable
  ObservableList<String> variants;
  @observable
  String? errorMessage;

  CustomDropdownControllerBase(this.variants, {int? initialIndex}) {
    if(initialIndex!=null) indexContent = initialIndex;
  }


  @computed
  bool get validated => errorMessage?.isEmpty ?? true;
  @computed
  String get currentVariant {
    if(indexContent == null) return "none";
    if(variants.length <= indexContent!) indexContent = variants.length - 1;
    if(variants.length <= indexContent!) return "none";
    return variants[indexContent!];
  }
  @action
  setNewVariants(List<String> variants) {
    this.variants.clear();
    this.variants.addAll(variants);
  }

  @action
  void turnNext({int? index}) {
    indexContent ??= -1;
    if (index != null) {
      indexContent = index;
    } else {
      indexContent = indexContent! + 1;
    }
    if (indexContent! >= variants.length) indexContent = 0;
  }
  @action
  bool validate() {
    errorMessage = (indexContent == null ? "Нужно выбрать" : null);
    return validated;
  }
}
