import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomInputState extends Equatable {
  final FocusNode focusNodeNumber1 = FocusNode();
  final FocusNode focusNodeNumber2 = FocusNode();
  final FocusNode focusNodeNumber3 = FocusNode();
  final FocusNode focusNodeNumber4 = FocusNode();

  final TextEditingController controllerNumber1 = TextEditingController();
  final TextEditingController controllerNumber2 = TextEditingController();
  final TextEditingController controllerNumber3 = TextEditingController();
  final TextEditingController controllerNumber4 = TextEditingController();

  CustomInputState();

  @override
  List<Object> get props => [
        focusNodeNumber1,
        focusNodeNumber2,
        focusNodeNumber3,
        focusNodeNumber4,
        controllerNumber1,
        controllerNumber2,
        controllerNumber3,
        controllerNumber4,
      ];
}
