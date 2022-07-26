import 'package:anime/feature/search_anime_character/Store/result.dart';
import 'package:anime/util/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final ans=Anime.getInstance();

class Bookmarked extends StatefulWidget {
  static String routeName1='/bookmarked_screen';
  @override
  _BookmarkedState createState() => _BookmarkedState();
}


class _BookmarkedState extends State<Bookmarked>{

  @override
  void initState() {
    super.initState();
    ans.getdata();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("BookedMarked Characters"),
      ),
      body: Column(
        children: [
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
                        return Card(
                          elevation: 15,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(ans.offlist[index].image, fit: BoxFit.cover),
                              Column(
                                children: [
                                  Expanded(child: SizedBox()),
                                  GestureDetector(

                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(
                                          name:ans.offlist[index].fullName, image: ans.Ans[index].image,
                                          description: ans.offlist[index].description,

                                        )));
                                      },
                                      child:Container(
                                        width: size.width,
                                        color:Colors.deepPurpleAccent,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Center(
                                            child: Row (
                                                children:[
                                                  Expanded(child: ListTile(
                                                    title:Text(
                                                      ans.offlist[index].fullName,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                    trailing: IconButton(
                                                      onPressed: (){
                                                       ans.delete(index);
                                                       ans.offlist.clear();
                                                       ans.getdata();
                                                        },
                                                      icon: Icon(Icons.delete),
                                                    ),
                                                  )
                                                  ),
                                                ]
                                            ),
                                          ),
                                        ),
                                      ),
                                    onLongPress: (){
                                        ans.delete(index);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: ans.offlist.length,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}