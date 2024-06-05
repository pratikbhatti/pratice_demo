part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loaded({@Default([]) List<GetApiCall> data}) = Loaded;
  const factory HomeState.loading() = Loading;
  const factory HomeState.error({@Default('') String errorString}) = Error;
}
