import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  // By making `config` static, it belongs to the class, not the instance.
  // This makes it compatible with the const constructor.
  static final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil,
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio,
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil,
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito,
    },
  };

  const LevelButtonWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label));
    final currentConfig = config[label]!;
    return Container(
      decoration: BoxDecoration(
        color: currentConfig["color"] as Color,
        border: Border.fromBorderSide(
          BorderSide(color: currentConfig["borderColor"] as Color),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: currentConfig["fontColor"] as Color,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
