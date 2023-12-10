import 'package:flutter/material.dart';
import 'package:testproject/tools/datewaterius.dart';
import 'package:testproject/tools/saveurltext.dart';

class Tab1 extends StatefulWidget {
  String title;

  Tab1({required this.title});

  @override
  State<Tab1> createState() => _Tab1State(this.title);
}

class _Tab1State extends State<Tab1> {
  String urltext = "";
  String title;
  String Req1 = "1";
  String Req2 = "2";

  List<dynamic> list = [];

  _Tab1State(this.title);

  @override
  initState() {
    super.initState();
    title = this.title;
    saveurltext().get().then((value) => {
          if (value != '') {urltext = value}
        });

    // List<dynamic> list1 = datewaterius().getlistdata(urltext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GestureDetector(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(list.length, (index) {
            return SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Value(
                      title: list[index].value.toString(),
                      subtitle: list[index].serial.toString(),
                      color: list[index].type.toString() == "Холодная вода"
                          ? Colors.blue.shade900
                          : Colors.red.shade900),
                  // Value(text: list[index].value.toString(),color: Colors.red.shade900),
                  // Text(urltext),
                ],
              ),
            );
          }),
        ),

        // onVerticalDragUpdate: (detail) => updateText("s"),
        onTap: () => updateText(),
      ),
    );
  }

  void updateText() {
    setState(() {
      saveurltext().get().then((String value) => urltext);
      datewaterius().getlistdata(urltext).then((value) {
        value.forEach((element) {
                list.add(element);
        });
      });
    });
  }
}

class Value extends StatelessWidget {
  String title;
  String subtitle;
  Color? color;

  Value({required this.title, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Card(
        child: ListTile(
          title: Text(title,
              style: TextStyle(
                color: color,
                fontSize: 50,
              )),
          subtitle: Text(subtitle),
        ),
      ),
    ));
  }
}
