import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterStarter/models/sampleData/sampleData.dart';
import 'package:flutterStarter/screen/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: SampleData())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(
          title: "HomeScreen",
        ),
      ),
    );
  }
}
