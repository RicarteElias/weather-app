import 'package:flutter/cupertino.dart';
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
  TextEditingController searchAddressController = TextEditingController();
  late Animation<TimelineValue<AnimationProperties>> animation;
  bool _isNotAnimated = true;

  @override
  Widget build(BuildContext context) {
    if (_isNotAnimated) {
      _buildAnimation();
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, widget) => Container(
                margin: EdgeInsets.only(left: 5, top: 2, right: 5),
                alignment: animation.value.get(AnimationProperties.aligment),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Container(
                  decoration: _buildBoxDecoration(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: animation.value
                            .get(AnimationProperties.widthTextField),
                        child: Center(
                            child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5)),
                          textAlign: TextAlign.left,
                        )),
                      ),
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Theme.of(context).primaryColor,
                        child: InkWell(
                          onTap: () {
                            controller.play();
                          },
                          child: Row(
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                      child: Icon(FontAwesomeIcons.search))),
                              Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: animation.value
                                    .get(AnimationProperties.widthSearchButton),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1.0, right: 2),
                                  child: Opacity(
                                    opacity: animation.value
                                        .get(AnimationProperties.opacity),
                                    child: Text(
                                      "Pesquisar Localização",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  controller.reverse();
                },
                icon: Icon(FontAwesomeIcons.mapMarker),
                label: Text("Localização"))
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(5)));
  }

  _buildAnimation() {
    _isNotAnimated = false;
    controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    animation = TimelineTween<AnimationProperties>()
        .addScene(
            begin: 0.milliseconds, end: 100.milliseconds, curve: Curves.ease)
        .animate(AnimationProperties.opacity, tween: 1.0.tweenTo(0.0))
        .addSubsequentScene(
            delay: 100.milliseconds,
            duration: 250.milliseconds,
            curve: Curves.ease)
        .animate(AnimationProperties.widthSearchButton,
            tween: 150.0.tweenTo(0.0))
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
        .animate(AnimationProperties.widthTextField,
            tween: 0.0.tweenTo(MediaQuery.of(context).size.width - 50))
        .animate(AnimationProperties.color,
            tween: ColorTween(
                begin: AppColors.PRIMARY_DARK, end: Colors.deepPurple))
        .parent
        .animate(controller);
  }

  Widget _buildTextField() {
    return TextField();
  }
}
