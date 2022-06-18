import 'package:dbconn/calculator.dart';
import 'package:dbconn/gridview.dart';
import 'package:dbconn/main.dart';
import 'package:flutter/material.dart';
  
class tabbar extends StatelessWidget {
  const tabbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title="";
    listtile(title){
      return ListTile(
        title: Text(title),
      );
    };
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My AppBar"),
          actions: [Icon(Icons.dashboard)],
          bottom:  TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.amber,
            indicatorColor: Colors.black,
            // indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2,
            // indicator: BoxDecoration(
            //   borderRadius: BorderRadius.circular(50),
            //   color: Colors.amber
            // ),
            tabs: [
            Tab(text: "ToDo App",),
            Tab(text: "Calculator"),
            Tab(text: "Grid View"),
          ],),
        ),
        body: TabBarView(children: [
         Crud(),
         MyCalculator(),
          
           gridview(),
         
          
          
        ]),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(child: Center(
                child: Text("Drawer",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                )),
                ListView(
                  shrinkWrap: true,
                  children: [
                    listtile("List 1"),
                    listtile("List 2"),
                    listtile("List 3"),
                    listtile("List 4"),
                    listtile("List 5"),
                    listtile("List 6"),
                    listtile("List 7"),
                    listtile("List 8"),
                  ],
                )
            ],
          ),
          ),
      ),
    );
    
  }
}