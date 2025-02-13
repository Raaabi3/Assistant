import 'package:assistance_app/Views/YTDownlaoderScreens/linkscreen.dart';
import 'package:assistance_app/Widgets/Homewidgets/CustomButtons.dart';
import 'package:flutter/material.dart';

import '../Model/GridItem .dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

final List<GridItem> items = [
  GridItem(text: 'Find Job', color: Colors.grey),
  GridItem(text: 'YT mp3', color: Colors.red),
  GridItem(text: 'Item 3', color: Colors.grey),
  GridItem(text: 'Item 4', color: Colors.grey),
  GridItem(text: 'Item 5', color: Colors.grey),
  GridItem(text: 'Item 6', color: Colors.grey),
];

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          width: 500,
          child: Column(
            children: [
              Text("Home Screen"),
              CustomButtons(onPressed: (){},),
            ],
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: items[index].color,
                  ),
                  child: Center(
                    child: Text(
                      items[index].text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                print(items[index].text);
                if(items[index].text == "YT mp3"){
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Linkscreen(),
                          ),
                        );
                }
              },
            );
          },
        ));
  }
}
