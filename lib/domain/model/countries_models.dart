class Country {
  final int id;
  final String name;
  final String image;


  Country(
      this.id,
      this.name,
      this.image,

      );
}

class CountryDataModel {
  final List<Country>? countries;

  CountryDataModel(this.countries);
}


class CountriesModel {
  final CountryDataModel? data;

  CountriesModel(this.data);
}