import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';

class SwipeBtn extends StatefulWidget {
  const SwipeBtn({super.key});

  @override
  State<SwipeBtn> createState() => _SwipeBtnState();
}

class _SwipeBtnState extends State<SwipeBtn> with SingleTickerProviderStateMixin{
  late final ValueNotifier<double> buttonPosition;
  late final AnimationController controller;
  late Animation<double>? slideBackAnimation;

  final double btnWidth = 50;
  double maxDragArea = 0;
  double containerWidth = 0;
  final double padding = 5;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    buttonPosition = ValueNotifier<double>(0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    containerWidth = MediaQuery.of(context).size.width*.9;
    maxDragArea = containerWidth-btnWidth-(padding*2);
  }

  void updateBtnPosition(){
    buttonPosition.value = slideBackAnimation!.value;
  }

  void _animateTo(double target){
    slideBackAnimation = Tween<double>(begin: buttonPosition.value, end: target)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    slideBackAnimation!.addListener(updateBtnPosition);
    controller.forward().then((_){
      slideBackAnimation!.removeListener(updateBtnPosition);
      controller.reset();
    });
  }

  void onDragEnd(DragEndDetails _){
    if(buttonPosition.value>maxDragArea*.7) {
      _animateTo(maxDragArea);
    } else {
      _animateTo(0);
      HapticFeedback.mediumImpact();

    }
  }

  void onDragDetail(DragUpdateDetails dragDetail){
    buttonPosition.value = (buttonPosition.value+dragDetail.delta.dx).clamp(0, maxDragArea);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      padding: EdgeInsets.all(padding),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onHorizontalDragUpdate: onDragDetail,
            onHorizontalDragEnd: onDragEnd,
            child: ValueListenableBuilder(
              valueListenable: buttonPosition,
              builder: (context,position,_) {
                return Transform.translate(
                  offset: Offset(position, 0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.redGlow,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: .3),
                            spreadRadius: 2,
                            blurRadius: 2,
                          )
                        ]
                    ),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                );
              }
            ),
          ),
          Text("Swipe to Get Started"),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }

}
