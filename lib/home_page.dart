import 'package:flutter/material.dart';
import 'package:flutter_byte_challenge/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double x = 0.0;
  double y = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFDCF0FB),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.allScroll,
                      onHover: (event) {
                        setState(() {
                          x = event.localPosition.dx;
                          y = event.localPosition.dy;
                        });
                      },
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return const RadialGradient(
                            colors: [
                              AppConstants.darkBlue,
                              AppConstants.lightBlue,
                            ],
                            radius: 0.6,
                          ).createShader(
                            Rect.fromCircle(
                              center: Offset(x, y),
                              radius: bounds.width * 0.1,
                            ),
                          );
                        },
                        blendMode: BlendMode.srcIn,
                        child: Text(
                          'FlutterBytes',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                color: AppConstants.lightBlue,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 90,
                left: 0,
                right: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    'Community',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          letterSpacing: -5.5,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
