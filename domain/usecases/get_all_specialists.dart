import 'package:dartz/dartz.dart';
import 'package:eventie_client_app/core/domain/entities/category.dart';
import 'package:eventie_client_app/core/domain/entities/enums/language.dart';
import 'package:eventie_client_app/core/domain/entities/enums/partner_tariff.dart';
import 'package:eventie_client_app/core/domain/entities/enums/price_filter.dart';
import 'package:eventie_client_app/core/domain/entities/pageable.dart';
import 'package:eventie_client_app/core/domain/entities/partner_abbr.dart';
import 'package:eventie_client_app/core/domain/service/partners_service.dart';
import 'package:eventie_client_app/core/domain/usecases/usecase.dart';
import 'package:eventie_client_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetAllSpecialists
    extends UseCase<Pageable<PartnerAbbr>, GetExplorePartnersParams> {
  GetAllSpecialists(this.service);

  final PartnersService service;

  @override
  Future<Either<Failure, Pageable<PartnerAbbr>>> call(params) =>
      service.getExplorePartners(
        params.pageNumber,
        params.categories,
        params.tariffs,
        params.languages,
        params.priceFilter,
        params.dateTime,
      );
}

class GetExplorePartnersParams {
  final int pageNumber;
  final List<Language> languages;
  final List<PartnerTariff> tariffs;
  final List<Category> categories;
  final PriceFilter priceFilter;
  final DateTime? dateTime;

  GetExplorePartnersParams(this.pageNumber, this.categories, this.languages,
      this.tariffs, this.priceFilter, this.dateTime);
}
