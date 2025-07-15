import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int days = 30;
  final String name = "Vikas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Catalog App")),
      body: Center(child: Text("Welcome to $days Days of Flutter by $name")),
      drawer: MyDrawer(),
    );
  }
}
