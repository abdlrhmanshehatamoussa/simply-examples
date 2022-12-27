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
  MaterialApp buildApp(SimpleProvider provider, String payload) {
    return const MaterialApp(
      home: TestWidget(),
    );
  }

  @override
  Future<void> initialize(SimpleRegistry registry) async {
    registry.register<IMenuItemsRepo>(
      service: MenuItemsRepo(),
      method: InjectionMethod.singleton,
    );
  }

  @override
  Widget splashPage() => const SimpleSplashPage();

  @override
  Widget startupErrorPage(String errorMessage) =>
      SimpleStartupErrorPage(errorMessage: errorMessage);
}
