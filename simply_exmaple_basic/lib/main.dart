import 'package:flutter/material.dart';
import 'package:simply/simply.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends SimpleMaterialApp {
  TestApp({Key? key}) : super(key: key);

  @override
  MaterialApp buildApp(SimpleServiceProvider provider, String payload) {
    return const MaterialApp(
      home: TestWidget(),
    );
  }

  @override
  Future<void> initialize(SimpleServiceRegistry registery) async {
    registery.register<IMenuItemsRepo>(service: MenuItemsRepo());
  }

  @override
  Widget splashPage() => const SimpleSplashPage();

  @override
  Widget startupErrorPage(String errorMessage) =>
      SimpleStartupErrorPage(errorMessage: errorMessage);
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuItemsRepo =
        SimpleServiceProvider.of(context).getService<IMenuItemsRepo>();
    return FutureBuilder<List<String>>(
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
    );
  }
}

abstract class IMenuItemsRepo extends ISimpleService {
  Future<List<String>> getMenuItemNames();
}

class MenuItemsRepo implements IMenuItemsRepo {
  @override
  Future<List<String>> getMenuItemNames() async {
    return ["burger", "pizza", "juice"];
  }
}