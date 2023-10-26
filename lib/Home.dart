import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;

  loadincriment() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      count = pref.getInt("count") ?? 0;
    });
  }

  incriment() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      count++;
      pref.setInt("count", count);
    });
  }

  cln() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("count");
      count = 0;
    });
  }

  @override
  void initState() {
    loadincriment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text("ComeBack Count"),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [
                  Card(
                    child: Text(
                      count.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(onPressed: cln, child: Text("Cln Data"))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              onPressed: incriment,
              child: Icon(Icons.add),
              backgroundColor: Colors.redAccent,
            )));
  }
}
