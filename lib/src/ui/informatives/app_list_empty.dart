// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppListEmpty extends StatelessWidget {
  const AppListEmpty({
    required this.message,
    this.isCentered = true,
    super.key,
  });

  final String message;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    final Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.manage_search,
          size: 60,
          color: Styles.primary,
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 198, 198, 198),
            ),
          ),
        ),
      ],
    );

    return isCentered ? Center(child: content) : content;
  }
}
