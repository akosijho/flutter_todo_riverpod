import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/common/models/user.dart';

final userProvider = StateNotifierProvider<UserState, List<User>>((ref) => UserState());

class UserState extends StateNotifier<List<User>>{
  UserState() : super([]);

}