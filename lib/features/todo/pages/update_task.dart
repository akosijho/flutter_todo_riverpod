import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/models/task.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text_field.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/dates/dates_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/my_material_button.dart';
import 'package:intl/intl.dart';

class UpdateTask extends ConsumerStatefulWidget {
  const UpdateTask(this.task, {super.key});

  final Task task;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends ConsumerState<UpdateTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String scheduleDate = '';
  String startTime = '';
  String endTime = '';


  @override
  void initState() {
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
    scheduleDate = widget.task.date;
    startTime = widget.task.startTime;
    endTime = widget.task.endTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppConstants.kLight),
        title: Text(
          'Update Task',
          style: appStyle(24, AppConstants.kLight, FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            const Gap(
              height: 16,
            ),
            MyTextField(
                hintText: 'Add Title',
                textEditingController: titleController,
                hintStyle:
                    appStyle(16, AppConstants.kBkLight, FontWeight.w600)),
            const Gap(
              height: 16,
            ),
            MyTextField(
                hintText: 'Add Description',
                textEditingController: descriptionController,
                hintStyle:
                    appStyle(16, AppConstants.kBkLight, FontWeight.w600)),
            const Gap(
              height: 16,
            ),
            MyMaterialButton(
                onPressed: () {
                  picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(DateTime.now().year,
                          DateTime.now().year, DateTime.now().day),
                      // theme: picker.DatePickerTheme(
                      //     headerColor: Colors.orange,
                      //     backgroundColor: Colors.blue,
                      //     itemStyle: TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 18),
                      //     doneStyle:
                      //     TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (date) {}, onConfirm: (date) {
                    ref
                        .refresh(dateStateProvider.notifier)
                        .setDate(DateFormat.yMMMMd().format(date));
                  }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
                },
                text: scheduleDate.isEmpty ? 'Set Date' : scheduleDate,
                textStyle: appStyle(18, AppConstants.kLight, FontWeight.bold),
                buttonColor: AppConstants.kBlueLight),
            const Gap(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyMaterialButton(
                    width: AppConstants.kWidth * 0.4,
                    onPressed: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(startTimeProvider.notifier)
                            .setStart(DateFormat.Hm().format(date));
                      }, locale: picker.LocaleType.en);
                    },
                    text: startTime.isEmpty ? 'Start Time' : startTime,
                    textStyle:
                        appStyle(18, AppConstants.kLight, FontWeight.bold),
                    buttonColor: AppConstants.kBlueLight),
                MyMaterialButton(
                    width: AppConstants.kWidth * 0.4,
                    onPressed: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(endTimeProvider.notifier)
                            .setStart(DateFormat.Hm().format(date));
                      }, locale: picker.LocaleType.en);
                    },
                    text: endTime.isEmpty ? 'End Time' : endTime,
                    textStyle:
                        appStyle(18, AppConstants.kLight, FontWeight.bold),
                    buttonColor: AppConstants.kBlueLight),
              ],
            ),
            const Gap(
              height: 16,
            ),
            MyMaterialButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      scheduleDate.isNotEmpty &&
                      startTime.isNotEmpty &&
                      endTime.isNotEmpty) {
                    ref.read(todoStateProvider.notifier).updateTask(Task(
                      id: widget.task.id,
                      title: titleController.text,
                      description: descriptionController.text,
                      date: scheduleDate,
                      startTime: startTime,
                      endTime: endTime,
                      isCompleted: widget.task.isCompleted,
                      remind: widget.task.remind,
                      repeat: widget.task.repeat,
                    ));
                    ref.read(dateStateProvider.notifier).setDate('');
                    ref.read(startTimeProvider.notifier).setStart('');
                    ref.read(endTimeProvider.notifier).setStart('');
                    Navigator.pop(context);
                  } else {
                    print('Failed to add task');
                  }
                },
                text: 'Update Task',
                textStyle: appStyle(18, AppConstants.kLight, FontWeight.bold),
                buttonColor: AppConstants.kGreen),
            const Gap(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
