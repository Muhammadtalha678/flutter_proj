
import 'dart:convert';
// import 'dart:html';
// import 'dart:convert';
import 'package:dbconn/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: tabbar(),
    );
  }
}

class Crud extends StatefulWidget {
  const Crud({ Key? key }) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  // for create controller
 TextEditingController _nameController = TextEditingController();
//  for update Controller
 TextEditingController _UpdatController = TextEditingController();
 var ff;
 var success = "";
Future  name() async{
  print(_nameController.text);
  var ur = "https://mobcrudflutter.000webhostapp.com/api/create";
 Uri url = Uri.parse(ur);
 var response = await http.post(url,body: {
  'name' : _nameController.text,
 });
 var data = json.decode(response.body);
 _nameController.clear();
//  print(response.statusCode);
 ff = data;
 print(ff);
}
Future show()async{
  var ur = "https://mobcrudflutter.000webhostapp.com/api/show";
  Uri url = Uri.parse(ur);
  var response = await http.get(url);
  var data = json.decode(response.body);
  // Map<String, dynamic> map = data;
  // var units = (convert.json.decode(response.body) as Map<String,dynamic>)["units"]; 
  // print(data);
  
  return data;
}
update(index,name){
  var  id = index;
  var  nam = name;
  // print(id); 
  // print(nam); 
   showDialog(context: context, builder: (context){
    return AlertDialog(
      content: Column(
        children: [
          Center(child: Text("Update List",style: TextStyle(fontSize: 30),),),
          SizedBox(height: 10,),
          TextField(
            controller: _UpdatController,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: nam,
              // labelText: ,
              
            ),
          ),
          SizedBox(height: 10,),
          FlatButton(onPressed: (){_update(id);Navigator.of(context).pop();}, child: Text("Update"))
        ],
      ),
      
    );
    
  });
}
Future _update(id) async{
  print(id);
  var ur = "https://mobcrudflutter.000webhostapp.com/api/update/$id";
  Uri url = Uri.parse(ur);
  var response = await http.post(url,body: {
    
    'name' : _UpdatController.text
  });
  var data = json.decode(response.body);
  print(data);
}
Future delete(id)async{
  print(id);
  var ur = "https://mobcrudflutter.000webhostapp.com/api/delete/$id";
  Uri url = Uri.parse(ur);
  var response = await http.get(url);
  var data = json.decode(response.body);
  print(data);
  Navigator.of(context).pop();
}
showone(name)async{
showDialog(context: context, builder: (context){
  return AlertDialog(
    title: Center(child: Text("your List")),
    actions: [
      TextField(
          showCursor: false,//add this line
          readOnly: true,

        decoration: InputDecoration(
          hintText:name,
          // border: ;
        ),
      ),
      FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Cancel"))
    ],
    
  );
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Enter your title",
                        
                      ),
                      
                    ),
                    
                  ),
                  SizedBox(height: 10,),
              RaisedButton(onPressed: (){name();},child: Text("Submit"),)
                ],
              ),
            ),
          ),
          Expanded(
            child:FutureBuilder (
              future: show(),
              builder: (context,AsyncSnapshot snapshot){
                if (snapshot.hasError) {print(snapshot.error);}
                return snapshot.hasData? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,int index){
                    List list = snapshot.data;
                    return ListTile(
                      
                      leading: CircleAvatar(),
                      title: Text(list[index]["name"]),
                      
                      // subtitle: Text(list[index]["created_at"]),
                      trailing: Wrap(
                        spacing: 10,
                        children: [
                          IconButton(onPressed: (){showone(list[index]['name']);}, icon: Icon(Icons.read_more)),
                          IconButton(onPressed: (){update(list[index]['id'],list[index]['name']);}, icon: Icon(Icons.update)),
                          IconButton(onPressed: (){showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Are You Sure"),
                              actions: [
                                FlatButton(onPressed: (){delete(list[index]['id']);}, child: Text("Yes"),color: Colors.amber,),
                                FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No"),color: Colors.amber,),
                              ],
                            );
                          });}, icon: Icon(Icons.delete)),
                          // Visibility(visible: false,child: Text(list[index]["id"]))
                        ],
                      ),
                    );
                }):Center(child: CircularProgressIndicator(),);  
              }),
          ),
         
     
        ],
      )
    );
  }
}