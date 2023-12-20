// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_dropdown_button_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomDropdownController on CustomDropdownControllerBase, Store {
  Computed<bool>? _$validatedComputed;

  @override
  bool get validated =>
      (_$validatedComputed ??= Computed<bool>(() => super.validated,
              name: 'CustomDropdownControllerBase.validated'))
          .value;
  Computed<String>? _$currentVariantComputed;

  @override
  String get currentVariant =>
      (_$currentVariantComputed ??= Computed<String>(() => super.currentVariant,
              name: 'CustomDropdownControllerBase.currentVariant'))
          .value;

  late final _$indexContentAtom =
      Atom(name: 'CustomDropdownControllerBase.indexContent', context: context);

  @override
  int? get indexContent {
    _$indexContentAtom.reportRead();
    return super.indexContent;
  }

  @override
  set indexContent(int? value) {
    _$indexContentAtom.reportWrite(value, super.indexContent, () {
      super.indexContent = value;
    });
  }

  late final _$variantsAtom =
      Atom(name: 'CustomDropdownControllerBase.variants', context: context);

  @override
  ObservableList<String> get variants {
    _$variantsAtom.reportRead();
    return super.variants;
  }

  @override
  set variants(ObservableList<String> value) {
    _$variantsAtom.reportWrite(value, super.variants, () {
      super.variants = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'CustomDropdownControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$CustomDropdownControllerBaseActionController =
      ActionController(name: 'CustomDropdownControllerBase', context: context);

  @override
  dynamic setNewVariants(List<String> variants) {
    final _$actionInfo = _$CustomDropdownControllerBaseActionController
        .startAction(name: 'CustomDropdownControllerBase.setNewVariants');
    try {
      return super.setNewVariants(variants);
    } finally {
      _$CustomDropdownControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void turnNext({int? index}) {
    final _$actionInfo = _$CustomDropdownControllerBaseActionController
        .startAction(name: 'CustomDropdownControllerBase.turnNext');
    try {
      return super.turnNext(index: index);
    } finally {
      _$CustomDropdownControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validate() {
    final _$actionInfo = _$CustomDropdownControllerBaseActionController
        .startAction(name: 'CustomDropdownControllerBase.validate');
    try {
      return super.validate();
    } finally {
      _$CustomDropdownControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexContent: ${indexContent},
variants: ${variants},
errorMessage: ${errorMessage},
validated: ${validated},
currentVariant: ${currentVariant}
    ''';
  }
}
