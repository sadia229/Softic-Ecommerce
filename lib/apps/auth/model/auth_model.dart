import 'package:hive/hive.dart';
part 'auth_model.g.dart';

@HiveType(typeId: 0)
class Token extends HiveObject {
  @HiveField(0)
  late String accessToken;
}
