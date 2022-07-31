import 'package:eventie_client_app/core/domain/entities/category.dart';
import 'package:eventie_client_app/core/domain/entities/enums/language.dart';
import 'package:eventie_client_app/core/presentation/dialogs/calendar_dialog.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_cubit.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_state.dart';
import 'package:eventie_client_app/features/explore/presentation/dialogs/specialist_category_selection.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/specialists_filter_language_selection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SpecialistsFilterVerticalScreen extends StatelessWidget {
  const SpecialistsFilterVerticalScreen({Key? key}) : super(key: key);

  String formatDate(BuildContext context, DateTime? dateTime) {
    if (dateTime == null) return "Выберите";
    return DateFormat("MMMMd", AppLocalizations.of(context)?.localeName)
        .format(dateTime);
  }

  String categoriesToString(List<Category> categories) {
    if (categories.isEmpty) return "Все";
    final categoryNames = categories.map((e) => e.name).toList();
    if (categories.length > 2) {
      return categoryNames.getRange(0, 2).join(", ") +
          " и еще ${categories.length - 2}";
    }
    return categoryNames.join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchSpecialistsCubit, SearchSpecialistsState>(
        builder: (context, state) {
      return Container(
        height: double.infinity,
        color: const Color(0xffF4E9D7),
        child: ListView(
          children: [
            Divider(
              color: const Color(0xff1c1c1c).withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Divider(
                  //   color: Color(0xff1c1c1c).withOpacity(0.1),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 31.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Категории',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      specialistCategorySelection(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            categoriesToString(state.selectedCategories),
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                            'assets/images/chevron_right_icon.svg'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 46.0, bottom: 27.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Язык проведения',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff1c1c1c),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SpecialistsFilterLanguageSelection(
                    name: 'Казахский',
                    isSelected: context
                        .read<SearchSpecialistsCubit>()
                        .isLanguageSelected(Language.kk),
                    onTap: () => context
                        .read<SearchSpecialistsCubit>()
                        .languageSelected(Language.kk),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0),
                    child: SpecialistsFilterLanguageSelection(
                      name: 'Русский',
                      isSelected: context
                          .read<SearchSpecialistsCubit>()
                          .isLanguageSelected(Language.ru),
                      onTap: () => context
                          .read<SearchSpecialistsCubit>()
                          .languageSelected(Language.ru),
                    ),
                  ),
                  SpecialistsFilterLanguageSelection(
                    name: 'Английский',
                    isSelected: context
                        .read<SearchSpecialistsCubit>()
                        .isLanguageSelected(Language.en),
                    onTap: () => context
                        .read<SearchSpecialistsCubit>()
                        .languageSelected(Language.en),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 43.0, bottom: 27.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Дата проведения',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff1c1c1c),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () => calendarDialog(
                          context,
                          initialSelectedDate: state.selectedDate,
                          onDateTapped: context
                              .read<SearchSpecialistsCubit>()
                              .dateChanged,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/images/calendar_icon.svg'),
                            Padding(
                              padding: const EdgeInsets.only(left: 9.0),
                              child: Text(
                                formatDate(context, state.selectedDate),
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Lato',
                                  color: Color(0xff1C1C1C),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
