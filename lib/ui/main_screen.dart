import 'package:flutter/material.dart';
import 'package:iteqno/data/model/my_item.dart';
import 'package:iteqno/ui/detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int lastId = 1;
  final List<MyItem> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('iTeqno'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  list.clear();
                });
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return Dismissible(
              key: Key(item.id.toString()),
              onDismissed: (_) {
                list.removeAt(index);
              },
              child: Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: FlutterLogo(),
                    radius: 24,
                  ),
                  title: Text("${item.title} ${item.id}"),
                  subtitle: const Text('This is subtitle'),
                  trailing: IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => DetailScreen(item: item)));
                    },
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add(MyItem(id: lastId, title: "iTeqno"));
            lastId++;
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people_alt_sharp), label: 'Customers'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
