import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key, required this.percent});
  final double percent;
  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.percent,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => Stack(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: _animation.value,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.chartPrimary,
                ),
              ),
            ),
            Center(
              child: Text(
                "${(_animation.value * 100).toInt()}%",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.chartPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
