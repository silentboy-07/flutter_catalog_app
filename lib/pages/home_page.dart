import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;  //For API Call

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";  // For API call
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );

    // final response = await http.get(Uri.parse(url));           // For API call
    // final catalogJson = response.body;

    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(
      productsData,
    ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: SizedBox(
        height: 50, // adjust height
        width: 55, // adjust weight

        child: VxBuilder<MyStore>(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, store, status) {
            final CartModel cart = (store).cart;

            return FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
              shape: const CircleBorder(),
              child: const Icon(
                CupertinoIcons.cart,
                color: Colors.white,
                size: 25,
              ),
            ).badge(
              color: Vx.gray200,
              size: 22,
              count: cart.items.length,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList().py2())
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
