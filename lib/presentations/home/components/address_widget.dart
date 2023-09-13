import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/extension.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../address/controller/address_bloc.dart';
import '../../address/controller/address_state.dart';
import '../../address/screens/address_screen.dart';

class HomeAddressWidget extends StatelessWidget {
  const HomeAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AddressScreen(),
        ));
      },
      child: BlocBuilder<AddressBloc, AddressState>(
        bloc: sl<AddressBloc>(),
        builder: (context, state) {
          if (state.defaultAddress != null) {
            return Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: LocaleKeys.deliveryTo.tr(),
                    style: context.regular?.copyWith(fontSize: 12, color: context.primaryColor),
                  ),
                  const TextSpan(text: "\n"),
                  TextSpan(
                    text: state.defaultAddress != null ? "شارع الملك فهد - جدة" : "اضف عنوان للتوصيل",
                    style: context.regular?.copyWith(fontSize: 12, color: context.primaryColor),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            );
          } else {
            return Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "لم يتم اضافة عنوان",
                    style: context.regular?.copyWith(fontSize: 12, color: context.primaryColor),
                  ),
                  const TextSpan(text: "\n"),
                  TextSpan(
                    text: "اضف عنوان للتوصيل الان",
                    style: context.regular?.copyWith(fontSize: 12, color: context.primaryColor),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            );
          }
        },
      ),
    );
  }
}
