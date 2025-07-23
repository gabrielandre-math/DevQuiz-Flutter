import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      final user = controller.user;
      final quizzes = controller.quizzes;

      if (user == null || quizzes == null) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
            ),
          ),
        );
      }

      return Scaffold(
        appBar: AppBarWidget(user: user),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 84),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    LevelButtonWidget(label: 'Fácil'),
                    const SizedBox(width: 8),
                    LevelButtonWidget(label: 'Médio'),
                    const SizedBox(width: 8),
                    LevelButtonWidget(label: 'Difícil'),
                    const SizedBox(width: 8),
                    LevelButtonWidget(label: 'Perito'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: quizzes.isEmpty
                    ? Center(
                        child: Text(
                          'Nenhum quiz disponível',
                          style: TextStyle(fontSize: 18, color: AppColors.grey),
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: quizzes
                            .map(
                              (element) => QuizCardWidget(
                                title: element.title,
                                completed:
                                    "${element.questionAnswered}/${element.questions.length}",
                                percent: element.questions.isNotEmpty
                                    ? element.questionAnswered /
                                          element.questions.length
                                    : 0.0,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                        questions: element.questions,
                                        title: element.title,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            .toList(),
                      ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
