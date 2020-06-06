import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class JSONPLACEHOLDER {
  final int userId;
  final int id;
  final String title;
  final String body;

  JSONPLACEHOLDER(
      {@required this.userId,
      @required this.id,
      @required this.title,
      @required this.body});
}

class SampleData with ChangeNotifier {
  List<JSONPLACEHOLDER> fetchedData = [];
  get allData {
    return [...fetchedData];
  }

  fetchAllJSONPLACEHOLDERDATAfromInternet() async {
    try {
      print("trying to run a json placeholder here ");
      final url = "https://jsonplaceholder.typicode.com/posts";
      final res = await http.get(url);
      final data = json.decode(res.body);
      // print(data);
      for (int i = 0; i <= data.length - 1; i++) {
        final item = new JSONPLACEHOLDER(
            userId: data[i]["userId"],
            id: data[i]["id"],
            title: data[i]["title"],
            body: data[i]["body"]);

        fetchedData.add(item);
      }
      print(fetchedData);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
