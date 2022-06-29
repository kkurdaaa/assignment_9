import 'package:flutter/material.dart';
import 'package:assignment_9/mock/mock.dart';
import 'package:assignment_9/src/bio.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "R6S Operators",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.grey),
          ),
        ),
        body: Center(
          child: SafeArea(
            child: Container(
              child: ListView.builder(
                  itemCount: mockData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Card(
                        elevation: 15,
                        shadowColor: Colors.grey,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Ink.image(
                              image: NetworkImage(
                                  mockData[index]["image"].toString()),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Bio(
                                                image: mockData[index]["image"]
                                                    .toString(),
                                                name: mockData[index]["name"]
                                                    .toString(),
                                                bio: mockData[index]["bio"]
                                                    .toString(),
                                              )));
                                },
                              ),
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(15),
                                        topRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 9,
                                      )
                                    ]),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Bio(
                                                  image: mockData[index]
                                                          ["image"]
                                                      .toString(),
                                                  name: mockData[index]["name"]
                                                      .toString(),
                                                  bio: mockData[index]["bio"]
                                                      .toString(),
                                                )));
                                  },
                                  child: Center(
                                    child: Text(
                                      mockData[index]["name"].toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
