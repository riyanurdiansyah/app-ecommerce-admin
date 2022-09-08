import 'package:app_ecommerce_admin/models/sort_m.dart';
import 'package:app_ecommerce_setup/app_ecommerce_setup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'models/sidebar_m.dart';

const String baseurl = "http://localhost:8080/api/v1";

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
    title: "date".tr(),
    type: "date",
  ),
  SortM(
    title: "latest".tr(),
    type: "latest",
  ),
  SortM(
    title: "longest".tr(),
    type: "longest",
  ),
];

List<SortM> listSortTitle = [
  SortM(
    title: "name".tr(),
    type: "name",
  ),
  SortM(
    title: "A ~ z",
    type: "asc",
  ),
  SortM(
    title: "Z ~ a",
    type: "desc",
  ),
];
