part of 'promo_bloc.dart';

abstract class PromoState {}

class PromoInitial extends PromoState {}

class PromoLoadingState extends PromoState {}

class PromoLoadedState extends PromoState {
  final PromoM promo;

  PromoLoadedState(
    this.promo,
  );
}

class PromoErrorState extends PromoState {
  final String errorMessage;

  PromoErrorState(
    this.errorMessage,
  );
}
