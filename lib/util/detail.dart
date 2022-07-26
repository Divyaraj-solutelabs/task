import 'package:flutter/material.dart';

class Detail extends StatelessWidget{
  late final String name;
  late final String description;
  late String image;

  Detail({required this.name , required this.description, required this.image});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: color,
        title: Text(" "),
      ),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(140),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(image),
            ),
          ),
          SizedBox(
            height:10
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
              alignment: Alignment.centerLeft,
              child:Text("Name:  $name",
              style:Theme.of(context).textTheme.bodyText1 ,
              )
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 1,
              child:Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
                child:Text(description,
            style: Theme.of(context).textTheme.bodyText2,
            )),
          ) )

        ],
      ),
    );
  }

}