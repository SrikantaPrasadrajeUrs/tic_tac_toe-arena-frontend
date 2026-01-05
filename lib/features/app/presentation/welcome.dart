import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/features/app/widgets/swipe_btn.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final imageHeight = height * 0.6;

    return Scaffold(
      body: Stack(
        children: [
          _buildImage(imageHeight),
          _buildOverLay(imageHeight),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title(context),
                    ..._subtitle(context),
                    SizedBox(height: 50),
                    SwipeBtn()
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(double imageHeight){
    return Positioned(
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

  RichText title(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "TIC ",
            style: textTheme.titleLarge!.copyWith(
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 4,
                  color: AppColors.redGlow,
                ),
              ],
            ),
          ),
          TextSpan(
            text: "TAC ",
            style: textTheme.titleLarge,
          ),
          TextSpan(
            text: "TOE",
            style: textTheme.titleLarge!.copyWith(
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 4,
                  color: AppColors.blueGlow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverLay(double imageHeight){
    return  Positioned(
      top: imageHeight *.50,
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRect(
        child: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black54,
                Colors.black,
                Colors.black,
              ],
              stops: [0.0, 0.35, 0.6, 1.0],
            ).createShader(rect);
          },
          blendMode: BlendMode.dstIn,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(color: Colors.black),
          ),
        ),
      ),
    );
  }

  List<Widget> _subtitle(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    return [
        Text(
          "Challenge your mind. Compete in real time.",
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium,
        ),
        Text(
          "Classic strategy, modern experience",
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium,
        ),
      ];
  }
}
