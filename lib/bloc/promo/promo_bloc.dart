import 'package:app_ecommerce_admin/src/core/error/failures.dart';
import 'package:app_ecommerce_admin/src/data/datasources/remote/promo_remote_datasource_impl.dart';
import 'package:app_ecommerce_admin/src/domain/entities/promo_entity.dart';
import 'package:app_ecommerce_admin/src/domain/repositories/promo_repository_impl.dart';
import 'package:app_ecommerce_admin/src/domain/usecase/promo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'promo_event.dart';
part 'promo_state.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  final bool _isError = false;
  bool get isError => _isError;

  final promoUsecase =
      PromoUseCase(PromoRepositoryImpl(PromoRemoteDataSourceImpl()));
  PromoBloc() : super(PromoInitial()) {
    on<GetAllPromo>(_getAllPromo);
  }

  void _getAllPromo(event, emit) async {
    emit(PromoLoadingState());
    final response = await promoUsecase.getAllPromo();
    response.fold(
      (Failure failure) {
        if (failure is HttpFailure) {
          if (!_isError) {
            return Fluttertoast.showToast(
                msg: 'Error ${failure.code}x ${failure.message}');
          }
        } else {
          emit(PromoErrorState(failure.toString()));
        }
      },
      (PromoEntity promo) {
        emit(PromoLoadedState(promo));
      },
    );
  }
}
