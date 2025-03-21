
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample/api_repo/api_call.dart';
import 'package:sample/api_repo/api_result_model.dart';
import 'package:sample/api_repo/end_points.dart';
import 'package:sample/features/api_models.dart/sample_model.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc() : super(SampleState.initial()) {
    on<SampleEvent>(_getData);
  }

void _getData(SampleEvent event,Emitter<SampleState> emit)async{
  emit(state.copyWith(status: Status.loading));

    try{
        final response = await ApiCall.getData(EndPoints.dummy);
        if(response.isSuccess){
          emit(state.copyWith(data: response.data,status: Status.success));
        }else{
          emit(state.copyWith(status: Status.error));
        }


    }
      catch(e){
        emit(state.copyWith(status: Status.error));
      }


}

}
