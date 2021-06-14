import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("이벤트 3 UI"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [this._eventWidth(context)],
        ),
      ),
    );
  }

  Left() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.network(
            "https://cdn.pixabay.com/photo/2019/04/10/23/51/dog-4118585_960_720.jpg",
            fit: BoxFit.fitHeight, // 세로비율 3차지하게하고, 높이에 맞게 확대
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.yellow,
            child: Align(
              //글씨 바닥에 붙게
              alignment: Alignment.bottomCenter,
              child: Text(
                "Application Title",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Right() {
    return Column(
      children: [
        Text("SubTitle"),
        Text(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n"
          "bbbbbbbbbbb\n"
          "ccccccccccccccc",
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Image.network(
                "https://cdn.pixabay.com/photo/2020/06/30/14/06/blossom-5356482_960_720.jpg",
              ),
              Image.network(
                "https://cdn.pixabay.com/photo/2020/04/24/23/34/magnolia-5088974_960_720.jpg",
              ),
              Image.network(
                "https://cdn.pixabay.com/photo/2016/02/17/19/08/lotus-1205631_960_720.jpg",
              ),
              Image.network(
                "https://cdn.pixabay.com/photo/2016/08/14/12/35/water-lily-1592771_960_720.jpg",
              ),
            ],
          ),
        ),
      ],
    );
  }

  _eventWidth(BuildContext context) {
    double padding = 10;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        color: Colors.black12,
        width: MediaQuery.of(context).size.width - padding * 2,
        height: MediaQuery.of(context).size.height / 2,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.lightGreen,
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  heightFactor: 0.9,
                  child: Left(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  heightFactor: 0.9,
                  child: Right(),
                ),
              ),
            ),
            // Left(),
            // Right(),
          ],
        ),
      ),
    );
  }
}
