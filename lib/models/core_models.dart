import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:petz_app/defaults.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class User {
  final String name;
  final String mobile;
  final String email;

  User(this.name, this.mobile, this.email);

  factory User.fromJson(str) {
    if (str == null) return null;
    return User(str["name"], str["phone"], str["email"]);
  }
}

class ListingMedia {
  final File image;
  final String caption;
  final bool isVideo;
  final int durationInSeconds;

  Future<Uint8List> get thumbnail async {
    try {
      final thumb = await VideoThumbnail.thumbnailData(
        video: image.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        quality: 25,
      );
      return thumb;
    } catch (e) {
      return Future.value(null);
    }
  }

  String get durationFormatted {
    if (durationInSeconds == null) {
      return "";
    }
    if (durationInSeconds < 10) return "0$durationInSeconds";
    return "$durationInSeconds";
  }

  String get fileName {
    if (image == null) return null;
    var paths = image.path.split("/");
    if (paths.isNotEmpty) return paths.last;
    return null;
  }

  String get saveDir {
    if (image == null) return null;
    var paths = image.path.split("/");
    if (paths.isNotEmpty) return paths.getRange(0, paths.length - 1).join("/");
    return null;
  }

  ListingMedia(this.image, this.caption,
      {this.isVideo = false, this.durationInSeconds});
}

class ListingLocation {
  final String address;
  final String locality;
  final double latitude;
  final double longitude;

  ListingLocation({this.address, this.locality, this.latitude, this.longitude});

  factory ListingLocation.fromJson(str) {
    if (str == null) return null;
    return ListingLocation(
      address: str["address"],
      latitude: str["latitude"],
      longitude: str["longitude"],
      locality: str["locality"],
    );
  }
}

class PetAttributeType {
  final int id;
  final String title;
  final String type;
  final String unit;
  TextEditingController controller;

  PetAttributeType(
    this.id,
    this.title, {
    this.type,
    this.unit,
    this.controller,
  });

  factory PetAttributeType.fromJson(str) {
    if (str == null) return null;
    return PetAttributeType(
      str["id"],
      str["title"],
      type: str["type"],
      unit: str["unit"],
      controller: TextEditingController(),
    );
  }

  @override
  String toString() {
    return this.title;
  }
}

class PetAttribute {
  PetAttributeType petAttributeType;
  String val;

  set value(data) {
    this.val = data;
  }

  get value {
    if (this.petAttributeType?.unit?.isEmpty ?? true) return this.val;
    return "${this.val} ${this.petAttributeType?.unit}";
  }

  set type(data) {
    this.petAttributeType = data;
  }

  PetAttributeType get type {
    return this.petAttributeType;
  }

  PetAttribute(this.petAttributeType, this.val);

  factory PetAttribute.fromJson(str) {
    if (str == null) return null;
    return PetAttribute(PetAttributeType.fromJson(str["title"]), str["value"]);
  }
}

class ListingAttribute {
  final String title;
  final String value;

  ListingAttribute(this.title, this.value);

  factory ListingAttribute.fromJson(str) {
    if (str == null) return null;
    return ListingAttribute(str["title"], str["attribute"]);
  }
}

class Listing {
  final int id;
  final String slug;
  final String title;
  final String description;
  final String datePosted;
  final double maxPrice;
  final double minPrice;
  final User user;
  final User contactPerson;
  final Breed breed;
  final String gender;
  final String age;

  final List<Media> media;
  final String status;
  final String remarks;
  final int reach;
  final int views;
  final ListingLocation listingLocation;
  final List<ListingAttribute> attributes;

  final bool negotiable;
  final bool transportation;
  final bool vaccinated;
  final bool certificate;

  Listing({
    this.id,
    this.gender,
    this.age,
    this.transportation,
    this.vaccinated,
    this.certificate,
    this.breed,
    this.slug,
    this.title,
    this.description,
    this.datePosted,
    this.maxPrice,
    this.minPrice,
    this.media,
    this.user,
    this.contactPerson,
    this.listingLocation,
    this.attributes,
    this.negotiable,
    this.status,
    this.remarks,
    this.reach,
    this.views,
  });

  String get subTitle {
    var data = [gender, age];
    data.removeWhere((i) => i == null || i.trim().isEmpty);
    return data.join("/");
  }

  String get locationLabel {
    return this.listingLocation?.address ?? "location n/a";
  }

  Media get primaryImage {
    try {
      return media.firstWhere((item) => item.type == "image");
    } catch (e) {
      return null;
    }
  }

