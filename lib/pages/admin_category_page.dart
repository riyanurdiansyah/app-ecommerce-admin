import 'package:app_ecommerce_admin/admin_constanta.dart';
import 'package:app_ecommerce_admin/app_ecommerce_admin.dart';
import 'package:app_ecommerce_setup/app_ecommerce_setup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/category_row.dart';
import 'widget/custom_popup_menu.dart';

class AdminCategoryPage extends StatelessWidget {
  const AdminCategoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<CategoryBloc>(
      create: (context) => CategoryBloc()..add(GetAllCategory(1)),
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
                        "all_category".tr(),
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
                            'add_data'.tr(),
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
                  BlocBuilder<CategoryBloc, CategoryState>(
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
                          //     .read<CategoryBloc>()
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
                            hintText: 'search_category'.tr(),
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
                            child: BlocBuilder<CategoryBloc, CategoryState>(
                              builder: (context, state) {
                                return CustomPopUpMenu(
                                  listMenu: List.generate(
                                    listSortName.length,
                                    (index) => PopupMenuItem(
                                      onTap: () {
                                        context.read<CategoryBloc>().add(
                                              OnSortByName(
                                                isAscending: listSortName[index]
                                                        .sortBy ==
                                                    'asc',
                                                index: index,
                                                type: listSortName[index].type!,
                                              ),
                                            );
                                      },
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
                                        BlocBuilder<CategoryBloc,
                                            CategoryState>(
                                          builder: (_, state) {
                                            final categoryBloc =
                                                context.read<CategoryBloc>();
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Text(
                                                categoryBloc
                                                        .sortNameText.isEmpty
                                                    ? "name".tr()
                                                    : categoryBloc.sortNameText,
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
                            child: BlocBuilder<CategoryBloc, CategoryState>(
                              builder: (context, state) {
                                return CustomPopUpMenu(
                                  listMenu: List.generate(
                                    listSortDate.length,
                                    (index) => PopupMenuItem(
                                      onTap: () {
                                        context.read<CategoryBloc>().add(
                                              OnSortByName(
                                                isAscending: listSortDate[index]
                                                        .sortBy ==
                                                    'asc',
                                                index: index,
                                                type: listSortDate[index].type!,
                                              ),
                                            );
                                      },
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
                                        BlocBuilder<CategoryBloc,
                                            CategoryState>(
                                          builder: (context, state) {
                                            final categoryBloc =
                                                context.read<CategoryBloc>();
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Text(
                                                categoryBloc
                                                        .sortDateText.isEmpty
                                                    ? "date".tr()
                                                    : categoryBloc.sortDateText,
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
            CategoryRow(
              isHeader: true,
              image: 'image'.tr(),
              name: 'name'.tr(),
              created: 'created'.tr(),
              updated: 'updated'.tr(),
              status: 'Status',
            ),
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryLoadedState) {
                        return Column(
                          children: List.generate(
                            state.category.data.length,
                            (i) => CategoryRow(
                              isHeader: false,
                              image: state.category.data[i].image,
                              name: state.category.data[i].name,
                              created: DateFormat.yMMMMd('id').format(
                                  DateTime.parse(
                                      state.category.data[i].createdAt)),
                              updated: DateFormat.yMMMMd('id').format(
                                  DateTime.parse(
                                      state.category.data[i].updatedAt)),
                              status: state.category.data[i].status.toString(),
                            ),
                          ),
                        );
                      } else if (state is CategoryErrorState) {
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
                  // BlocBuilder<CategoryBloc, CategoryState>(
                  //   builder: (context, state) {
                  //     return CustomPagination(
                  //       onTapPage: () {},
                  //       onTapNext: () => context.read<CategoryBloc>().add(
                  //             OnNextPrevPage(true),
                  //           ),
                  //       onTapPrev: () => context.read<CategoryBloc>().add(
                  //             OnNextPrevPage(false),
                  //           ),
                  //       lastpage: context.read<CategoryBloc>().lastPage,
                  //       page: context.read<CategoryBloc>().page,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
