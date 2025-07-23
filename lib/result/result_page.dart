import 'package:dev_quiz/challenge/Widgets/next_button/next_button.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.title,
    required this.length,
    required this.result,
  });

  final String title;
  final int length;
  final int result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(AppImages.trophy),
                Text("Parabéns!", style: AppTextStyles.heading40),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu\n",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(text: title, style: AppTextStyles.bodyBold),
                      TextSpan(
                        text: "\ncom $result de $length acertos.",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                              "Desafio DevQuiz\nObtive ${(result / length) * 100}% de aproveitamento em $title!",
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                          label: "Voltar ao início",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
