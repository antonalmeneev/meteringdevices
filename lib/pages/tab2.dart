import 'package:flutter/material.dart';
import 'package:testproject/tools/saveurltext.dart';

class Tab2 extends StatelessWidget {
  String title;
  String urltext ='';

  Tab2({required this.title});

  @override
  Widget build(BuildContext context) {
    saveurltext().get().then((value) => urltext  = value);
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: TextField(
            controller: TextEditingController(),
            // obscureText: true,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), labelText: urltext),
            onChanged:    (text) => Tab2onChanged(text),
            style: const TextStyle(fontSize: 22, color: Colors.blue),
    maxLines: 10,
    minLines: 5));
  }

  void Tab2onChanged(text) {
    if (urltext==''){
      return;
    }
    urltext = text;
    saveurltext().set(text);
  }
}
