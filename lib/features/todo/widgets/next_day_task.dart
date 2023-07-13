import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/xpansion_tile.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/xpansion_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/todo_tile.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class NextDayTasks extends ConsumerWidget {
  const NextDayTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    String tomorrow = ref.read(todoStateProvider.notifier).getDayAfterTomorrow();
    final colors = ref.read(todoStateProvider.notifier).getRandomColor();
    var dayAfterTomorrowTasks =
    todos.where((element) => element.date.contains(tomorrow)).toList();
    return  XpansionTile(
        text: DateTime.now()
            .add(const Duration(days: 2))
            .toString()
            .substring(5, 10),
        text2: "Next day's task",
        trailing: Padding(
          padding: EdgeInsets.only(right: 16.0.w),
          child: ref.watch(xpansionState0Provider)
              ? const Icon(
            AntDesign.circledown,
            color: AppConstants.kLight,
          )
              : const Icon(
            AntDesign.closecircleo,
            color: AppConstants.kLight,
          ),
        ),
        onExpansionChanged: (bool expanded) {
          ref
              .read(xpansionState0Provider.notifier)
              .setStart(!expanded);
        },
        children: dayAfterTomorrowTasks
            .map((e) =>
            TodoTile(
              title: e.title,
              description: e.description,
              start: e.startTime,
              end: e.endTime,
              color: colors,
              delete: () {
                ref.read(todoStateProvider.notifier).deleteTask(e.id ?? 0);
              },
              editWidget: IconButton(
                onPressed: () {},
                icon: const Icon(MaterialCommunityIcons.circle_edit_outline,
                  color: Colors.white,),
              ),
            ))
            .toList());
  }
}
