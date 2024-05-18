part of '../../../ice_flutter_toolkit.dart';

class CustomSearchTextFieldController
    extends CustomSearchTextFieldControllerBase
    with _$CustomSearchTextFieldController {
  CustomSearchTextFieldController(super.type, super.variants,
      [super.duration = const Duration(milliseconds: 500)]);
}

abstract class CustomSearchTextFieldControllerBase extends AbstractTextFieldController
    with Store {
  CustomSearchTextFieldControllerBase(
    this.searchRequest,
    this.variants,
    this.duration,
  );

  final Future<SearchResponseWrapper> Function(String) searchRequest;
  final Duration duration;
  @override
  @observable
  String? errorMessage;

  final _textEditingController = TextEditingController();

  @override
  TextEditingController get textEditingController => _textEditingController;

  @override
  @computed
  bool get validated => errorMessage?.isEmpty ?? true;

  @override
  bool get obscure => false;

  @override
  set obscure(bool val) {}

  @override
  @computed
  bool get isEmpty => selectedVariant == null;

  @override
  @action
  void clear() {
    timer?.cancel();
    variants.clear();
    selectedVariant = null;
    textEditingController.clear();
  }

  @observable
  Timer? timer;
  String? lastSearch;

  @action
  @override
  void updateText(String str) {
    lastSearch = str;
    errorMessage = null;
    selectedVariant = null;

    timer?.cancel();
    if (str.isEmpty) {
      variants.clear();

      return;
    }

    timer = Timer(duration, () async {
      var result = await searchRequest(str);
      variants.clear();
      if (result.success) {
        variants.addAll(result.data);
      }
    });
  }

  @action
  @override
  bool validateWithIndex(String? text, int validator,
      {int? minLength, int? maxLength, String? startWith}) {
    return super.validateWithIndex(
      text,
      validator,
      minLength: minLength,
      maxLength: maxLength,
      startWith: startWith,
    );
  }

  @observable
  SearchVariantResponse? selectedVariant;
  final ObservableList<SearchVariantResponse> variants;

  @action
  void pickVariant(int index) {
    if (variants.length <= index) return;
    selectedVariant = variants[index];
    textEditingController.text = selectedVariant!.text ?? "";
    variants.clear();
  }
}

abstract class SearchResponseWrapper {
  SearchResponseWrapper(this.success, [this.data = const []]);
  final bool success;
  final List<SearchVariantResponse> data;
}
abstract class SearchVariantResponse<T> {
  SearchVariantResponse([this.text, this.data]);
  final String? text;
  final T? data;
}