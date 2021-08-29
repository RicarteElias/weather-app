import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:weather_app/core/utils/animation/animation-properties.dart';
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
                  label: Text("Localilização"))
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
        .animate(AnimationProperties.height,
            tween: Tween(begin: 40.0, end: 10.0))
        .animate(AnimationProperties.width,
            tween: Tween(begin: 200.0, end: 10.0))
        .animate(
          AnimationProperties.borderRadius,
          tween: BorderRadiusTween(
            begin: BorderRadius.circular(4.0),
            end: BorderRadius.circular(75.0),
          ),
        )
        .addSubsequentScene(duration: 250.milliseconds)
        .animate(AnimationProperties.padding,
            tween: EdgeInsetsTween(
                begin: EdgeInsets.only(top: 0), end: EdgeInsets.only(top: 200)))
        .animate(AnimationProperties.opacity,
            tween: Tween(begin: 1.0, end: 0.0))
        .addSubsequentScene(
            delay: 100.milliseconds,
            duration: 250.milliseconds,
            curve: Curves.ease)
        .animate(AnimationProperties.height,
            tween: Tween(begin: 10.0, end: 40.0))
        .animate(AnimationProperties.width,
            tween: Tween(begin: 10.0, end: 500.0))
        .parent
        .animate(controller);
  }

  Widget _buildAnmatedWidget(BuildContext context, Widget? child) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(left: 10, right: 10),
      height: MediaQuery.of(context).size.height * 0.45,
      child: Container(
        width: animation.value.get(AnimationProperties.width),
        height: animation.value.get(AnimationProperties.height),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: animation.value.get(AnimationProperties.borderRadius),
        ),
        child: ElevatedButton.icon(
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
