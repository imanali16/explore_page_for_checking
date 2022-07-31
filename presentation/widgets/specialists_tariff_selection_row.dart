import 'package:eventie_client_app/core/domain/entities/enums/partner_tariff.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_cubit.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_state.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/tariff_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialistsTariffSelectionRow extends StatelessWidget {
  const SpecialistsTariffSelectionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchSpecialistsCubit, SearchSpecialistsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 24.0),
          child: Row(
            children: [
              TariffSelection(
                text: 'Все',
                isSelected: context
                    .read<SearchSpecialistsCubit>()
                    .isTariffSelected(PartnerTariff.all),
                onTap: () => context
                    .read<SearchSpecialistsCubit>()
                    .tariffSelected(PartnerTariff.all),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TariffSelection(
                  text: 'Комфорт',
                  isSelected: context
                      .read<SearchSpecialistsCubit>()
                      .isTariffSelected(PartnerTariff.comfort),
                  onTap: () => context
                      .read<SearchSpecialistsCubit>()
                      .tariffSelected(PartnerTariff.comfort),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TariffSelection(
                  text: 'Премиум',
                  isSelected: context
                      .read<SearchSpecialistsCubit>()
                      .isTariffSelected(PartnerTariff.premium),
                  onTap: () => context
                      .read<SearchSpecialistsCubit>()
                      .tariffSelected(PartnerTariff.premium),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TariffSelection(
                  text: 'Люкс',
                  isSelected: context
                      .read<SearchSpecialistsCubit>()
                      .isTariffSelected(PartnerTariff.lux),
                  onTap: () => context
                      .read<SearchSpecialistsCubit>()
                      .tariffSelected(PartnerTariff.lux),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
