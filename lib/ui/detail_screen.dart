import 'package:flutter/material.dart';
import 'package:iteqno/data/model/my_item.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.item}) : super(key: key);

  final MyItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Text("${item.title} ${item.id}"),
      ),
    );
  }
}
