import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../global/custom_sliver_grid.dart';
import '../../global/product_widget.dart';
import '../controller/favorite_bloc.dart';
import '../controller/favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.favorite.tr())),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        bloc: sl<FavoriteBloc>(),
        // buildWhen: (previous, current) => previous.favorite != current.favorite,
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              CustomSliverGrid(
                itemBuilder: (context, index) => ProductWidget(data: state.favorite[index]),
                itemCount: state.favorite.length,
                crossCount: 2,
              )
            ],
          );
        },
      ),
    );
  }
}
