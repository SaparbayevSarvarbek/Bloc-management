part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  List<ProductModel> list;
  HomeSuccess({required this.list});
}
final class HomeError extends HomeState {}
