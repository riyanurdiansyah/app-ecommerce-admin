import 'package:app_ecommerce_admin/models/sort_m.dart';
import 'package:app_ecommerce_setup/app_ecommerce_setup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'models/sidebar_m.dart';

List<SidebarM> listSidebar = [
  SidebarM(
    title: "Home",
    icon: Icons.home_rounded,
    route: AppRouteName.home,
  ),
  SidebarM(
    title: "Category",
    icon: Icons.dock_rounded,
    route: AppRouteName.category,
  ),
  SidebarM(
    title: "Profile",
    icon: Icons.person_rounded,
    route: AppRouteName.profile,
  ),
];

List<SortM> listSortDate = [
  SortM(
    title: "latest".tr(),
    type: "date",
    sortBy: "asc",
  ),
  SortM(
    title: "longest".tr(),
    type: "date",
    sortBy: "desc",
  ),
];

List<SortM> listSortName = [
  SortM(
    title: "A ~ z",
    type: "name",
    sortBy: "asc",
  ),
  SortM(
    title: "Z ~ a",
    type: "name",
    sortBy: "desc",
  ),
];
