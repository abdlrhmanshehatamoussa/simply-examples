import 'package:flutter/material.dart';
import 'package:simply/simply.dart';
import 'pages/home.dart';
import 'services/menuitems_service.dart';

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
