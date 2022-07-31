import 'dart:async';

import 'package:eventie_client_app/core/domain/entities/category.dart';
import 'package:eventie_client_app/core/domain/entities/enums/language.dart';
import 'package:eventie_client_app/core/domain/entities/enums/partner_tariff.dart';
import 'package:eventie_client_app/core/domain/entities/enums/price_filter.dart';
import 'package:eventie_client_app/core/domain/usecases/get_all_categories.dart';
import 'package:eventie_client_app/core/domain/usecases/usecase.dart';
import 'package:eventie_client_app/core/error/failures.dart';
import 'package:eventie_client_app/features/explore/domain/usecases/get_all_specialists.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchSpecialistsCubit extends Cubit<SearchSpecialistsState> {
  SearchSpecialistsCubit(
    this.getAllSpecialists,
    this.getAllCategoriesUseCase,
  ) : super( const SearchSpecialistsState()) {
    getSpecialists();
    getCategories();
  }

  final GetAllSpecialists getAllSpecialists;
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  Future<void> getSpecialists() async {
    if (state.currentPage == state.maxPage) return;
    final result = await getAllSpecialists(
      GetExplorePartnersParams(
        state.currentPage,
        state.selectedCategories,
        state.selectedLanguages,
        state.selectedTariffs,
        state.selectedPriceFilter,
        state.selectedDate,
      ),
    );
    result.fold(
      (failure) {
        failure = failure as ServerFailure;
      },
      (pageable) => emit(
        state.copyWith(
          currentPage: state.currentPage + 1,
          maxPage: pageable.totalPages,
          specialists: state.specialists + pageable.content,
        ),
      ),
    );
  }

  Future<void> getCategories() async {
    if (state.availableCategories.isNotEmpty) return;
    final result = await getAllCategoriesUseCase(NoParams());
    result.fold(
      (l) => null,
      (categories) => emit(
        state.copyWith(
          availableCategories: categories,
        ),
      ),
    );
  }

  Future<void> getFilteredSpecialists() async {
    final result = await getAllSpecialists(
      GetExplorePartnersParams(
        0,
        state.selectedCategories,
        state.selectedLanguages,
        state.selectedTariffs,
        state.selectedPriceFilter,
        state.selectedDate,
      ),
    );
    result.fold(
      (failure) {
        failure = failure as ServerFailure;
      },
      (pageable) => emit(
        state.copyWith(
          currentPage: 1,
          maxPage: pageable.totalPages,
          specialists: pageable.content,
        ),
      ),
    );
  }

  Future<void> categoriesSelected(List<Category> categories) async {
    emit(state.copyWith(
      selectedCategories: categories,
    ));
    getFilteredSpecialists();
  }

  Future<void> languageSelected(Language language) async {
    final _selectedLanguages = List.of(state.selectedLanguages);
    if (_selectedLanguages.contains(language)) {
      _selectedLanguages.remove(language);
    } else {
      _selectedLanguages.add(language);
    }
    emit(state.copyWith(
      selectedLanguages: _selectedLanguages,
    ));
    getFilteredSpecialists();
  }

  bool isLanguageSelected(Language language) =>
      state.selectedLanguages.contains(language);

  Future<void> tariffSelected(PartnerTariff tariff) async {
    if (tariff == PartnerTariff.all) {
      if (state.selectedTariffs.isEmpty) return;
      emit(state.copyWith(
        selectedTariffs: [],
      ));
    } else {
      final _selectedTariffs = List.of(state.selectedTariffs);
      if (_selectedTariffs.contains(tariff)) {
        _selectedTariffs.remove(tariff);
      } else {
        _selectedTariffs.add(tariff);
      }
      emit(state.copyWith(
        selectedTariffs: _selectedTariffs,
      ));
    }
    getFilteredSpecialists();
  }

  bool isTariffSelected(PartnerTariff tariff) {
    if (tariff == PartnerTariff.all) {
      return state.selectedTariffs.isEmpty;
    }
    return state.selectedTariffs.contains(tariff);
  }

  Future<void> priceSelected(PriceFilter priceFilter) async {
    emit(state.copyWith(
      selectedPriceFilter: priceFilter,
    ));
    getFilteredSpecialists();
  }


  Future<void> dateChanged(DateTime dateTime) async {
    emit(state.copyWith(
      selectedDate: dateTime,
    ));
    getFilteredSpecialists();
  }
}
