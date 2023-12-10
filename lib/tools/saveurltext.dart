import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class saveurltext {
  // Сохраним значение в преф
  void set(sharedData) async{
    if (sharedData =='') {
      return;
    }
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('sharedData', sharedData);
  }

  // Получим знаниние из преф
  Future<String> get() async {
    var prefs = await SharedPreferences.getInstance();
   String? urltext = prefs.getString('sharedData');
    return urltext.toString();
  }

  // Получим из вне и сохраним в преф
  setfromoutside() async{
    var platform    = const MethodChannel('app.channel.shared.data');
    String? urltext = await platform.invokeMethod('getSharedText');
    set(urltext);
  }

}