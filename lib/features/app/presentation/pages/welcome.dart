import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/core/theme/app_color_extension.dart';
import 'package:tic_tac_toe/features/app/presentation/widgets/swipe_btn.dart';

import '../bloc/theme/theme_bloc.dart';

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
          _buildThemeButton(context),
          _buildOverLay(imageHeight, context),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context),
                  ..._buildSubtitle(context),
                  SizedBox(height: 30),
                  SwipeBtn(),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
  
  Widget _buildThemeButton(BuildContext context){
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: (){
          context.read<ThemeBloc>().add(ToggleThemeEvent());
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
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

  Widget _buildOverLay(double imageHeight, BuildContext context){
    Color? overlayColor = Theme.of(context).extension<AppColorExtension>()?.primary;
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
            child: Container(color: overlayColor),
          ),
        ),
      ),
    );
  }

}
