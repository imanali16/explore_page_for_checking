import 'package:eventie_client_app/core/domain/entities/category.dart';
import 'package:eventie_client_app/core/domain/entities/enums/language.dart';
import 'package:eventie_client_app/core/domain/entities/enums/partner_tariff.dart';
import 'package:eventie_client_app/core/domain/entities/enums/price_filter.dart';
import 'package:eventie_client_app/core/domain/entities/partner_abbr.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/category.dart';

part 'search_specialists_state.freezed.dart';
@Freezed()
class SearchSpecialistsState with _$SearchSpecialistsState {
  const factory SearchSpecialistsState({
    @Default([]) List<Category> availableCategories,
    @Default([]) List<Category> selectedCategories,
    @Default(0) int currentPage,
    @Default(99) int maxPage,
    @Default([]) List<PartnerTariff> selectedTariffs,
    @Default([]) List<Language> selectedLanguages,
    @Default(PriceFilter.desc) PriceFilter selectedPriceFilter,
    DateTime? selectedDate,
    @Default([]) List<PartnerAbbr> specialists,
  }) = _SearchSpecialistsState;


}
