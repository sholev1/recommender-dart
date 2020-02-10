import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

abstract class HiveDB
{
  Future<void> initialize();
  Future<Box> openBox(String box_name);
  // void dispose();
}

class HiveDBImplementation extends Equatable implements HiveDB
{
  // @override
  // void dispose() {
  //   Hive.box(name)
  // }

  @override
  Future<void> initialize() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }

  @override
  Future<Box> openBox(String box_name) async {
    return await Hive.openBox(box_name);
  }

}
