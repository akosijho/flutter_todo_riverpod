import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text_field.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        style:
                            appStyle(24, AppConstants.kLight, FontWeight.bold)),
                    Container(
                        height: 32.h,
                        width: 32.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppConstants.kLight,
                            borderRadius: BorderRadius.circular(9)),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            color: AppConstants.kBkDark,
                          ),
                        ))
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
              const Gap(
                height: 16,
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                text: 'Todo with Rieverpod',
                style: appStyle(26, AppConstants.kBlueLight, FontWeight.bold),
              ),
              const Gap(height: 56),
              MyText(
                text: 'Todo with Rieverpod',
                style: appStyle(26, AppConstants.kBlueLight, FontWeight.bold),
              ),
            ]),
      ),
    );
  }
}
