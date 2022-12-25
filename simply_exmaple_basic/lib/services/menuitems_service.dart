import 'package:simply/simply.dart';

abstract class IMenuItemsRepo extends ISimpleService {
  Future<List<String>> getMenuItemNames();
}

class MenuItemsRepo implements IMenuItemsRepo {
  @override
  Future<List<String>> getMenuItemNames() async {
    return ["Burger", "Pizza", "Juice"];
  }
}
