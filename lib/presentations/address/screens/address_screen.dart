import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_basket/presentations/address/components/address_list_item.dart';
import 'package:fruit_basket/presentations/address/controller/address_bloc.dart';

import '../../../core/services/service_locator.dart';
import '../controller/address_state.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final bloc = sl<AddressBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("العناوين")),
      body: BlocBuilder<AddressBloc, AddressState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.addressess.isNotEmpty) {
            return ListView.builder(
              itemCount: state.addressess.length,
              itemBuilder: (context, index) => AddressItemList(data: state.addressess[index]),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
