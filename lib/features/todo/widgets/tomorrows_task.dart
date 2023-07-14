import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/xpansion_tile.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/xpansion_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/pages/update_task.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/todo_tile.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TomorrowsTask extends ConsumerWidget {
  const TomorrowsTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    String tomorrow = ref.read(todoStateProvider.notifier).getTomorrow();
    final colors = ref.read(todoStateProvider.notifier).getRandomColor();
    var tommorrowsTask =
        todos.where((element) => element.date.contains(tomorrow)).toList();
    return XpansionTile(
        text: "Tomorrow's Task",
        text2: "Tomorrow's Task are shown here",
        trailing: Padding(
          padding: EdgeInsets.only(right: 16.0.w),
          child: ref.watch(xpansionStateProvider)
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
          ref.read(xpansionStateProvider.notifier).setStart(!expanded);
        },
      children: tommorrowsTask
          .map((e) =>
          TodoTile(
              title: e.title,
              description: e.description,
              start: e.startTime,
              end: e.endTime,
              color: colors,
              delete: () async {
               await ref.read(todoStateProvider.notifier).deleteTask(e.id ?? 0);
              },
              editWidget: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UpdateTask(e);
                }));
              },
        icon: const Icon(MaterialCommunityIcons.circle_edit_outline,
          color: Colors.white,),
      ),
                ))
            .toList());
  }
}
