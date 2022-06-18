import 'package:flutter/material.dart';

class gridview extends StatelessWidget {
  const gridview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 5,
      //   ),
      //   children: [
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
      //     Image.network('https://picsum.photos/250?image=1'),
         
      //   ],
        
      //   ),
      body:Column(
        children: [
           Center(
            child: Text("Grid View",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
           ),
                 Expanded(
                   child: GridView.count(crossAxisCount: 3,
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                       children: [
                               
                             Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                               Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                              Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                              Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                           Image.network('https://picsum.photos/250?image=1'),
                          
                          
                       ],
                       ),
                 ),
        ],
      )
      
    );
  }
}

DialKey() {
}