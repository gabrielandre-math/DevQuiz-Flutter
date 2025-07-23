// home_controller.dart

import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getData() async {
    state = HomeState.loading;

    final responses = await Future.wait([
      repository.getUser(),
      repository.getQuizzes(),
    ]);

    user = responses[0] as UserModel;
    quizzes = responses[1] as List<QuizModel>;

    await Future.delayed(Duration(seconds: 2));

    state = HomeState.success;
  }
}
