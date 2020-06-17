import 'package:bloc/bloc.dart';

class PyDBlocDelegate extends BlocDelegate {

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
//    print('PyDBlocDelegate: ${DateTime.now().toIso8601String()} ${event.toString()}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    final now = DateTime.now();
//    print('onTransition: ${now.millisecond.toString().padLeft(3, '0')}${now.microsecond.toString().padLeft(3, '0')} $transition');
    super.onTransition(bloc, transition);
  }
}