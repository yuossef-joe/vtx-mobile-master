// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) => BookResponse(
      (json['id'] as num).toInt(),
      (json['guests'] as num).toInt(),
      json['gender'] as String,
      json['time'] as String,
      json['date'] as String,
      json['Book_id'] as String,
      (json['user_id'] as num).toInt(),
      (json['place_id'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
    );

Map<String, dynamic> _$BookResponseToJson(BookResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guests': instance.guests,
      'gender': instance.gender,
      'time': instance.time,
      'date': instance.date,
      'Book_id': instance.bookId,
      'user_id': instance.userId,
      'place_id': instance.placeId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

BookingListResponse _$BookingListResponseFromJson(Map<String, dynamic> json) =>
    BookingListResponse(
      (json['books'] as List<dynamic>)
          .map((e) => BookResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingListResponseToJson(
        BookingListResponse instance) =>
    <String, dynamic>{
      'books': instance.books,
    };

BookingApiResponse _$BookingApiResponseFromJson(Map<String, dynamic> json) =>
    BookingApiResponse(
      BookingListResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$BookingApiResponseToJson(BookingApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

PlaceBookingFeats _$PlaceBookingFeatsFromJson(Map<String, dynamic> json) =>
    PlaceBookingFeats(
      (json['id'] as num).toInt(),
      json['games'] as String,
      json['projector'] as String,
      json['taxes'] as String,
      (json['place_id'] as num).toInt(),
    );

Map<String, dynamic> _$PlaceBookingFeatsToJson(PlaceBookingFeats instance) =>
    <String, dynamic>{
      'id': instance.id,
      'games': instance.games,
      'projector': instance.projector,
      'taxes': instance.taxes,
      'place_id': instance.placeId,
    };

PlaceBookingInfo _$PlaceBookingInfoFromJson(Map<String, dynamic> json) =>
    PlaceBookingInfo(
      json['book_id'] as String,
      (json['PAX'] as num).toInt(),
      json['status'] as String,
      json['feats'] == null
          ? null
          : PlaceBookingFeats.fromJson(json['feats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceBookingInfoToJson(PlaceBookingInfo instance) =>
    <String, dynamic>{
      'book_id': instance.bookId,
      'PAX': instance.pax,
      'status': instance.status,
      'feats': instance.feats,
    };

PlaceBookingNest _$PlaceBookingNestFromJson(Map<String, dynamic> json) =>
    PlaceBookingNest(
      json['msg'] as String,
      PlaceBookingInfo.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceBookingNestToJson(PlaceBookingNest instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'info': instance.info,
    };

PlaceBookingApiResponse _$PlaceBookingApiResponseFromJson(
        Map<String, dynamic> json) =>
    PlaceBookingApiResponse(
      PlaceBookingNest.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$PlaceBookingApiResponseToJson(
        PlaceBookingApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
