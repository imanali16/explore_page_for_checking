import 'package:eventie_client_app/core/domain/entities/enums/price_filter.dart';
import 'package:eventie_client_app/core/presentation/dialogs/actions_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/cubit/responsive_size.dart';
import '../cubit/search_specialists_cubit.dart';

Future<void> specialistsVerticalPriceFilter(BuildContext context) {
  return actionsDialog(
    context,
    showCancelButton: false,
    titleText: 'Стоимость услуг',
    actionsBuilder: (ctx) => [
      TextButton(
        onPressed: ()=> context
            .read<SearchSpecialistsCubit>()
            .priceSelected(PriceFilter.asc),
        child: Text(
          ('По возрастанию цены'),
          style: TextStyle(
              color: const Color(0xFF1C1C1C),
              fontSize: RespSize.of(context).average(15),
              height: 18 / 15,
              fontWeight: FontWeight.w400),
        ),
      ),
      TextButton(
        onPressed: () => context
            .read<SearchSpecialistsCubit>()
            .priceSelected(PriceFilter.desc),
        child: Text(
          ('По убыванию цены'),
          style: TextStyle(
              color: const Color(0xFF1C1C1C),
              fontSize: RespSize.of(context).average(15),
              height: 18 / 15,
              fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}
