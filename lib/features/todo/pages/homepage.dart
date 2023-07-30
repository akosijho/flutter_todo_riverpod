import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/helpers/notification_helper.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text_field.dart';
import 'package:flutter_todo_riverpod/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_todo_riverpod/features/todo/pages/add_task.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/completed_tasks.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/todays_task.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/next_day_task.dart';
import 'package:flutter_todo_riverpod/features/todo/widgets/tomorrows_task.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  final TextEditingController _textEditingController = TextEditingController();
  late NotificationHelper notifierHelper;
  late NotificationHelper notifierController;

  @override
  void initState() {
    notifierHelper = NotificationHelper(ref: ref);
    Future.delayed(const Duration(seconds: 1), () {
      notifierController = NotificationHelper(ref: ref);
    });
    notifierHelper.initializwNotification();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(85),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                          text: 'Dashboard',
                          style: appStyle(
                              24, AppConstants.kLight, FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                                  return const AddTask();
                                }));
                          },
                        child: Container(
                          height: 32.h,
                          width: 32.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                                color: AppConstants.kLight,
                                borderRadius: BorderRadius.circular(9)),
                          child: const Icon(
                              Icons.add,
                              color: AppConstants.kBkDark,
                            ),
                        ),
                      )
                    ],
                  ),
                ),
                const Gap(height: 16),
                MyTextField(
                  hintText: "Search",
                  textEditingController: _textEditingController,
                  prefixIcon: IconButton(
                    icon: const Icon(AntDesign.search1),
                    onPressed: () {},
                  ),
                  suffixIcon: const Icon(FontAwesome.sliders),
                ),
                // const Gap(
                //   height: 16,
                // )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: <Widget>[
                const Gap(
                  height: 24,
                ),
                Row(
                  children: [
                    const Icon(
                      FontAwesome.tasks,
                      size: 20,
                      color: AppConstants.kLight,
                    ),
                    const Gap(
                      width: 8,
                    ),
                    MyText(
                        text: "Today's Task",
                        style:
                        appStyle(18, AppConstants.kLight, FontWeight.bold))
                  ],
                ),
                const Gap(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppConstants.kRadius),
                      color: AppConstants.kLight),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        color: AppConstants.kGreyDk,
                        borderRadius:
                        BorderRadius.circular(AppConstants.kRadius)),
                    controller: _tabController,
                    isScrollable: false,
                    labelColor: AppConstants.kBlueLight,
                    labelStyle:
                    appStyle(24, AppConstants.kBlueLight, FontWeight.w700),
                    unselectedLabelColor: AppConstants.kLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConstants.kWidth * 0.5,
                          child: Center(
                            child: MyText(
                              text: 'Pending',
                              style: appStyle(
                                  16, AppConstants.kBkDark, FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          // padding: EdgeInsets.only(left: 30.w),
                          width: AppConstants.kWidth * 0.5,
                          child: Center(
                            child: MyText(
                              text: 'Completed',
                              style: appStyle(
                                  16, AppConstants.kBkDark, FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Gap(
                  height: 24,
                ),
                /*
                * list of tasks
                * */
                SizedBox(
                  height: AppConstants.kHeight * 0.3,
                  width: AppConstants.kWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        /*
                        * Pending tasks list
                        * */
                        Container(
                            color: AppConstants.kBkLight,
                            height: AppConstants.kHeight * 0.3,
                            child: const TodaysTask()),
                        /*
                        * completed tasks list
                        * */
                        Container(
                          color: AppConstants.kBkLight,
                          height: AppConstants.kHeight * 0.3,
                          child: const CompletedTask(),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(
                  height: 20,
                ),
                const TomorrowsTask(),
                const Gap(
                  height: 20,
                ),
                const NextDayTasks()
              ],
            ),
          ),
        ));
  }
}
