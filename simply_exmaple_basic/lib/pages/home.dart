import 'package:flutter/material.dart';
import 'package:simply/simply.dart';
import '../services/menuitems_service.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuItemsRepo =
        SimpleServiceProvider.of(context).getService<IMenuItemsRepo>();
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Restuarant")),
      body: Center(
          child: FutureBuilder<List<String>>(
        future: menuItemsRepo.getMenuItemNames(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(snapshot.data![index]),
            ),
            itemCount: snapshot.data!.length,
          );
        },
      )),
    );
  }
}
