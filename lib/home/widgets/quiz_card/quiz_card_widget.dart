import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget({
    super.key,
    required this.title,
    required this.completed,
    required this.onTap,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            const SizedBox(height: 20),
            Text(title, style: AppTextStyles.heading15),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(completed, style: AppTextStyles.body11),
                const SizedBox(width: 16),
                Expanded(child: ProgressIndicatorWidget(value: percent)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
