import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/extension.dart';
import '../../global/custom_image.dart';
import '../components/product_details_component.dart';
import '../components/product_rates_component.dart';
import '../controllers/product_bloc.dart';
import '../controllers/product_events.dart';

class ProductScreen extends StatefulWidget {
  final int productId;
  final String? mainImage;
  const ProductScreen({super.key, required this.productId, this.mainImage});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final bloc = sl<ProductBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc
        ..add(GetProductEvent(widget.productId))
        ..add(GetProductRatesEvent(widget.productId)),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: context.lightColor,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40.h,
                  alignment: AlignmentDirectional.centerEnd,
                  width: 40.h,
                  decoration: BoxDecoration(color: context.primaryColor.withOpacity(0.13), borderRadius: BorderRadius.circular(9.r)),
                  child: Icon(Icons.arrow_back_ios, color: context.primaryColor),
                ).withPadding(start: 16.w).toStart,
              ),
              actions: [
                Container(
                  height: 40.h,
                  alignment: AlignmentDirectional.center,
                  width: 40.h,
                  decoration: BoxDecoration(color: context.primaryColor.withOpacity(0.13), borderRadius: BorderRadius.circular(9.r)),
                  child: Icon(Icons.favorite_border, color: context.primaryColor),
                ).withPadding(end: 16.w).toStart
              ],
              expandedHeight: 322.h,
              flexibleSpace: CustomImage(widget.mainImage, width: context.w, fit: BoxFit.fill),
              pinned: true,
            ),
            const ProductDetailComponent(),
            const ProductRatesComponent(),
          ],
        ),
      ),
    );
  }
}
