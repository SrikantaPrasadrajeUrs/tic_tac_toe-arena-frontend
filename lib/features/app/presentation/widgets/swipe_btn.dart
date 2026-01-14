import 'package:flutter/material.dart';

class SwipeBtn extends StatefulWidget {
  const SwipeBtn({super.key});

  @override
  State<SwipeBtn> createState() => _SwipeBtnState();
}

class _SwipeBtnState extends State<SwipeBtn> with TickerProviderStateMixin{
  // current Pos
  late final ValueNotifier<double> btnPositionNotifier;
  double containerWidth = 0;
  double padding = 5;
  double maxDrag = 0;
  double buttonSize = 50;
  // parent
  late final AnimationController controller;
  // child
  Animation<double>? slideAnimation;

  @override
  void initState() {
    super.initState();
    btnPositionNotifier = ValueNotifier<double>(0);
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1400));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    containerWidth = MediaQuery.of(context).size.width*.9;
    maxDrag = containerWidth-padding-buttonSize;
  }

  @override
  void dispose() {
    controller.dispose();
    btnPositionNotifier.dispose();
    super.dispose();
  }

  void onDrag(DragUpdateDetails dragDetail){
    btnPositionNotifier.value =  (btnPositionNotifier.value+dragDetail.primaryDelta!)
        .clamp(0, maxDrag);
  }

  void onDragEnd(DragEndDetails dragDetails){
    if(btnPositionNotifier.value>maxDrag*.7){
      // animateToEnd
      _animateTo(maxDrag);
    }else{
      // animateToInit
      _animateTo(0);
    }
  }

  void updateBtnPosition(){
    btnPositionNotifier.value = slideAnimation!.value;
  }

  void _animateTo(double to){
    slideAnimation = Tween<double>(begin: btnPositionNotifier.value, end: to)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    slideAnimation?.addListener(updateBtnPosition);
    controller.forward().then((_){
      slideAnimation?.removeListener(updateBtnPosition);
      controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: containerWidth,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onHorizontalDragUpdate: onDrag,
            onHorizontalDragEnd: onDragEnd,
            child: ValueListenableBuilder(
              valueListenable: btnPositionNotifier,
              builder: (context, position, _) {
                return Transform.translate(
                  offset: Offset(position, 0),
                  child: Container(
                    height: buttonSize,
                    width: buttonSize,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2
                        )
                      ]
                    ),
                    child: Icon(Icons.arrow_forward_ios, size: 20,),
                  ),
                );
              }
            ),
          ),
          Text("Swipe to get Started"),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
  // padding
}
