import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/pages/notifier/welcome_notifier.dart';
import 'package:learning_app/pages/welcome/widget/onBoarding_widget.dart';

class Welcome extends ConsumerWidget {
  static const String id = '/welcome';
  Welcome({super.key});
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              PageView(
                onPageChanged: (value) {
                  ref.read(indexDotProvider.notifier).changeIndex(value);
                },
                controller: controller,
                children: [
                  // First Page
                  OnBoardingWidget(
                    controller: controller,
                    index: 1,
                    imagePath: 'assets/images/reading.png',
                    title: 'Connect With Everyone',
                    subTitle:
                        "Always keep in touch with your tutor and friends. Lets's get connect",
                  ),
                  // Second Page
                  OnBoardingWidget(
                    controller: controller,
                    index: 2,
                    imagePath: 'assets/images/man.png',
                    title: 'Connect With Everyone',
                    subTitle:
                        "Always keep in touch with your tutor and friends. Lets's get connect",
                  ),
                  // Third page
                  OnBoardingWidget(
                    controller: controller,
                    index: 3,
                    imagePath: 'assets/images/boy.png',
                    title: 'Connect With Everyone',
                    subTitle:
                        "Always keep in touch with your tutor and friends. Lets's get connect",
                  )
                ],
              ),
              Positioned(
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndex,
                ),
                bottom: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
