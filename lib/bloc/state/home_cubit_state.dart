import 'package:flutter/material.dart';

import '../main/main_state.dart';

@immutable
abstract class HomeScreenState extends MainCubitState {}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class HomeScreenLoadingState extends HomeScreenState {
  HomeScreenLoadingState();

  @override
  List<Object?> get props => [];
}

class HomeScreenSuccessState extends HomeScreenState {
  final String msg;

  HomeScreenSuccessState({this.msg = ""});

  @override
  List<Object?> get props => [msg];
}

class HomeScreenFailureState extends HomeScreenState {
  final String errorMsg;
  HomeScreenFailureState({this.errorMsg = " "});
  @override
  List<Object?> get props => [errorMsg];
}
