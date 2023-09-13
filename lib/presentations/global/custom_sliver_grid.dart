import 'package:flutter/material.dart';

class CustomSliverGrid extends StatelessWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount, crossCount;
  final EdgeInsetsGeometry? itemPadding;
  const CustomSliverGrid({super.key, required this.itemBuilder, required this.itemCount, required this.crossCount, this.itemPadding});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            crossCount,
            (i) => Expanded(
              child: (index * crossCount) + i >= itemCount
                  ? const SizedBox.shrink()
                  : Padding(padding: itemPadding ?? EdgeInsets.zero, child: itemBuilder(context, (index * crossCount) + i)),
            ),
          ),
        ),
        childCount: (itemCount / 2).ceilToDouble().toInt(),
      ),
    );
  }
}
