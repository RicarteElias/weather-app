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
  late AnimationController _controller;
  TextEditingController _searchAddressController = TextEditingController();
  late Animation<TimelineValue<AnimationProperties>> animation;
  bool _isNotAnimated = true;
  final FocusNode _searchFieldFocus = FocusNode();
  bool _isAnimated = true;

  final _pages = <Widget>[
    // *Note*: when changed child is of the same type as previous one, set the
    // key property explicitly.
    const Icon(Icons.looks_one, size: 64, key: ValueKey(1)),
    const Icon(Icons.looks_two, size: 64, key: ValueKey(2)),
    const Icon(Icons.looks_3, size: 64, key: ValueKey(3)),
  ];

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
              animation: _controller,
              builder: (BuildContext context, widget) => Container(
                margin: EdgeInsets.only(left: 5, top: 5, right: 5),
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
                        child: Center(child: _buildTextField()),
                      ),
                      _buildButtonSearch(),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: _isAnimated
                    ? _buildbuttonLocalization()
                    : _buildButtonSendAddress()),
          ],
        )),
      ),
    );
  }

  _buildbuttonLocalization() {
    return ElevatedButton.icon(
        key: Key('1'),
        onPressed: () {
          _controller.reverse();
        },
        icon: Icon(FontAwesomeIcons.mapMarker),
        label: Text("Localização"));
  }

  _buildButtonSendAddress() {
    return ElevatedButton.icon(
        key: Key('2'),
        onPressed: () {
          _controller.reverse();
        },
        icon: Icon(FontAwesomeIcons.mapMarkedAlt),
        label: Text("Encontrar Endereço"));
  }

  _buildButtonSearch() {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () async {
          _controller.play();
        },
        child: Row(
          children: [
            Container(
                width: 40,
                height: 40,
                child: Center(child: Icon(FontAwesomeIcons.search))),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: animation.value.get(AnimationProperties.widthSearchButton),
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0, right: 2),
                child: Opacity(
                  opacity: animation.value.get(AnimationProperties.opacity),
                  child: Text(
                    "Pesquisar Localização",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ),
          ],
        ),
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
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
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
        .animate(_controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _searchFieldFocus.requestFocus();
        setState(() {
          _isAnimated = !_isAnimated;
        });
      }
    });
  }

  Widget _buildTextField() {
    return TextField(
      focusNode: _searchFieldFocus,
      controller: _searchAddressController,
      decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 5)),
      textAlign: TextAlign.left,
    );
  }
}
