import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://github.com/nabildroid.png"),
                      radius: 16,
                    ),
                    Expanded(
                      child: FractionallySizedBox(
                        widthFactor: .8,
                        child: SizedBox(
                          height: 30,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.black12.withOpacity(.05),
                              hintText: "Search...",
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Chip(
                      label: Text("35 GB"),
                      labelStyle: TextStyle(fontSize: 12),
                      backgroundColor: Colors.black38,
                      padding: const EdgeInsets.all(2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "RECENT",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 90,
                child: ListView.builder(
                  itemBuilder: (ctx, i) => Container(
                      child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "/home/../test",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "File Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black12,
                                primary: Colors.black,
                              ),
                              onPressed: () {},
                              child: Text(
                                "add",
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  itemCount: 40,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 12),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "SYNCED FILES",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView.builder(
                  itemBuilder: (ctx, i) => i == 0
                      ? SizedBox(
                          width: 120,
                          child: Center(
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                              label: Text("add"),
                            ),
                          ))
                      : Container(
                          child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Screenshot",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Text(
                                      "2h",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.pause),
                                      iconSize: 16,
                                      splashRadius: 16,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  itemCount: 40,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 12),
                ),
              ),
            ],
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: .5,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 3,
                    color: Colors.black87,
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 50),
                      itemCount: 6,
                      itemBuilder: (ctx, index) => ListTile(
                        dense: true,
                        leading: Icon(Icons.folder),
                        title: Text(
                          "Hello world!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 2,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person,
                              size: 12,
                              color: Colors.black45,
                            ),
                            Text(
                              "last edit: 22 mai 2020",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 12),
        width: MediaQuery.of(context).size.width - 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home),
            Icon(Icons.home),
            Icon(Icons.home),
            Icon(Icons.home),
          ],
        ),
        decoration: BoxDecoration(
          color: Color(0xFFC4C4C4),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
