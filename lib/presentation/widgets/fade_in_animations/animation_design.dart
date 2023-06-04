import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/presentation/widgets/fade_in_animations/fade_in_animation_controller.dart';
import 'package:weather/presentation/widgets/fade_in_animations/fade_in_animation_model.dart';

class FadeInAnimation extends StatelessWidget {
  FadeInAnimation({Key? key, required this.durationInMs, this.animate,required this.child}) : super(key: key);
  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final AnimatePosition? animate;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
      top: controller.animate.value? animate!.topAfter:animate!.topBefore,
      left: controller.animate.value? animate!.leftAfter:animate!.leftBefore,
      bottom: controller.animate.value? animate!.bottomAfter:animate!.bottomBefore,
      right: controller.animate.value? animate!.rightAfter:animate!.rightBefore,



        duration: Duration(milliseconds: durationInMs),

        child: AnimatedOpacity(
            opacity: controller.animate.value?1:0,

            duration: Duration(milliseconds: durationInMs)
        ,child: child,
        ),

    ));
  }
}
