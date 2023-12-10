import 'package:flutter/material.dart';
import 'package:testproject/pages/tab1.dart';
import 'package:testproject/pages/tab2.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [
              Center(child: Tab1(title: 'Приборы учета')),
              Center(child: Tab2(title: 'Настройки')),
              // Text(urltext.toString(),style: TextStyle(fontSize: 50),),
            ],
          ),
        ),
      );
    }
  }


