import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/bottom_titles.dart';

class XpansionTile extends StatelessWidget {
  const XpansionTile(
      {super.key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      this.trailing,
      this.children});

  final String text, text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstants.kBkLight,
        borderRadius: BorderRadius.circular(AppConstants.kRadius),
      ),
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: BottomTitles(text: text, text2: text2),
            tilePadding: EdgeInsets.zero,
            onExpansionChanged: onExpansionChanged,
            controlAffinity: ListTileControlAffinity.trailing,
            trailing: trailing,
            children: children ?? [],
          )),
    );
  }
}
