import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/common/models/task.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/todo_tile.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TodaysTask extends ConsumerWidget {
  const TodaysTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> tasksList = ref.watch(todoStateProvider);
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
                onChanged: (val) async {
                  await ref.read(todoStateProvider.notifier).markCompleted(
                      task.id!,
                      task.title,
                      task.description,
                      1,
                      task.date,
                      task.startTime,
                      task.endTime);
                }),
            delete: () async {
             await ref.read(todoStateProvider.notifier).deleteTask(task.id ?? 0);
            },
            editWidget: IconButton(
              onPressed: () {},
              icon: const Icon(
                MaterialCommunityIcons.circle_edit_outline,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}
