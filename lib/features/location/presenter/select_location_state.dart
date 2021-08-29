import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:weather_app/core/utils/animation/animation-properties.dart';
import 'package:weather_app/core/utils/theme/AppColors.dart';
import 'package:weather_app/features/location/presenter/select_location_screen.dart';

class SelectLocationState extends State<SelectLocationScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation<TimelineValue<AnimationProperties>> animation;

  @override
  void initState() {
    super.initState();
    _buildAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            controller.play();
          },
          child: Column(
            children: [
              AnimatedBuilder(
                  animation: controller, builder: _buildAnmatedWidget),
              ElevatedButton.icon(
                  onPressed: () {
                    controller.reverse();
                  },
                  icon: Icon(FontAwesomeIcons.mapMarker),
                  label: Text("Localização"))
            ],
          ),
        ),
      ),
    );
  }

  _buildAnimation() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    animation = TimelineTween<AnimationProperties>()
        .addScene(
            begin: 0.milliseconds, end: 100.milliseconds, curve: Curves.ease)
        .animate(AnimationProperties.opacity,
            tween: Tween(begin: 1.0, end: 0.0))
        .addSubsequentScene(
            delay: 100.milliseconds,
            duration: 250.milliseconds,
            curve: Curves.ease)
        .animate(
          AnimationProperties.height,
          tween: 45.0.tweenTo(10.0),
        )
        .animate(AnimationProperties.width, tween: 200.0.tweenTo(10.0))
        .animate(
          AnimationProperties.borderRadius,
          tween: BorderRadiusTween(
            begin: BorderRadius.circular(4.0),
            end: BorderRadius.circular(75.0),
          ),
        )
        .addSubsequentScene(duration: 250.milliseconds)
        .animate(AnimationProperties.aligment,
            tween: AlignmentTween(
                begin: Alignment.bottomCenter, end: Alignment.topCenter))
        .addSubsequentScene(
            delay: 100.milliseconds,
            duration: 250.milliseconds,
            curve: Curves.ease)
        .animate(AnimationProperties.height,
            tween: Tween(begin: 10.0, end: 45.0))
        .animate(AnimationProperties.width, tween: 10.0.tweenTo(500.0))
        .animate(AnimationProperties.color,
            tween: ColorTween(
                begin: AppColors.PRIMARY_DARK, end: Colors.deepPurple))
        .parent
        .animate(controller);
  }

  Widget _buildAnmatedWidget(BuildContext context, Widget? child) {
    return Container(
      alignment: animation.value.get(AnimationProperties.aligment),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      height: MediaQuery.of(context).size.height * 0.45,
      child: Container(
        width: animation.value.get(AnimationProperties.width),
        height: animation.value.get(AnimationProperties.height),
        decoration: BoxDecoration(
          borderRadius: animation.value.get(AnimationProperties.borderRadius),
        ),
        child: ElevatedButton.icon(
            // style: ElevatedButton.styleFrom(
            //     primary: animation.value.get(AnimationProperties.color)),
            onPressed: () {
              controller.play();
            },
            icon: Icon(FontAwesomeIcons.search),
            label: Text(
              "Pesquisar endereço",
              overflow: TextOverflow.fade,
            )),
      ),
    );
  }
}
