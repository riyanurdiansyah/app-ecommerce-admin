import 'package:app_ecommerce_admin/app_constanta.dart';
import 'package:app_ecommerce_admin/app_ecommerce_admin.dart';
import 'package:app_ecommerce_admin/models/sort_m.dart';
import 'package:app_ecommerce_setup/app_ecommerce_setup.dart';
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
    _categoryBloc.add(GetAllCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 40,
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
                ),
                const Expanded(
                  flex: 5,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: DropdownButtonFormField<SortM>(
                            icon: const SizedBox(),
                            style: AppStyleText.stylePoppins(
                              fontSize: 12,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: const Icon(
                                Icons.date_range_rounded,
                                size: 16,
                              ),
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            value: listSortTitle[0],
                            items: List.generate(
                              listSortTitle.length,
                              (index) => DropdownMenuItem<SortM>(
                                value: listSortTitle[index],
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    listSortTitle[index].title!,
                                    style: AppStyleText.stylePoppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onChanged: (val) {},
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: DropdownButtonFormField<SortM>(
                            icon: const SizedBox(),
                            style: AppStyleText.stylePoppins(
                              fontSize: 12,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: const Icon(
                                Icons.date_range_rounded,
                                size: 16,
                              ),
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            value: listSortDate[0],
                            items: List.generate(
                              listSortDate.length,
                              (index) => DropdownMenuItem<SortM>(
                                value: listSortDate[index],
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    listSortDate[index].title!,
                                    style: AppStyleText.stylePoppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onChanged: (val) {},
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
    );
  }
}
