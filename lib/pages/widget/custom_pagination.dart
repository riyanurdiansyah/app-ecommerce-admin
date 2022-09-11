import 'package:app_ecommerce_setup/styles/app_style_text.dart';
import 'package:flutter/material.dart';

class CustomPagination extends StatelessWidget {
  const CustomPagination({
    Key? key,
    required this.onTapNext,
    required this.onTapPrev,
    required this.onTapPage,
    required this.lastpage,
    required this.page,
  }) : super(key: key);

  final VoidCallback onTapNext;
  final VoidCallback onTapPrev;
  final VoidCallback onTapPage;
  final int lastpage;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => onTapPrev(),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade200,
            ),
            child: Row(
              children: List.generate(
                lastpage,
                (index) => InkWell(
                  onTap: () => onTapPage(),
                  child: Container(
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index + 1 == page
                          ? Colors.blue.shade300
                          : Colors.grey.shade200,
                    ),
                    child: Text(
                      "${index + 1}",
                      style: AppStyleText.stylePoppins(
                        fontSize: 12,
                        color: index + 1 == page
                            ? Colors.white
                            : Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          InkWell(
            onTap: () => onTapNext(),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
