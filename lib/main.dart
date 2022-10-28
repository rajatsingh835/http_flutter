import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //how to get the data

  void getRequest() async {
    //utl,data for send data to web
    var url = Uri.parse('https://reqres.in/api/users');
    var response = await http.get(url);
    print(response.body.toString());
  }

//how to send(post data) tha data
  void postRequest() async{
//map
    var data =
      {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka"
      };


    var url = Uri.parse('https://reqres.in/api/login');
    var response = await http.post(url,body: data);

    print(response.body.toString());

  }



  @override
  void initState() {
    super.initState();
  //  getRequest();
    postRequest();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        ),
      )
    );
  }
}
