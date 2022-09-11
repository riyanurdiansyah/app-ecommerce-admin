import 'package:app_ecommerce_admin/admin_constanta.dart';
import 'package:app_ecommerce_admin/app_ecommerce_admin.dart';
import 'package:app_ecommerce_admin/pages/admin_category_page.dart';
import 'package:app_ecommerce_admin/pages/widget/sidebar.dart';
import 'package:app_ecommerce_setup/app_ecommerce_setup.dart';
import 'package:flutter/material.dart';

import 'widget/admin_header.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({Key? key, this.route}) : super(key: key);

  final String? route;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blueGrey.shade100,
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 2,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          // drawer: const CustomSidebar(),
          body: Row(
            children: [
              if (!AppResponsive.isMobileWeb(context))
                Expanded(
                  flex: 1,
                  child: CustomSidebar(
                    route: route!,
                  ),
                ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    const AdminHeader(),
                    Expanded(
                      child: IndexedStack(
                        index: listSidebar.indexWhere(
                          (e) => e.route.contains(route!),
                        ),
                        children: [
                          const AdminHomePage(),
                          AdminCategoryPage(),
                          Container(
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
