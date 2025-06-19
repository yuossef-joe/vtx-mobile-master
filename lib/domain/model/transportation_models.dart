class NearByTransportationModel {
  final List<Transportation> transportations;

  NearByTransportationModel(this.transportations);
}

class Transportation {
  final int id;
  final String image;
  final String name;
  final String location;
  final String price;
  final String latitude;
  final String longitude;
  final int categoryId;
  final int distance;

  Transportation(
    this.id,
    this.image,
    this.name,
    this.location,
    this.price,
    this.latitude,
    this.longitude,
    this.categoryId,
    this.distance,
  );
}
