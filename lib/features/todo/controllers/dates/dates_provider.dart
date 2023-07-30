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
  String build(){
    return "";
  }

  void setStart(String newState){
    state = newState;
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