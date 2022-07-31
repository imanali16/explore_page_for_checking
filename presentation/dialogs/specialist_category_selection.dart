import 'package:eventie_client_app/core/presentation/dialogs/bottom_paper_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/search_specialists_cubit.dart';
import '../widgets/specialists_filter_speciality_selection.dart';

Future<void> specialistCategorySelection(BuildContext context) {
  final state = context.read<SearchSpecialistsCubit>().state;
  print(state.availableCategories);
  return bottomPaperDialog(
    context,
    titleText: 'Категории',
    rightIcon: (_) => Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {},
          child: Text(
            'Сбросить',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                color: Color(0xff1c1c1c)),
          ),
        )),
    builder: (ctx) => SpecialistsFilterSpecialitySelection(
      availableCategories: state.availableCategories,
      initiallySelectedCategories: state.selectedCategories,
      onCategoriesSelected:
          context.read<SearchSpecialistsCubit>().categoriesSelected,
    ),
  );
}
