import 'package:app_ecommerce_setup/styles/app_style_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AdminHeader extends StatelessWidget {
  const AdminHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Image.asset(
                  'assets/image/man.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Riyan Nurdiansyah',
                      style: AppStyleText.stylePoppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Owner',
                      style: AppStyleText.stylePoppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                Container(
                  width: 0.6,
                  color: Colors.grey.shade300,
                  height: 30,
                ),
                const SizedBox(
                  width: 60,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 35,
                    height: 35,
                    child: const Icon(
                      Icons.email_outlined,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 35,
                    height: 35,
                    child: const Icon(
                      Icons.notifications_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      // controller: dashboardC.searchController,
                      // onChanged: (val) => dashboardC.fnOnSearched(val),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(241, 242, 244, 1),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.2, color: Colors.white),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        hintText: 'search_anything'.tr(),
                        hintStyle: AppStyleText.styleLato(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.highlight_remove_rounded,
                          ),
                          onPressed: () {},
                          color: Colors.grey,
                        ),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            Icons.search_rounded,
                          ),
                          onPressed: () {},
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromRGBO(241, 242, 244, 1),
                    ),
                    child: const Icon(
                      Icons.settings_rounded,
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
