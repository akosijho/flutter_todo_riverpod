import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/common/models/task.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/todo_tile.dart';

class CompletedTask extends ConsumerWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> tasksList = ref.read(todoStateProvider);
    List<String> dates = ref.watch(todoStateProvider.notifier).last30();
    List<Task> completedTasksList = tasksList
        .where((element) =>
            element.isCompleted == 1 || dates.contains(element.date))
        .toList();
    return ListView.separated(
        itemCount: completedTasksList.length,
        separatorBuilder: (context, index) => const Gap(
              height: 8,
            ),
        itemBuilder: (context, index) {
          final Task task = completedTasksList[index];
          bool isCompleted =
              ref.read(todoStateProvider.notifier).getStatus(task);
          Color color = ref.read(todoStateProvider.notifier).getRandomColor();
          return TodoTile(
            title: task.title,
            color: color,
            description: task.description,
            start: task.startTime,
            end: task.endTime,
            switcher: Switch(
                value: isCompleted,
                activeColor: AppConstants.kBlueLight,
                activeTrackColor: AppConstants.kBlueLight,
                inactiveThumbColor: Colors.transparent,
                thumbIcon: isCompleted
                    ? const MaterialStatePropertyAll(Icon(
                        Icons.check,
                        color: AppConstants.kBlueLight,
                      ))
                    : null,
                onChanged: null),
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTask(task.id ?? 0);
            },
          );
        });
  }
}
