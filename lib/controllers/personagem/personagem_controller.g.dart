// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PersonagemController on _PersonagemControllerBase, Store {
  final _$itemsPerPageAtom =
      Atom(name: '_PersonagemControllerBase.itemsPerPage');

  @override
  int get itemsPerPage {
    _$itemsPerPageAtom.reportRead();
    return super.itemsPerPage;
  }

  @override
  set itemsPerPage(int value) {
    _$itemsPerPageAtom.reportWrite(value, super.itemsPerPage, () {
      super.itemsPerPage = value;
    });
  }

  final _$pageAtom = Atom(name: '_PersonagemControllerBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$lastTotalReturnedItemsAtom =
      Atom(name: '_PersonagemControllerBase.lastTotalReturnedItems');

  @override
  int get lastTotalReturnedItems {
    _$lastTotalReturnedItemsAtom.reportRead();
    return super.lastTotalReturnedItems;
  }

  @override
  set lastTotalReturnedItems(int value) {
    _$lastTotalReturnedItemsAtom
        .reportWrite(value, super.lastTotalReturnedItems, () {
      super.lastTotalReturnedItems = value;
    });
  }

  final _$firstCallAtom = Atom(name: '_PersonagemControllerBase.firstCall');

  @override
  bool get firstCall {
    _$firstCallAtom.reportRead();
    return super.firstCall;
  }

  @override
  set firstCall(bool value) {
    _$firstCallAtom.reportWrite(value, super.firstCall, () {
      super.firstCall = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PersonagemControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isErrorAtom = Atom(name: '_PersonagemControllerBase.isError');

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  final _$_PersonagemControllerBaseActionController =
      ActionController(name: '_PersonagemControllerBase');

  @override
  dynamic getPersonagens() {
    final _$actionInfo = _$_PersonagemControllerBaseActionController
        .startAction(name: '_PersonagemControllerBase.getPersonagens');
    try {
      return super.getPersonagens();
    } finally {
      _$_PersonagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemsPerPage: ${itemsPerPage},
page: ${page},
lastTotalReturnedItems: ${lastTotalReturnedItems},
firstCall: ${firstCall},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
