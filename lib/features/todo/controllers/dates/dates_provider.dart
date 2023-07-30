import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dates_provider.g.dart';

@riverpod
class DateState extends _$DateState{
  @override
  String build(){
    return "";
  }

  void setDate(String newState){
    state = newState;
  }
}


@riverpod
class StartTime extends _$StartTime{
  @override
  String build() {
    return "";
  }

  void setStart(String newState) {
    state = newState;
  }

  List<int> dates(DateTime startDate) {
    DateTime now = DateTime.now();
    Duration difference = startDate.difference(now);
    return [difference.inDays, difference.inHours % 24, difference.inMinutes % 60, difference.inSeconds % 60];
  }
}

@riverpod
class EndTime extends _$EndTime{
  @override
  String build(){
    return "";
  }

  void setStart(String newState){
    state = newState;
  }
}