import 'package:hive/hive.dart';

part 'user.adapter.g.dart';


@HiveType()
class User
{
  @HiveField(0)
  final String uuid;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final List<int> rated_movies;

  User(this.uuid, this.email, this.password, this.rated_movies);


}