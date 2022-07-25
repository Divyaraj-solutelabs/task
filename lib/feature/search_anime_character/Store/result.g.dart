// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Anime on _Anime, Store {
  late final _$AnsAtom = Atom(name: '_Anime.Ans', context: context);

  @override
  List<Character> get Ans {
    _$AnsAtom.reportRead();
    return super.Ans;
  }

  @override
  set Ans(List<Character> value) {
    _$AnsAtom.reportWrite(value, super.Ans, () {
      super.Ans = value;
    });
  }

  late final _$offlistAtom = Atom(name: '_Anime.offlist', context: context);

  @override
  List<bookmarked> get offlist {
    _$offlistAtom.reportRead();
    return super.offlist;
  }

  @override
  set offlist(List<bookmarked> value) {
    _$offlistAtom.reportWrite(value, super.offlist, () {
      super.offlist = value;
    });
  }

  late final _$getResultAsyncAction =
      AsyncAction('_Anime.getResult', context: context);

  @override
  Future getResult(String name) {
    return _$getResultAsyncAction.run(() => super.getResult(name));
  }

  late final _$_AnimeActionController =
      ActionController(name: '_Anime', context: context);

  @override
  dynamic getdata() {
    final _$actionInfo =
        _$_AnimeActionController.startAction(name: '_Anime.getdata');
    try {
      return super.getdata();
    } finally {
      _$_AnimeActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addChar(int id, String image, String name, String desc) {
    final _$actionInfo =
        _$_AnimeActionController.startAction(name: '_Anime.addChar');
    try {
      return super.addChar(id, image, name, desc);
    } finally {
      _$_AnimeActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(int index) {
    final _$actionInfo =
        _$_AnimeActionController.startAction(name: '_Anime.delete');
    try {
      return super.delete(index);
    } finally {
      _$_AnimeActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
Ans: ${Ans},
offlist: ${offlist}
    ''';
  }
}
