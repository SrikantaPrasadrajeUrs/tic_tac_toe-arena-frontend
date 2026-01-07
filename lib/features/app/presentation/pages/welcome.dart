import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/features/app/presentation/widgets/swipe_btn.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final imageHeight = height * .6;
    return Scaffold(
      body: Stack(
        children: [
         _buildImage(imageHeight),
          _buildOverLay(imageHeight),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(context),
                      ..._buildSubtitle(context),
                      SizedBox(height: 30),
                      SwipeBtn(),
                    ],
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSubtitle(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    return [
      Text("Challenge your mind, Compete in real time", style: textTheme.bodyMedium,),
      Text("Classic strategy, modern experience", style: textTheme.bodyMedium),
    ];
  }

  RichText _buildTitle(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "TIC ",
              style: textTheme.titleLarge!.copyWith(
                shadows: [
                  Shadow(
                    color: Colors.redAccent,
                    offset: Offset(2, 2)
                  )
                ]
              )
            ),
            TextSpan(
              text: "TAC ",
                style: textTheme.titleLarge
            ),
            TextSpan(
              text: "TOE",
                style: textTheme.titleLarge!.copyWith(
                    shadows: [
                      Shadow(
                          color: Colors.blueAccent,
                          offset: Offset(2, 2),
                      )
                    ]
                )
            )
          ]
        ),
    );
  }

  Widget _buildImage(double imageHeight){
    return  Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: imageHeight / 2,
      child: Image.asset(
        "assets/images/tic_tac_toe.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildOverLay(double imageHeight){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: imageHeight * .50,
      child: ClipRect(
        child: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              stops: [0.0, .35, 0.6, 0.1],
              colors: [
                Colors.transparent,
                Colors.black54,
                Colors.black,
                Colors.black
              ],
            ).createShader(rect);
          },
          blendMode: BlendMode.dstIn,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 40),
            child: Container(color: Colors.black),
          ),
        ),
      ),
    );
  }

}
