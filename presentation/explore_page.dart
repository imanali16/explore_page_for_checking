import 'package:eventie_client_app/core/presentation/widgets/eventie_label_view.dart';
import 'package:eventie_client_app/core/presentation/widgets/navigation_bar_view.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_cubit.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/specialists_search_bar.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/specialists_tariff_selection_row.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/specialists_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ExplorePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const EventieLabelView(),
      ),
      body: const ExplorePageMain(),
      bottomNavigationBar: const NavigationBarView(),
    );
  }
}

class ExplorePageMain extends StatelessWidget {
  const ExplorePageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchSpecialistsCubit>(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: const [
            SpecialistsSearchBar(),
            SpecialistsTariffSelectionRow(),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Партнеры: все',
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1C1C1C),
                  ),
                ),
              ),
            ),
            Expanded(child: SpecialistsView()),
          ],
        ),
      ),
    );
  }
}