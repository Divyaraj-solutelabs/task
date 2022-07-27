import 'package:anime/feature/search_anime_character/Store/result.dart';
import 'package:anime/util/detail.dart';
import 'package:anime/feature/BookMarked/presentation/bookmarked.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final ans=Anime.getInstance();

class HomeScreen extends StatefulWidget {
  static String routeName='/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://wallpapercave.com/wp/wp5635132.png"), fit: BoxFit.cover)
        ),
        child:Scaffold(
        body: Material(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.1,
              right: size.width * 0.1,
              top: 30,
            ),
            child: Card(
              elevation: 10,

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  onFieldSubmitted: (query) async {
                    _controller.clear();
                    ans.getResult(query);

                  },
                  controller: _controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Anime Characters'),
                ),
              ),
            ),
          ),
          Expanded(
            child:  Observer(
              builder: (context) {
                return Stack(
                  children: [
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 30,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),

                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  Detail(
                                    name:ans.Ans[index].fullName,
                                    image: ans.Ans[index].image,
                                    description: ans.Ans[index].description,
                                  )
                              )
                              );
                            },
                            child:Card(
                          elevation: 15,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(ans.Ans[index].image, fit: BoxFit.cover),
                              Column(
                                children: [
                                  Expanded(child: SizedBox()),
                                  Container(
                                    width: size.width,
                                    color:Colors.transparent,
                                    child:  Center(
                                        child:Row (
                                            children:[
                                          Expanded(child: ListTile(
                                            title:Text(
                                              ans.Ans[index].fullName,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize:10
                                              ),
                                            ),
                                           trailing: IconButton(
                                             onPressed: (){
                                               ans.addChar(ans.Ans[index].id, ans.Ans[index].image, ans.Ans[index].fullName, ans.Ans[index].description);
                                             },
                                             icon: Icon(Icons.bookmark_add,
                                             color: Colors.white,
                                             ),
                                           ),
                                          )
                                          ),
                                            ]
                                        ),
                                      ),

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                      },
                      itemCount: ans.Ans.length,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ans.offlist.clear();
          Navigator.pushNamed(context, Bookmarked.routeName1);
        },
        child: Icon(Icons.bookmark),
      ),
    ));
  }
}