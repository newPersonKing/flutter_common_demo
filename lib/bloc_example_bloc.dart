import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExampleBloc extends Bloc<BlocExampleEvent, BlocExampleState> {
  BlocExampleBloc() : super(BlocExampleState()) {
    on<UpdateBlocEvent>(_updateContent);
  }

  _updateContent(UpdateBlocEvent event, emit) {
    if(event.add){
      emit(state.copy(content: state.content?? 0 +1));
    }else{
      emit(state.copy(content: state.content?? 0 -1));
    }
  }
}

abstract class BlocExampleEvent {}

class UpdateBlocEvent extends BlocExampleEvent {
  bool add;

  UpdateBlocEvent(this.add);
}

class BlocExampleState {
   int? content;

  BlocExampleState copy({
    int? content,
  }) {
    return BlocExampleState()..content;
  }
}
