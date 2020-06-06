import 'package:flutter/material.dart';
import 'package:flutterStarter/models/sampleData/sampleData.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  //  <--- Different ways to use a constructor --->
  //---> 1)
  // String title;
  // HomeScreen(String title){
  //   this.title=title;
  // }
  //   //---> 2)
  // String titleSample;
  // HomeScreen(this.titleSample)
  //---> 3) Never Changing final properties//
  final String title;
  HomeScreen({@required this.title});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<SampleData>(context, listen: false)
        .fetchAllJSONPLACEHOLDERDATAfromInternet();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<SampleData>(context, listen: false)
        .fetchAllJSONPLACEHOLDERDATAfromInternet();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<JSONPLACEHOLDER> dataFromSampleProvider =
        Provider.of<SampleData>(context).allData;
    print(dataFromSampleProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            )),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "The following are data from JSON PlaceHolderApi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 300,
              child: ListView(
                addAutomaticKeepAlives: false,
                children: <Widget>[
                  ..._generateItemsHere(dataFromSampleProvider)
                ],
              ),

              //     ListView.builder(
              //   itemCount: dataFromSampleProvider.length,
              //   itemBuilder: (BuildContext ctx, int i) {
              //     return Card(
              //       elevation: 2,
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           ListTile(
              //             leading: Icon(Icons.album),
              //             title: Text(dataFromSampleProvider[i].title),
              //             subtitle: Text(dataFromSampleProvider[i].body),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // )
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _generateItemsHere(List<JSONPLACEHOLDER> data) {
    List<Widget> list = [];
    if (data.length <= 0)
      return [
        Container(
          height: 300,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          ),
        )
      ];
    for (var i = 0; i <= data.length - 1; i++) {
      list.add(Card(
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text(data[i].title),
              subtitle: Text(data[i].body),
            ),
          ],
        ),
      ));
    }

    return list;
  }
}
