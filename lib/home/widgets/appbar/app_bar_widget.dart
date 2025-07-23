import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
    : super(
        preferredSize: Size.fromHeight(270),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(gradient: AppGradients.linear),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.photoUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 135,
              left: 20,
              right: 20,
              child: ScoreCardWidget(percent: user.score / 100),
            ),
          ],
        ),
      );
}
