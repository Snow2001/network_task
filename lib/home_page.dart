import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:network_task/Network.dart';
import 'package:network_task/Post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_apiPostList();
    var post = Post(id: 1, employee_name: 'Alisher', employee_salary: 32000, employee_age: 21);
    _apiPostCreate(post);
    //_apiPostUpdate(post);
    //_apiPostDelete(post);
  }
  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }
  void _apiPostDelete(Post post){
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network'),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Center(
            child: Text(data != null ? data : "No Data"),
          ),
        ),
      )
    );
  }
}
