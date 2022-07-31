import 'package:eventie_client_app/core/presentation/dialogs/bottom_paper_dialog.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_cubit.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_state.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/specialists_filter_vertical_screen.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/specialists_search_vertical_screen.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/specialists_vertical_price_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SpecialistsSearchBar extends StatelessWidget {
  const SpecialistsSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchSpecialistsCubit, SearchSpecialistsState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              flex: 8,
              child: InkWell(
                onTap: () {
                  bottomPaperDialog(context,
                      titleText: 'Поиск',
                      builder: (ctx) =>
                          BlocProvider<SearchSpecialistsCubit>.value(
                            value: BlocProvider.of<SearchSpecialistsCubit>(
                                context),
                            child: SpecialistsSearchVerticalScreen(),
                          ));
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    border: Border.all(
                      color: const Color(0xffE5E5E5),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 9.0),
                        child: SvgPicture.asset(
                          'assets/images/search-icon.svg',
                          color: Color(0xff1C1C1C).withOpacity(0.5),
                        ),
                      ),
                      Text(
                        'Поиск по имени/названию',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1C1C1C).withOpacity(0.5),
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/filter-icon.svg',
                  color: state.selectedLanguages.isNotEmpty ||
                          state.selectedDate != null
                      ? const Color(0xFF7CCDD1)
                      : Colors.black,
                ),
                onPressed: () {
                  bottomPaperDialog(context,
                      titleText: 'Фильтры',
                      rightIcon: (_) => Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
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
                      builder: (ctx) =>
                          BlocProvider<SearchSpecialistsCubit>.value(
                            value: BlocProvider.of<SearchSpecialistsCubit>(
                                context),
                            child: SpecialistsFilterVerticalScreen(),
                          ));
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: SvgPicture.asset('assets/images/group-icon.svg'),
                onPressed: () {
                  specialistsVerticalPriceFilter(
                    context,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
