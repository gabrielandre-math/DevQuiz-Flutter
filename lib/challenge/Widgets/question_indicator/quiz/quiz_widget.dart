import 'package:dev_quiz/challenge/Widgets/question_indicator/answer/answer_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    super.key,
    required this.question,
    required this.onSelected,
  });

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        child: Column(
          children: [
            Text(widget.question.title, style: AppTextStyles.heading),
            SizedBox(height: 24),
            for (var i = 0; i < widget.question.answers.length; i++)
              AnswerWidget(
                answer: answer(i),
                disabled: indexSelected != -1,
                onTap: (value) {
                  indexSelected = i;
                  setState(() {});
                  Future.delayed(
                    Duration(seconds: 1),
                  ).then((_) => widget.onSelected(value));
                },
                isSelected: indexSelected == i,
              ),
          ],
        ),
      ),
    );
  }
}