  factory Listing.fromJson(str) {
    if (str == null) return null;
    return Listing(
      id: str["id"],
      slug: str["slug"],
      gender: str["gender"],
      age: str["age"],
      transportation: str["transportation"],
      vaccinated: str["vaccinated"],
      certificate: str["certificate"],
      title: str["title"],
      description: str["description"],
      datePosted: str["date_posted"],
      maxPrice: str["max_price"],
      minPrice: str["min_price"],
      user: User.fromJson(str["user"]),
      contactPerson: User.fromJson(str["contact_person"]),
      breed: Breed.fromJson(str["breed"]),
      listingLocation: ListingLocation.fromJson(str["location"]),
      media:
          str["media"]?.map<Media>((item) => Media.fromJson(item))?.toList() ??
              [],
      attributes: str["attributes"]
              ?.map<ListingAttribute>((item) => ListingAttribute.fromJson(item))
              ?.toList() ??
          [],
      negotiable: str["negotiable"],
      status: str["status"],
      remarks: str["remarks"],
      reach: str["reach"],
      views: str["view"],
    );
  }
}

class ListingGroup {
  final String title;
  final List<Listing> items;

  ListingGroup({this.title, this.items});

  factory ListingGroup.fromJson(str) {
    return ListingGroup(
      title: str["title"],
      items: str["data"]
              ?.map<Listing>((item) => Listing.fromJson(item))
              ?.toList() ??
          [],
    );
  }
}

class AnimalCategory {
  final Genus genus;
  final List<Genus> genuses;

  get hasData {
    if (genuses == null) return genuses;
    return genuses.length > 0;
  }

  AnimalCategory(this.genus, this.genuses);

  factory AnimalCategory.fromJson(str) {
    if (str == null) return null;
    return AnimalCategory(
      Genus.fromJson(str),
      str["genus"]?.map<Genus>((item) => Genus.fromJson(item))?.toList(),
    );
  }
}

class Genus {
  final String slug;
  final String name;
  final String image;
  final String info;
  final String link;

  Genus({this.slug, this.name, this.image, this.info, this.link});

  factory Genus.fromJson(str) {
    if (str == null) return null;
    return Genus(
      slug: str["slug"],
      name: str["name"],
      image: str["image"],
      info: str["info"],
      link: str["link"],
    );
  }

  @override
  String toString() {
    return this.name;
  }
}

class Trait {
  final String title;
  final String trait;

  Trait(this.title, this.trait);

  factory Trait.fromJson(str) {
    if (str == null) return null;
    return Trait(str["title"], str["trait"]);
  }
}

class BreedMore {
  final String title;
  final String summary;

  BreedMore(this.title, this.summary);

  factory BreedMore.fromJson(str) {
    if (str == null) return null;
    return BreedMore(str["title"], str["summary"]);
  }
}

class Breed {
  final String slug;
  final String name;
  final int acclaims;
  final String info;
  final String link;
  final Genus genus;
  final BreedMore more;
  final List<Media> media;
  final List<String> specialities;
  final List<Trait> traits;

  Media get primaryImage {
    if (media.length <= 0) return null;
    return media.firstWhere((item) => item.type == "image");
  }

  Breed({
    this.slug,
    this.name,
    this.acclaims,
    this.info,
    this.link,
    this.genus,
    this.media,
    this.more,
    this.specialities,
    this.traits,
  });

  factory Breed.fromJson(str) {
    if (str == null) return null;
    return Breed(
      slug: str["slug"],
      name: str["name"],
      acclaims: str["acclaims"],
      info: str["info"],
      link: str["link"],
      genus: Genus.fromJson(str["genus"]),
      more: BreedMore.fromJson(str["more"]),
      media:
          str["media"]?.map<Media>((item) => Media.fromJson(item))?.toList() ??
              [],
      traits:
          str["traits"]?.map<Trait>((item) => Trait.fromJson(item))?.toList() ??
              [],
      specialities: str["specialities"]?.cast<String>(),
    );
  }

  @override
  String toString() {
    return this.name;
  }
}

class Pet {
  final String slug;
  final String name;
  final String bio;
  final String gender;
  final String dob;
  final String doa;
  final int age;
  final double worth;
  final Breed breed;
  final List<Media> media;
  final List<PetAttribute> attributes;

  get petName {
    return this.name;
  }

  get genderAndAge {
    if (age == null) return "$gender";
    return "${gender?.toUpperCase()} \u2022 $age years";
  }

