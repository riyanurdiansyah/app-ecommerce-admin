import 'package:app_ecommerce_admin/bloc/promo/promo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPromoPage extends StatelessWidget {
  const AdminPromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromoBloc>(
      create: (context) => PromoBloc()..add(GetAllPromo()),
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
