import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_basket/gen/assets.gen.dart';

import '../../../core/utils/extension.dart';
import '../../../domain/entities/address.dart';
import '../../global/custom_image.dart';

class AddressItemList extends StatelessWidget {
  final Address data;
  const AddressItemList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: context.primaryColor),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.type,
                    ),
                    Text(
                      data.location,
                    ),
                  ],
                ),
              ),
              CustomImage(Assets.svg.deleteIcon),
              CustomImage(Assets.svg.editIcon),
            ],
          ),
          if (data.decription != null)
            Text(
              data.decription!,
            ),
          Text(
            data.phone,
          ),
        ],
      ),
    );
  }
}
