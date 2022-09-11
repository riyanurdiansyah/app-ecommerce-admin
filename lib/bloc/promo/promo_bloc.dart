import 'package:app_ecommerce_admin/models/promo_m.dart';
import 'package:app_ecommerce_admin/repositories_impl/promo_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'promo_event.dart';
part 'promo_state.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  final _promoRepository = PromoRepositoryImpl();

  PromoBloc() : super(PromoInitial()) {
    on<GetAllPromo>(_getAllPromo);
  }

  void _getAllPromo(event, emit) async {
    emit(PromoLoadingState());
    try {
      final response = await _promoRepository.getAllPromo();
      if (response.error.isEmpty) {
        emit(PromoLoadedState(response));
      } else {
        emit(PromoErrorState(response.error));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "ERROR : ${e.toString()}");
      emit(PromoErrorState(e.toString()));
    }
  }
}
