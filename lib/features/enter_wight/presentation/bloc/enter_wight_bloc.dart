import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'enter_wight_event.dart';
part 'enter_wight_state.dart';

class EnterWightBloc extends Bloc<EnterWightEvent, EnterWightState> {
  EnterWightBloc() : super(EnterWightInitial()) {
    on<EnterWightEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
