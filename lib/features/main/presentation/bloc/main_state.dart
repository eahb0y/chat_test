part of 'main_bloc.dart';

class MainState extends Equatable {
  final Set<Items>? massageList;
  const MainState({
    this.massageList,
});
  MainState copyWith({
    Set<Items>? massageList
}){
    return MainState(
      massageList: massageList ?? this.massageList,
    );
  }

  @override
  List<Object?> get props => [massageList];
}
