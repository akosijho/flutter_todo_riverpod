import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text_field.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/dates/dates_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/my_material_button.dart';
import 'package:intl/intl.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String scheduleDate = ref.watch(dateStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppConstants.kLight),
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
                          showTitleActions: true,
                         onConfirm: (date) {
                            print('confirm $date');
                          }, locale: picker.LocaleType.en);
                    },
                    text: 'Start Time',
                    textStyle:
                        appStyle(18, AppConstants.kLight, FontWeight.bold),
                    buttonColor: AppConstants.kBlueLight),
                MyMaterialButton(
                    width: AppConstants.kWidth * 0.4,
                    onPressed: () {},
                    text: 'Set Date',
                    textStyle:
                        appStyle(18, AppConstants.kLight, FontWeight.bold),
                    buttonColor: AppConstants.kBlueLight),
              ],
            ),
            const Gap(
              height: 16,
            ),
            MyMaterialButton(
                onPressed: () {},
                text: 'Submit',
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