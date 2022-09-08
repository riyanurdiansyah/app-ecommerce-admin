import 'dart:developer';

import 'package:app_ecommerce_admin/app_constanta.dart';
import 'package:app_ecommerce_admin/app_ecommerce_admin.dart';
import 'package:app_ecommerce_setup/app_ecommerce_setup.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategoryPage extends StatefulWidget {
  const AdminCategoryPage({Key? key}) : super(key: key);

  @override
  State<AdminCategoryPage> createState() => _AdminCategoryPageState();
}

class _AdminCategoryPageState extends State<AdminCategoryPage> {
  final _categoryBloc = CategoryBloc();

  @override
  void initState() {
    super.initState();
    log("INIT CATEGORY");
    Dio dio = Dio();
    Future.delayed(const Duration(seconds: 1), () async {
      final response = await dio.get(
        "http://0.0.0.0:8080/api/v1/categories",
        options: Options(
          validateStatus: (val) {
            return val! < 500;
          },
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
        ),
      );

      print("RESPONSE FETCH ALL CATEGORY : ${response.data}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<CategoryBloc>(
      create: (context) => CategoryBloc()..add(GetAllCategory()),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: size.width / 3,
                    child: TextField(
                      style: AppStyleText.stylePoppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      // controller: dashboardC.searchController,
                      // onChanged: (val) => dashboardC.fnOnSearched(val),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(241, 242, 244, 1),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.2, color: Colors.white),
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
                  ),
                  const Spacer(),
                  SizedBox(
                    width: size.width / 6,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: CustomPopUpMenu(
                              listMenu: List.generate(
                                listSortName.length,
                                (index) => PopupMenuItem(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
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
                                    BlocBuilder<CategoryBloc, CategoryState>(
                                      builder: (_, state) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            "name".tr(),
                                            style: AppStyleText.stylePoppins(
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
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: CustomPopUpMenu(
                              listMenu: List.generate(
                                listSortDate.length,
                                (index) => PopupMenuItem(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
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
                                    BlocBuilder<CategoryBloc, CategoryState>(
                                      builder: (_, state) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            "date".tr(),
                                            style: AppStyleText.stylePoppins(
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    value: true,
                    onChanged: (val) {},
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'image'.tr(),
                        style: AppStyleText.stylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'name'.tr(),
                        style: AppStyleText.stylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'created'.tr(),
                        style: AppStyleText.stylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'updated'.tr(),
                        style: AppStyleText.stylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Status',
                        style: AppStyleText.stylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
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

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({
    Key? key,
    required this.listMenu,
    this.icon,
    this.offset,
  }) : super(key: key);

  final List<PopupMenuEntry> listMenu;
  final Widget? icon;
  final Offset? offset;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      offset: offset ?? const Offset(0, 0),
      itemBuilder: (context) => listMenu,
      icon: icon,
    );
  }
}
