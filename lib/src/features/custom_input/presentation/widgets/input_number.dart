import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputNumber extends StatelessWidget {
  final TextEditingController inputNumberController;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;
  final FocusNode currentFocusNode;

  const InputNumber({
    super.key,
    required this.inputNumberController,
    required this.nextFocusNode,
    required this.previousFocusNode,
    required this.currentFocusNode,
  });

  _nextFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  _previousFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(previousFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: context.theme.scaffoldBackgroundColor,
      ),
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (value) {
          if (value is RawKeyDownEvent &&
              value.logicalKey == LogicalKeyboardKey.backspace &&
              inputNumberController.text == '') {
            _previousFocus(context);
          }
        },
        child: TextFormField(
          focusNode: currentFocusNode,
          textInputAction: nextFocusNode != null
              ? TextInputAction.next
              : TextInputAction.done,
          onFieldSubmitted: (_) {
            _nextFocus(context);
          },
          onChanged: (value) {
            if (inputNumberController.value.text.length == 1) {
              _nextFocus(context);
            }
          },
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
            height: (65 - 12 * 2) / 30,
          ),
          controller: inputNumberController,
          maxLength: 1,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          buildCounter: (BuildContext context,
                  {int? currentLength, int? maxLength, bool? isFocused}) =>
              null,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(12),
          ),
          cursorRadius: const Radius.circular(5),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
