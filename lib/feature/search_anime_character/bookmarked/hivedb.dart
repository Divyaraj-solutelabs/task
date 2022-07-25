import 'package:anime/feature/search_anime_character/model/model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'hivedb.g.dart';

@HiveType(typeId: 0)
class bookmarked{

    // @HiveField(0)
    // late Character char;
    @HiveField(0)
    int id;

    @HiveField(1)
    String image;

    @HiveField(2)
    String fullName;


    @HiveField(3)
    String description;


    bookmarked(this.id,  this.image, this.fullName, this.description);

}