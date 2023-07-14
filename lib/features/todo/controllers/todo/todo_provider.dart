import 'dart:math';

import 'package:flutter_todo_riverpod/common/helpers/db_helper.dart';
import 'package:flutter_todo_riverpod/common/models/task.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<Task> build() {
    return [];
  }

  void refresh() async {
    final data = await DBHelper.getItems();
    state = data.map((e) => Task.fromJson(e)).toList();
  }

  void addTask(Task task) async {
    await DBHelper.createItem(task);
    refresh();
  }

  void updateTask(Task task) async {
    await DBHelper.updateItem(task);
    refresh();
  }

  Future<void> deleteTask(int id) async {
    await DBHelper.deleteItem(id);
    refresh();
  }

  Future<void> markCompleted(int id, String title, String description,
      int isCompleted, String date, String startTime, String endTime) async {
    await DBHelper.updateItem(Task(
        id: id,
        title: title,
        description: description,
        isCompleted: 1,
        date: date,
        startTime: startTime,
        endTime: endTime,
        remind: 0,
        repeat: 'yes'));
    refresh();
  }

  String getToday() {
    DateTime today = DateTime.now();
    return DateFormat.yMMMMd().format(today);
  }

  String getTomorrow() {
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return DateFormat.yMMMMd().format(tomorrow);
  }

  String getDayAfterTomorrow() {
    DateTime tomorrow = DateTime.now().add(const Duration(days: 2));
    return DateFormat.yMMMMd().format(tomorrow);
  }

  List<String> last30() {
    DateTime today = DateTime.now();
    DateTime monthAgo = today.subtract(const Duration(days: 30));

    List<String> dates = [];
    for (int i = 0; i < 30; i++) {
      dates.add(
          DateFormat.yMMMMd().format(monthAgo.add(const Duration(days: 1))));
    }
    return dates;
  }

  bool getStatus(Task task) {
    bool isComplete = false;
    if (task.isCompleted == 0) {
      isComplete == false;
    } else {
      isComplete = true;
    }
    return isComplete;
  }

  dynamic getRandomColor(){
    Random random = Random();
    int randomIndex = random.nextInt(AppConstants.colors.length);
    return AppConstants.colors[randomIndex];
  }
}
