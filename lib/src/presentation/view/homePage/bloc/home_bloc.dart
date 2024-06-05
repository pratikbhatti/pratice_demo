import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pratik_testing/src/data/apiHelper/api_helper.dart';
import 'package:pratik_testing/src/presentation/view/homePage/model/get_api_model.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.loaded()) {
    on<GetDataEvent>(_getDataEvent);
    // on<HomeEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
  List<GetApiCall>? data = [];
  ApiHelper apiHelper = ApiHelper();
  Future<FutureOr<void>> _getDataEvent(GetDataEvent event, Emitter<HomeState> emit) async {
    try {
      emit(Loading());
      data = await apiHelper.getApiFunction();
      emit(Loaded(data: data ??[]));
    } catch (e) {
      emit(Error(errorString: e.toString()));
    }
  }
}
