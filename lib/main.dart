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
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.network(
                "https://cdn.pixabay.com/photo/2019/04/10/23/51/dog-4118585_960_720.jpg",
                fit: BoxFit.cover, // 세로비율 3차지하게하고, 높이에 맞게 확대
                width: double.infinity,
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
                color: Colors.white,
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.yellow,
            child: Align(
              //글씨 바닥에 붙게
              alignment: Alignment.bottomLeft,
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
    List imageurl = [
      "https://cdn.pixabay.com/photo/2020/04/24/23/34/magnolia-5088974_960_720.jpg",
      "https://cdn.pixabay.com/photo/2020/06/30/14/06/blossom-5356482_960_720.jpg",
      "https://cdn.pixabay.com/photo/2016/02/17/19/08/lotus-1205631_960_720.jpg",
      "https://cdn.pixabay.com/photo/2016/08/14/12/35/water-lily-1592771_960_720.jpg",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Text(
            "SubTitle",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n"
                "bbbbbbbbbbb\n"
                "cccccccccccccccddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd",
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: imageurl.length,
            itemBuilder: (context, idx) {
              return imageContainer(imageurl[idx], idx);
            },
          ),
        ),
      ],
    );
  }

  Container imageContainer(imageurl, int idx) {
    return Container(
      width: 170, //overflow 안나게 줘야함
      margin: EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child:
                // Placeholder(),
                Image.network(
              imageurl,
              fit: BoxFit.cover,
              width: double.infinity, //BoxFit.cover 를 써도 생기는 공백을 없애준다
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Align(
                //Text don't take the whole Column width.
                alignment: Alignment.center,
                child: Text("Item $idx"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _eventWidth(BuildContext context) {
    double padding = 10;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        color: Colors.black12,
        width: MediaQuery.of(context).size.width - padding * 2,
        height: MediaQuery.of(context).size.height * 3 / 5,
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
