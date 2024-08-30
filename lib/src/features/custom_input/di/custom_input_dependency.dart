import '../../../config/injector/injector_conf.dart';
import '../presentation/bloc/custom_input_cubit.dart';

class CustomInputDependency {
  CustomInputDependency._();

  static void init() {
    getIt.registerFactory<CustomInputCubit>(() => CustomInputCubit());
  }
}
