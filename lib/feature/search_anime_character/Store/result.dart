import 'package:anime/feature/search_anime_character/bookmarked/hivedb.dart';
import 'package:anime/feature/search_anime_character/model/model.dart';
import 'package:anime/feature/search_anime_character/network_service/graph_ql.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'result.g.dart';

class Anime extends _Anime with _$Anime{
  Anime._();
  factory Anime.getInstance() => _instance;
  static final Anime _instance = Anime._();

}

abstract class _Anime with Store{

  @observable
  List<Character> Ans=<Character> [];


  @observable
  List<bookmarked> offlist=<bookmarked>[];

  @action
  getResult(String name) async{
    Ans = await Result(name);
  }

  @action
  getdata(){
    Box box = Hive.box('bookmarked');
    for(bookmarked a in box.values){
    offlist.add(a);
    }
  }


  @action
  addChar(int id, String image, String name, String desc){
    Box box=Hive.box('bookmarked');
    box.add(bookmarked(id, image, name, desc));

  }

  @action
  delete(int index){
    Box box = Hive.box('bookmarked');
    box.deleteAt(index).then((value) => print("Item deleted"));
  }

}