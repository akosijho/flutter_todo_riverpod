import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/common/helpers/db_helper.dart';
import 'package:flutter_todo_riverpod/common/models/user.dart';

final userProvider = StateNotifierProvider<UserState, List<User>>((ref) => UserState());

class UserState extends StateNotifier<List<User>>{
  UserState() : super([]);

  void refresh() async{
    final users = await DBHelper.getUsers();
    state = users.map((e) => User.fromJson(e)).toList();
  }
}