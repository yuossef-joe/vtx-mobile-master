

import 'package:applocation/data/mapper/mapper.dart';
import 'package:applocation/domain/model/models.dart';

import '../../domain/model/countries_models.dart';
import '../response/responses/country_responses.dart';

extension CountryResponseMapper on CountryResponse? {
  Country toDomain() {
    return Country(
      this?.id ?? 0,
      this?.name ?? '',
      this?.image ?? ''
    );
  }
}

extension CountryDataResponseMapper on CountryDataResponse? {
  CountryDataModel toDomain() {
    return CountryDataModel(
      (this?.countries.map((country) => country.toDomain()) ??
          const Iterable.empty())
          .cast<Country>()
          .toList(),
    );


  }
}

extension CountryApiResponseMapper on CountriesApiResponse? {
  CountriesModel toDomain() {
    return CountriesModel(
      this?.data.toDomain(),
    );
  }
}


extension DestinationResponseMapper on HomeDestinationResponse?
{
  HomeDestinationData toDomain(){
    return HomeDestinationData(
        (this?.categories?.map?.categories?.map((categories)=>categories.toDomain())??const Iterable.empty()).cast<Category>().toList(),
      this?.destination?.toDomain()
    );
  }

}

