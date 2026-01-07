import 'package:flutter/material.dart';

class SwipeBtn extends StatefulWidget {
  const SwipeBtn({super.key});

  @override
  State<SwipeBtn> createState() => _SwipeBtnState();
}

class _SwipeBtnState extends State<SwipeBtn> {

  double containerWidth = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    containerWidth = MediaQuery.of(context).size.width-32;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: containerWidth,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
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
          Text("Swipe to get Started"),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
  // padding
}