  Pet({
    this.slug,
    this.name,
    this.bio,
    this.gender,
    this.dob,
    this.doa,
    this.age,
    this.worth,
    this.breed,
    this.media,
    this.attributes,
  });

  Media get primaryImage {
    if (media.length <= 0) return null;
    return media.firstWhere((item) => item.type == "image");
  }

  factory Pet.fromJson(str) {
    if (str == null) return null;
    return Pet(
      slug: str["slug"],
      name: str["name"],
      bio: str["bio"],
      gender: str["gender"],
      dob: str["dob"],
      doa: str["doa"],
      age: str["age"],
      worth: str["worth"],
      breed: Breed.fromJson(str["breed"]),
      media:
          str["media"]?.map<Media>((item) => Media.fromJson(item))?.toList() ??
              [],
      attributes: str["attributes"]
              ?.map<PetAttribute>((item) => PetAttribute.fromJson(item))
              ?.toList() ??
          [],
    );
  }
}

enum ListingMessageStatus { sending, sent, failed }

class ListingMessage {
  final int id;
  final String message;
  final String fileUrl;
  File f;
  final bool sentByOwner;
  final int dateSent;
  final int dateDelivered;
  ListingMessageStatus s;

  File get file => this.f;

  set file(File v) => this.f = v;

  ListingMessageStatus get status => this.s;

  set status(ListingMessageStatus v) => this.s = v;

  ListingMessage({
    this.id,
    this.message,
    this.fileUrl,
    this.f,
    this.sentByOwner,
    this.dateSent,
    this.s,
    this.dateDelivered,
  });

  factory ListingMessage.fromJson(str) {
    if (str == null) return null;
    return ListingMessage(
      id: str["id"],
      sentByOwner: str["sent_by_owner"],
      message: str["message"],
      fileUrl: str["file"],
      dateSent: str["date_sent"]?.toInt(),
      dateDelivered: str["date_delivered"]?.toInt(),
    );
  }

  @override
  String toString() => message == null
      ? fileUrl == null
          ? "<no message>"
          : "Sent a file"
      : message;
}

class ListingConversation {
  final int id;
  final Listing listing;
  final String listingTitle;
  final User sender;
  final User receiver;
  final int dateCreated;
  final int dateUpdated;
  final List<ListingMessage> messages;

  ListingMessage get lastMessage {
    try {
      return messages.first;
    } catch (e) {
      return null;
    }
  }

  ListingConversation({
    this.id,
    this.listing,
    this.sender,
    this.receiver,
    this.messages,
    this.dateCreated,
    this.listingTitle,
    this.dateUpdated,
  });

  factory ListingConversation.fromJson(str) {
    if (str == null) return null;
    return ListingConversation(
      id: str["id"],
      listing: Listing.fromJson(str["listing"]),
      sender: User.fromJson(str["sender"]),
      receiver: User.fromJson(str["receiver"]),
      listingTitle: str["listing_title"],
      dateCreated: str["date_created"]?.toInt(),
      dateUpdated: str["date_updated"]?.toInt(),
      messages: str["messages"]
              ?.map<ListingMessage>((e) => ListingMessage.fromJson(e))
              ?.toList() ??
          [],
    );
  }
}

class NotificationModel {
  final int id;
  final String title;
  final String summary;
  final String category;
  final bool read;
  final int refId;
  final int dateCreated;

  NotificationModel({
    this.id,
    this.title,
    this.summary,
    this.category,
    this.read,
    this.refId,
    this.dateCreated,
  });

  factory NotificationModel.fromJson(str) {
    if (str == null) return null;
    return NotificationModel(
      id: str["id"],
      title: str["title"],
      summary: str["summary"],
      category: str["category"],
      read: str["is_read"],
      refId: str["ref_id"],
      dateCreated: str["date_created"],
    );
  }
}

class Media {
  final String type;
  final String file;
  final String caption;

  Future<String> get thumbnail async {
    try {
      var _dir = await getTemporaryDirectory();
      print("dir");
      print(_dir);
      final thumb = await VideoThumbnail.thumbnailFile(
        video: file,
        thumbnailPath: _dir.path,
        imageFormat: ImageFormat.WEBP,
        maxWidth: 128,
        quality: 25,
      );
      return thumb;
    } catch (e) {
      return Future.value(null);
    }
  }

  Media({this.type, this.file, this.caption});

  factory Media.fromJson(str) {
    if (str == null) return null;
    return Media(
      type: str["type"],
      file: str["file"],
      caption: str["caption"],
    );
  }
}
