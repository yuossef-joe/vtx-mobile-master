import 'package:applocation/data/response/responses.dart';
import 'package:json_annotation/json_annotation.dart';
part 'booking_response.g.dart';

@JsonSerializable()
class BookResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "guests")
  int guests;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "time")
  String time;
  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "Book_id")
  String bookId;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "place_id")
  int placeId;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;
  BookResponse(
    this.id,
    this.guests,
    this.gender,
    this.time,
    this.date,
    this.bookId,
    this.userId,
    this.placeId,
    this.createdAt,
    this.updatedAt,
  );
  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookResponseToJson(this);
}

@JsonSerializable()
class BookingListResponse {
  @JsonKey(name: "books")
  List<BookResponse> books;
  BookingListResponse(this.books);
  factory BookingListResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookingListResponseToJson(this);
}

@JsonSerializable()
class BookingApiResponse extends BaseResponse {
  @JsonKey(name: "data")
  BookingListResponse data;
  BookingApiResponse(this.data);
  factory BookingApiResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookingApiResponseToJson(this);
}

@JsonSerializable()
class PlaceBookingFeats{
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "games")
  final String games;
  @JsonKey(name: "projector")
  final String projector;
  @JsonKey(name: "taxes")
  final String taxes;
  @JsonKey(name: "place_id")
  final int placeId;
  PlaceBookingFeats(this.id,this.games,this.projector,this.taxes,this.placeId);

  factory PlaceBookingFeats.fromJson(Map<String, dynamic> json) =>
      _$PlaceBookingFeatsFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceBookingFeatsToJson(this);

}
@JsonSerializable()
class PlaceBookingInfo  {
  @JsonKey(name: "book_id")
  final String bookId;
  @JsonKey(name: "PAX")
  final int pax;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "feats")
  final PlaceBookingFeats? feats;
  PlaceBookingInfo(this.bookId,this.pax,this.status,this.feats);

  factory PlaceBookingInfo.fromJson(Map<String, dynamic> json) =>
      _$PlaceBookingInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceBookingInfoToJson(this);
}

@JsonSerializable()
class PlaceBookingNest  {
  @JsonKey(name: "msg")
  final String msg;
  @JsonKey(name: "info")
  final PlaceBookingInfo info;

  PlaceBookingNest(this.msg,this.info);

  factory PlaceBookingNest.fromJson(Map<String, dynamic> json) =>
      _$PlaceBookingNestFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceBookingNestToJson(this);
}


@JsonSerializable()
class PlaceBookingApiResponse extends BaseResponse {
  @JsonKey(name: "data")
  PlaceBookingNest data;
  PlaceBookingApiResponse(this.data);
  factory PlaceBookingApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceBookingApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceBookingApiResponseToJson(this);
}
