import 'package:app_ecommerce_setup/app_ecommerce_setup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PromoRow extends StatelessWidget {
  const PromoRow({
    Key? key,
    required this.isHeader,
    required this.image,
    required this.name,
    required this.created,
    required this.updated,
    required this.status,
    required this.description,
    required this.kodepromo,
    required this.expired,
  }) : super(key: key);

  final bool isHeader;
  final String image;
  final String name;
  final String description;
  final String kodepromo;
  final String expired;
  final String created;
  final String updated;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isHeader ? 50 : 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue.shade100 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            value: true,
            onChanged: (val) {},
          ),
          const SizedBox(
            width: 16,
          ),
          isHeader
              ? Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 60,
                  child: Text(
                    image,
                    style: AppStyleText.stylePoppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isHeader
                          ? Colors.blue.shade500
                          : Colors.grey.shade500,
                    ),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(
                    "$baseUrl$image",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
          const SizedBox(
            width: 40,
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                name,
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                kodepromo,
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                isHeader
                    ? expired
                    : DateFormat.yMMMMd('id').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            int.parse(expired))),
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: Text(
          //       created,
          //       style: AppStyleText.stylePoppins(
          //         fontSize: 14,
          //         fontWeight: FontWeight.w500,
          //         color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: Text(
          //       updated,
          //       style: AppStyleText.stylePoppins(
          //         fontSize: 14,
          //         fontWeight: FontWeight.w500,
          //         color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                isHeader
                    ? status
                    : status == "1"
                        ? "Aktif"
                        : "Non-Aktif",
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader
                      ? Colors.blue.shade500
                      : status == "1"
                          ? Colors.green.shade500
                          : Colors.red.shade500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
