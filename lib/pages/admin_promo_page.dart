import 'package:app_ecommerce_admin/admin_constanta.dart';
import 'package:app_ecommerce_admin/bloc/promo/promo_bloc.dart';
import 'package:app_ecommerce_admin/pages/widget/promo_row.dart';
import 'package:app_ecommerce_setup/app_ecommerce_setup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/custom_popup_menu.dart';

class AdminPromoPage extends StatelessWidget {
  const AdminPromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<PromoBloc>(
      create: (context) => PromoBloc()..add(GetAllPromo()),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Promo",
                        style: AppStyleText.styleAbeezee(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.post_add_rounded,
                          color: Colors.blue,
                          size: 20,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Add Data',
                            style: AppStyleText.stylePoppins(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Container(
                        height: 2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Container(
                        height: 4,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              width: double.infinity,
              child: Row(
                children: [
                  BlocBuilder<PromoBloc, PromoState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 40,
                        width: size.width / 3,
                        child: TextField(
                          style: AppStyleText.stylePoppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          // onChanged: (val) => context
                          //     .read<PromoBloc>()
                          //     .add(OnSearchByName(val)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(241, 242, 244, 1),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0.2, color: Colors.grey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0.2, color: Colors.grey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0.2, color: Colors.white),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            hintText: 'Search Promo by Name',
                            hintStyle: AppStyleText.styleLato(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.highlight_remove_rounded,
                                size: 18,
                              ),
                              onPressed: () {},
                              color: Colors.grey,
                            ),
                            prefixIcon: IconButton(
                              icon: const Icon(
                                Icons.search_rounded,
                                size: 18,
                              ),
                              onPressed: () {},
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: size.width / 6,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: BlocBuilder<PromoBloc, PromoState>(
                              builder: (context, state) {
                                return CustomPopUpMenu(
                                  listMenu: List.generate(
                                    listSortName.length,
                                    (index) => PopupMenuItem(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.abc_rounded,
                                            size: 16,
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            listSortName[index].title!,
                                            style: AppStyleText.stylePoppins(
                                              fontSize: 14,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  icon: Container(
                                    height: 55,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.abc_rounded,
                                          size: 18,
                                          color: Colors.grey.shade400,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        BlocBuilder<PromoBloc, PromoState>(
                                          builder: (_, state) {
                                            // final PromoBloc =
                                            //     context.read<PromoBloc>();
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Text(
                                                "name".tr(),
                                                style:
                                                    AppStyleText.stylePoppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey.shade400,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.expand_more_rounded,
                                          size: 16,
                                          color: Colors.grey.shade400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  offset: const Offset(-10, 50),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: BlocBuilder<PromoBloc, PromoState>(
                              builder: (context, state) {
                                return CustomPopUpMenu(
                                  listMenu: List.generate(
                                    listSortDate.length,
                                    (index) => PopupMenuItem(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.date_range_rounded,
                                            size: 16,
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            listSortDate[index].title!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  icon: Container(
                                    height: 55,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.date_range_rounded,
                                          size: 16,
                                          color: Colors.grey.shade400,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        BlocBuilder<PromoBloc, PromoState>(
                                          builder: (context, state) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Text(
                                                "date".tr(),
                                                style:
                                                    AppStyleText.stylePoppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey.shade400,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.expand_more_rounded,
                                          size: 16,
                                          color: Colors.grey.shade400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  offset: const Offset(-10, 50),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PromoRow(
              isHeader: true,
              image: 'image'.tr(),
              name: 'name'.tr(),
              created: 'created'.tr(),
              updated: 'updated'.tr(),
              status: 'Status',
              description: 'Description',
              expired: 'Expired',
              kodepromo: 'Kode Promo',
            ),
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder<PromoBloc, PromoState>(
                    builder: (context, state) {
                      if (state is PromoLoadedState) {
                        return Column(
                          children: List.generate(
                            state.promo.data?.length ?? 0,
                            (i) => PromoRow(
                              isHeader: false,
                              description: state.promo.data![i].description!,
                              expired: state.promo.data![i].expired.toString(),
                              kodepromo: state.promo.data![i].kodePromo!,
                              image: state.promo.data![i].image!,
                              name: state.promo.data![i].name!,
                              created: DateFormat.yMMMMd('id').format(
                                  DateTime.parse(
                                      state.promo.data![i].createdAt!)),
                              updated: DateFormat.yMMMMd('id').format(
                                  DateTime.parse(
                                      state.promo.data![i].updatedAt!)),
                              status: state.promo.data![i].status.toString(),
                            ),
                          ),
                        );
                      } else if (state is PromoErrorState) {
                        return Text(
                          state.errorMessage,
                          style: AppStyleText.stylePoppins(
                            fontSize: 18,
                            color: Colors.grey.shade400,
                          ),
                        );
                      } else {
                        return Container(
                          height: 300,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
