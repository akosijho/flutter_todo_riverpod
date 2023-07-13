import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/common/models/task.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/todo_tile.dart';

class TodaysTask extends ConsumerWidget {
  const TodaysTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> tasksList = ref.read(todoStateProvider);
    String today = ref.watch(todoStateProvider.notifier).getToday();
    List<Task> todayTasksList = tasksList
        .where((element) =>
            element.isCompleted == 0 && element.date.contains(today))
        .toList();
    return ListView.separated(
        itemCount: todayTasksList.length,
        separatorBuilder: (context, index) => const Gap(
              height: 8,
            ),
        itemBuilder: (context, index) {
          final Task task = todayTasksList[index];
          return TodoTile(
            title: task.title,
            color: AppConstants.kGreen,
            description: task.description,
            start: task.startTime,
            end: task.endTime,
            switcher:  const Switch(
              value: true,
              activeColor: AppConstants.kBlueLight,
              activeTrackColor: AppConstants.kBlueLight,
              thumbIcon: MaterialStatePropertyAll(Icon(
                Icons.check,
                color: AppConstants.kBlueLight,
              )),
              onChanged: null),
          );
        });
  }
}
