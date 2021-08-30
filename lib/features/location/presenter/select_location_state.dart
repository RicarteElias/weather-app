import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:weather_app/core/utils/animation/animation-properties.dart';
import 'package:weather_app/core/utils/theme/AppColors.dart';
import 'package:weather_app/features/location/presenter/bloc/cubits/widget_cubit.dart';
import 'package:weather_app/features/location/presenter/select_location_screen.dart';

class SelectLocationState extends State<SelectLocationScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation<TimelineValue<AnimationProperties>> animation;
  bool _isNotAnimated = true;

  @override
  Widget build(BuildContext context) {
    if (_isNotAnimated) {
      _buildAnimation();
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: BlocProvider(
        create: (BuildContext context) =>
            WidgetCubit(_buildSearchButton(context)),
        child: SingleChildScrollView(
          child: BlocBuilder<WidgetCubit, Widget>(
            builder: (BuildContext context, state) {
              return Column(
                children: [
                  AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, widget) => Container(
                      margin: EdgeInsets.only(left: 5, top: 5, right: 5),
                      alignment:
                          animation.value.get(AnimationProperties.aligment),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: animation.value
                                .get(AnimationProperties.widthTextField),
                            color: Theme.of(context).primaryColor,
                            child: Center(
                                child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 5)),
                              textAlign: TextAlign.left,
                            )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.play();
                            },
                            child: Container(
                                color: Theme.of(context).primaryColor,
                                width: 40,
                                height: 40,
                                child: Center(
                                    child: Icon(FontAwesomeIcons.search))),
                          ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            alignment: Alignment.center,
                            height: 40,
                            width: animation.value
                                .get(AnimationProperties.widthSearchButton),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              child: Opacity(
                                opacity: animation.value
                                    .get(AnimationProperties.opacity),
                                child: Text(
                                  "Pesquisar Localização",
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        controller.reverse();
                        context.read<WidgetCubit>().change(_buildTextField());
                      },
                      icon: Icon(FontAwesomeIcons.mapMarker),
                      label: Text("Localização"))
                ],
              );
            },
          ),
        ),
      ),
    );
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
        // .animate(AnimationProperties.height,
        //     tween: Tween(begin: 10.0, end: 45.0))
        .animate(AnimationProperties.widthTextField,
            tween: 0.0.tweenTo(MediaQuery.of(context).size.width - 50))
        .animate(AnimationProperties.color,
            tween: ColorTween(
                begin: AppColors.PRIMARY_DARK, end: Colors.deepPurple))
        .parent
        .animate(controller);
  }

  // Widget _buildAnmatedWidget(context, Widget? child) =>
  //     BlocBuilder<WidgetCubit, Widget>(
  //       builder: (context, state) {
  //         return Column(
  //           children: [
  //             Container(
  //               alignment: animation.value.get(AnimationProperties.aligment),
  //               margin: EdgeInsets.only(left: 10, right: 10, top: 5),
  //               height: MediaQuery.of(context).size.height * 0.45,
  //               child: Container(
  //                 width: animation.value.get(AnimationProperties.width),
  //                 height: animation.value.get(AnimationProperties.height),
  //                 decoration: BoxDecoration(
  //                   borderRadius:
  //                       animation.value.get(AnimationProperties.borderRadius),
  //                 ),
  //                 child: _buildSearchButton(context),
  //               ),
  //             ),
  //             Text('$state')
  //           ],
  //         );
  //       },
  //     );

  Widget _buildSearchButton(BuildContext context) => FittedBox(
        child: ClipRect(
          child: ElevatedButton.icon(
            onPressed: () {
              controller.play();
              context.read<WidgetCubit>().change(Container());
            },
            icon: Icon(FontAwesomeIcons.search),
            label: Text(
              "Search Location",
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      );

  Widget _buildTextField() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(
        FontAwesomeIcons.search,
        color: Colors.white,
      )),
    );
  }
}
