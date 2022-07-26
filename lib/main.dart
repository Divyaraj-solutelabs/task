import 'package:anime/feature/BookMarked/presentation/bookmarked.dart';
import 'package:anime/feature/search_anime_character/presentation/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'feature/BookMarked/database/hivedb.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(bookmarkedAdapter());
   await Hive.openBox('bookmarked');
   final appDocumentDir = await PathProvider.getApplicationDocumentsDirectory();

   Hive
      ..init(appDocumentDir.path);

  runApp(GraphQLApp());

}

class GraphQLApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.deepOrange,
        textTheme: const TextTheme(
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24),
          bodyText2: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize:10),
          bodyText1: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 18),
          subtitle2: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 5),
        ),
      ),
      home: HomeScreen(),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        Bookmarked.routeName1:(context) => Bookmarked(),
      },
    );
  }
}

