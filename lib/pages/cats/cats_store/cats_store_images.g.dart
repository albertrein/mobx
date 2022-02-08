// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_store_images.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatsStoreImages on _CatsStoreImages, Store {
  final _$urlImageAtom = Atom(name: '_CatsStoreImages.urlImage');

  @override
  String get urlImage {
    _$urlImageAtom.reportRead();
    return super.urlImage;
  }

  @override
  set urlImage(String value) {
    _$urlImageAtom.reportWrite(value, super.urlImage, () {
      super.urlImage = value;
    });
  }

  final _$getUrlImageAsyncAction = AsyncAction('_CatsStoreImages.getUrlImage');

  @override
  Future<void> getUrlImage() {
    return _$getUrlImageAsyncAction.run(() => super.getUrlImage());
  }

  @override
  String toString() {
    return '''
urlImage: ${urlImage}
    ''';
  }
}
