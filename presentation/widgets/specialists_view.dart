import 'package:eventie_client_app/core/presentation/widgets/scroll_pagination.dart';
import 'package:eventie_client_app/core/presentation/widgets/loader_widget.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_cubit.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_state.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/specialist_profie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialistsView extends StatelessWidget {
  const SpecialistsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchSpecialistsCubit, SearchSpecialistsState>(
      builder: (context, state) {
        return state.specialists.isEmpty
            ? const LoaderWidget()
            : ScrollPagination(
          showLoadingIndicator: state.currentPage != state.maxPage,
              onScrollEnded: (context) => context.read<SearchSpecialistsCubit>().getSpecialists(),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.specialists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: SpecialistProfileCard(
                        partner: state.specialists[index],
                      ),
                    );
                  },
                ),
            );
      },
    );
  }
}
