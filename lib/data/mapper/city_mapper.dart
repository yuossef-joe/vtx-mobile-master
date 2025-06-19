import 'package:applocation/app/constants.dart';
import 'package:applocation/data/response/responses/city_responses.dart';
import 'package:applocation/domain/model/models.dart';
extension CityResponseMapper on CityResponse? {
  City toDomain() {
    return City(
      this?.id ?? Constants.zero,
      this?.name ?? Constants.empty,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
    );
  }
}

extension CityDataResponseMapper on CityDataResponse? {
  List<City> toDomain() {
    return this?.cities.map((city) => city.toDomain()).toList() ?? [];
  }
}

extension CityApiResponseMapper on CityApiResponse? {
  CityApi toDomain() {
    return CityApi(

      this?.data.toDomain(),
    );
  }
}
