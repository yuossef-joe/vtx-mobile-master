
class PlaceBookingFeatsModel {
  final int id;
  final String games;
  final String projector;
  final String taxes;
  final int placeId;

  PlaceBookingFeatsModel(
      this.id,
      this.games,
      this.projector,
      this.taxes,
      this.placeId,
      );
}

class PlaceBookingInfoModel {
  final String bookId;
  final int pax;
  final String status;
  final PlaceBookingFeatsModel? feats;

  PlaceBookingInfoModel(
      this.bookId,
      this.pax,
      this.status,
      this.feats,
      );
}

class PlaceBookingNestModel {
  final String msg;
  final PlaceBookingInfoModel? nest;

  PlaceBookingNestModel(this.nest,this.msg);
}

class PlaceBookingModel {
  final PlaceBookingNestModel? data;

  PlaceBookingModel(this.data);
}
