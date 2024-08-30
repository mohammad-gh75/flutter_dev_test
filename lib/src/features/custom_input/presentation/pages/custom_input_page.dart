import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector/injector_conf.dart';
import '../bloc/custom_input_cubit.dart';
import '../bloc/custom_input_state.dart';
import '../widgets/input_number.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomInputCubit>(
      create: (context) => getIt<CustomInputCubit>(),
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: const Text(
        'custom input',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CustomInputCubit, CustomInputState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InputNumber(
                inputNumberController: state.controllerNumber1,
                currentFocusNode: state.focusNodeNumber1,
                previousFocusNode: null,
                nextFocusNode: state.focusNodeNumber2,
              ),
              InputNumber(
                inputNumberController: state.controllerNumber2,
                currentFocusNode: state.focusNodeNumber2,
                previousFocusNode: state.focusNodeNumber1,
                nextFocusNode: state.focusNodeNumber3,
              ),
              InputNumber(
                inputNumberController: state.controllerNumber3,
                currentFocusNode: state.focusNodeNumber3,
                previousFocusNode: state.focusNodeNumber2,
                nextFocusNode: state.focusNodeNumber4,
              ),
              InputNumber(
                inputNumberController: state.controllerNumber4,
                currentFocusNode: state.focusNodeNumber4,
                previousFocusNode: state.focusNodeNumber3,
                nextFocusNode: null,
              ),
            ],
          ),
        );
      },
    );
  }
}
