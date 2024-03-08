

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch1/list_tile_switch.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch2/switcher_button.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch3/switcher.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch3/switcher_size.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch4/sliding_switch.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch5/day_night_themed_switch.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch6/fswitch.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch7/on_off_switch.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch8/slider_switch.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch9/slide_switcher.dart';
import 'package:flutter_common_demo/cus_widget/switch/switch_10/load_switch.dart';
import 'package:gap/gap.dart';

class SwitchPage extends StatelessWidget {

  SwitchPage({super.key});

  final ValueNotifier<bool> isOpen1 = ValueNotifier(false);
  final ValueNotifier<bool> isOpen2 = ValueNotifier(false);
  final ValueNotifier<bool> isOpen3 = ValueNotifier(false);
  final ValueNotifier<bool> isOpen4 = ValueNotifier(false);
  var switcherIndex4 = 0;
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ValueListenableBuilder<bool>(valueListenable: isOpen1, builder: (context,value,child){
                return CustomSwitch(
                  width: 35.86,
                  height: 17.93,
                  onChanged: (bool value) {
                    isOpen1.value = value;
                  }, value: value,
                  activeColor: Colors.red,
                  gradientInActiveColor: const [
                    Color(0xFFDCDFE6),Color(0xFFDCDFE6)
                  ],
                  gradientActiveColor: const [
                    Color(0xFFF06A35),
                    Color(0xFFFAC791),
                  ],
                );
              }),
              const SizedBox(height: 15,),
              ValueListenableBuilder<bool>(valueListenable: isOpen2, builder: (context,value,child){
                return  SwitcherButton(
                  value: value,
                  onColor: Colors.red,
                  offColor: Colors.yellow,
                  onChange: (value) {
                    isOpen2.value = value;
                  },
                );
              }),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Small',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 50),
                  Switcher(
                    value: false,
                    colorOff: Colors.purple.withOpacity(0.3),
                    colorOn: Colors.purple,
                    onChanged: (bool state) {
                      //
                    },
                    size: SwitcherSize.small,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Medium',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Switcher(
                    value: false,
                    colorOff: Colors.orange.withOpacity(0.3),
                    colorOn: Colors.orange,
                    size: SwitcherSize.medium,
                    onChanged: (bool state) {
                      //
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Large',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Switcher(
                    value: false,
                    size: SwitcherSize.large,
                    colorOff: Colors.green.withOpacity(0.3),
                    colorOn: Colors.green,
                    onChanged: (bool state) {
                      //
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Medium',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Switcher(
                    value: false,
                    size: SwitcherSize.medium,
                    colorOff: Colors.blueGrey.withOpacity(0.3),
                    colorOn: Colors.blueGrey,
                    switcherButtonBoxShape: BoxShape.rectangle,
                    onChanged: (bool state) {
                      //
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Large',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Switcher(
                    value: false,
                    size: SwitcherSize.large,
                    switcherButtonRadius: 3,
                    colorOff: Colors.brown.withOpacity(0.3),
                    colorOn: Colors.brown,
                    onChanged: (bool state) {
                      //
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Medium',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Switcher(
                    value: false,
                    size: SwitcherSize.medium,
                    switcherButtonRadius: 3,
                    switcherRadius: 0,
                    enabledSwitcherButtonRotate: false,
                    colorOff: Colors.teal.withOpacity(0.3),
                    colorOn: Colors.teal,
                    onChanged: (bool state) {
                      //
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Large',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Switcher(
                    value: false,
                    size: SwitcherSize.large,
                    switcherButtonRadius: 50,
                    enabledSwitcherButtonRotate: true,
                    iconOff: Icons.lock,
                    iconOn: Icons.lock_open,
                    colorOff: Colors.blueGrey.withOpacity(0.3),
                    colorOn: Colors.blue,
                    onChanged: (bool state) {
                      //
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SlidingSwitch(
                value: false,
                width: 250,
                onChanged: (bool value) {
                },
                height : 55,
                animationDuration : const Duration(milliseconds: 400),
                onTap:(){},
                onDoubleTap:(){},
                onSwipe:(){},
                textOff : "Female",
                textOn : "Male",
                iconOff: Icons.man,
                iconOn: Icons.male,
                contentSize: 17,
                colorOn : const Color(0xffdc6c73),
                colorOff : const Color(0xff6682c0),
                background : const Color(0xffe4e5eb),
                buttonColor : const Color(0xfff7f5f7),
                inactiveColor : const Color(0xff636f7b),
              ),
              const SizedBox(height: 10),
              DayNightSwitch(
                value: true,
                onChanged: (_) {},
              ),
              const Gap(10),
              FSwitch(
                width: 300,
                height: 38,
                onChanged: (bool value) {},
                sliderChild: const Text(
                  "😃",
                  style: TextStyle(fontSize: 20),
                ),
                closeChild: null,
              ),
              const Gap(10),
              FSwitch(
                width: 65.0,
                height: 35.538,
                onChanged: (v) {},
                closeChild: const Text(
                  "😒",
                  style: TextStyle(fontSize: 20),
                ),
                openChild: const Text(
                  "😃",
                  style: TextStyle(fontSize: 20),
                ),
                childOffset: 3.0,
              ),
              const Gap(10),
              FSwitch(
                open: true,
                onChanged: (v) {},
                closeChild: const Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.white,
                ),
                openChild: const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              const Gap(10),
              FSwitch(
                width: 65.0,
                height: 35.538,
                onChanged: (v) {},
                closeChild: const Text(
                  "Off",
                  style: TextStyle(
                      color: Colors.white, fontSize: 11),
                ),
                openChild: const Text(
                  "On",
                  style: TextStyle(
                      color: Colors.white, fontSize: 11),
                ),
              ),
              const Gap(10),
              FSwitch(
                onChanged: (bool value) {
                },
                shadowColor: Colors.black.withOpacity(0.5),
                shadowBlur: 3.0,
              ),
              const Gap(10),
              ValueListenableBuilder<bool>(valueListenable: isOpen3, builder: (context,value,child){

                return OnOffSwitch(
                  value: value, // or false
                  onChanged: (bool newValue) {
                    isOpen3.value = newValue;
                  },
                );
              }),
              const Gap(10),
              SliderSwitch(
                // initialStatus: true, // default: false (false|true)
                // width: 50.0,
                // lenght: 120.0,
                orientation: Axis.horizontal, // default: Axis.vertical (Axis.vertical|Axis.horizontal)
                statusColorOpacity: 0.7, // default 0.5
                onChanged: (bool value) {

                },
                statusOnIcon: Icons.record_voice_over, // default: Icons.volume_up
                statusOffIcon: Icons.voice_over_off, // default: Icons.volume_off
                statusOnColor: Colors.red, // default: Color.green
              ),
              const Gap(10),
              SlideSwitcher(
                children: const [
                  Text('First'),
                  Text('Second'),
                ],
                onSelect: (index) {},
                containerHeight: 40,
                containerWight: 350,
              ),
              const Gap(10),
              SlideSwitcher(
                children: [
                  Container(),
                  Container(),
                ],
                onSelect: (index) {},
                isAllContainerTap: true,
                containerHeight: 30,
                containerWight: 100,
              ),
              const Gap(10),
              SlideSwitcher(
                children: const [
                  Text(
                    'First',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff714F43),
                    ),
                  ),
                  Text(
                    'Second',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff714F43),
                    ),
                  ),
                  Text(
                    'Third',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff714F43),
                    ),
                  ),
                  Text(
                    'Forth',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff714F43),
                    ),
                  ),
                ],
                initialIndex: 2,
                onSelect: (int index){

                },
                containerBorderRadius: 0,
                indents: 10,
                containerBorder: Border.all(
                  width: 3,
                  color: const Color(0xffFFFFE3),
                ),
                containerColor: const Color(0xffE1CCB9).withOpacity(0.8),
                slidersColors: const [
                  Color(0xffFFFFE3),
                ],
                containerHeight: 50,
                containerWight: 350,
              ),
              const Gap(10),
              SlideSwitcher(
                children: [
                  Text(
                    'First',
                    style: TextStyle(
                        fontSize: 15,
                        color: switcherIndex4 == 0
                            ? Colors.white.withOpacity(0.9)
                            : Colors.grey),
                  ),
                  Text(
                    'Second',
                    style: TextStyle(
                        fontSize: 15,
                        color: switcherIndex4 == 1
                            ? Colors.white.withOpacity(0.9)
                            : Colors.grey),
                  ),
                  Text(
                    'Third',
                    style: TextStyle(
                        fontSize: 15,
                        color: switcherIndex4 == 2
                            ? Colors.white.withOpacity(0.9)
                            : Colors.grey),
                  ),
                ],
                onSelect: (int index){

                },
                containerColor: Colors.transparent,
                containerBorder: Border.all(color: Colors.white),
                slidersGradients: const [
                  LinearGradient(
                    colors: [
                      Color.fromRGBO(47, 105, 255, 1),
                      Color.fromRGBO(188, 47, 255, 1),
                    ],
                  ),
                  LinearGradient(
                    colors: [
                      Color.fromRGBO(47, 105, 255, 1),
                      Color.fromRGBO(0, 192, 169, 1),
                    ],
                  ),
                  LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 105, 105, 1),
                      Color.fromRGBO(255, 62, 62, 1),
                    ],
                  ),
                ],
                indents: 9,
                containerHeight: 50,
                containerWight: 315,
              ),
              Gap(10),
              Row(
                children: [
                  const SizedBox(width: 65),
                  SlideSwitcher(
                    children: const [
                      Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.add_moderator,
                        color: Colors.white,
                      ),
                    ],
                    onSelect: (int index) {},
                    direction: Axis.vertical,
                    containerColor: Colors.teal.withOpacity(0.5),
                    slidersColors: const [Colors.teal],
                    containerHeight: 70,
                    containerWight: 90,
                  ),
                  const SizedBox(width: 20),
                  SlideSwitcher(
                    children: const [
                      Text(
                        'First',
                        style: TextStyle(
                          color: Color.fromRGBO(53, 90, 242, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Second',
                        style: TextStyle(
                          color: Color.fromRGBO(53, 90, 242, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Third',
                        style: TextStyle(
                          color: Color.fromRGBO(53, 90, 242, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Forth',
                        style: TextStyle(
                          color: Color.fromRGBO(53, 90, 242, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Fifth',
                        style: TextStyle(
                          color: Color.fromRGBO(53, 90, 242, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                    onSelect: (int index){

                    },
                    slidersColors: const [Colors.white],
                    containerHeight: 320,
                    containerWight: 60,
                    indents: 4,
                    direction: Axis.vertical,
                    containerColor: const Color.fromRGBO(140, 176, 254, 1),
                  ),
                  const SizedBox(width: 20),
                  SlideSwitcher(
                    children: const [
                      Text(
                        'F',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'S',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                    direction: Axis.vertical,
                    containerColor: Colors.purple,
                    slidersColors: [Colors.transparent],
                    slidersBorder: Border.all(color: Colors.white, width: 2),
                    containerBorder: Border.all(color: Colors.white, width: 2),
                    containerHeight: 300,
                    containerWight: 40,
                    indents: 5,
                    onSelect: (int index) {

                    },
                  ),
                ],
              ),
              const Gap(10),
              ValueListenableBuilder<bool>(valueListenable: isOpen4, builder: (context,value,child){
                return LoadSwitch(
                  value: value,
                  future: () async{
                    await Future.delayed(const Duration(seconds: 2));
                    return true;
                  },
                  style: SpinStyle.cubeGrid,
                  onTap: (v) {
                    debugPrint("====ontap");
                  },
                  onChange: (value) {
                    isOpen4.value = value;
                  },
                );
              }),
              const Gap(100)
            ],
          ),
        ),
      ),
    );
  }


}