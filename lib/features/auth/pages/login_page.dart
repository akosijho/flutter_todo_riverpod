import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_outlined_button.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text_field.dart';
import 'package:flutter_todo_riverpod/features/auth/pages/otp_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController textEditingController = TextEditingController();

  Country _country = Country(
      phoneCode: '1',
      countryCode: 'US',
      e164Sc: 0,
      geographic: true,
      name: 'USA',
      example: 'USA',
      displayName: 'United States',
      displayNameNoCountryCode: 'US',
      e164Key: '',
      level: 1);

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              const Gap(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  AppConstants.todo,
                  width: 300,
                ),
              ),
              const Gap(
                height: 48,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 16.w),
                child: MyText(
                  text: 'Please enter your phone number',
                  style: appStyle(16, AppConstants.kLight, FontWeight.w500),
                ),
              ),
              const Gap(
                height: 24,
              ),
              Center(
                child: MyTextField(
                  textEditingController: textEditingController,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(4),
                    child: MyOutlinedButton(
                      buttonStyle: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide.none)),
                      onPressed: () {
                        showCountryPicker(context: context,
                            showPhoneCode: true,
                            countryListTheme: CountryListThemeData(
                              backgroundColor: AppConstants.kLight,
                              bottomSheetHeight: AppConstants.kHeight * 0.6,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppConstants.kRadius),
                                topRight: Radius.circular(AppConstants.kRadius),
                              )
                            ),
                            onSelect: (Country country){
                              setState(() {
                               _country = country;
                              });
                            });
                      },
                      child: MyText(
                        text: '${_country.flagEmoji} +${_country.phoneCode}',
                        style:
                        appStyle(16, AppConstants.kBkDark, FontWeight.bold),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  hintText: 'Enter phone number',
                  hintStyle:
                      appStyle(16, AppConstants.kBkDark, FontWeight.w600),
                ),
              ),
              const Gap(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: MyOutlinedButton(
                    buttonStyle: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppConstants.kLight),
                        side: MaterialStateProperty.all(BorderSide.none)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const OtpPage();
                      }));
                    },
                    child: MyText(
                      text: 'Send Code',
                      style:
                          appStyle(24, AppConstants.kBkDark, FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
