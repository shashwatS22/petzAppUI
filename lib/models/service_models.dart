import 'dart:developer';

import 'core_models.dart';

class ServiceCategory {
  final String slug;
  final String title;
  final String type;
  final String description;
  final String image;

  ServiceCategory({
    this.slug,
    this.title,
    this.type,
    this.image,
    this.description,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> str) {
    if (str == null) return null;
    return ServiceCategory(
      slug: str["slug"],
      title: str["title"],
      type: str["type"],
      description: str["description"],
      image: str["icon"],
    );
  }

  @override
  String toString() {
    return {
      this.title: this.image,
    }.toString();
  }
}

class ServiceHomeData {
  final List<ServiceCategory> categories;
  final List<Provider> providers;

  ServiceHomeData({this.categories, this.providers});

  factory ServiceHomeData.fromJson(str) {
    if (str == null) return null;
    return ServiceHomeData(
      categories: str["items"]
              ?.map<ServiceCategory>((item) => ServiceCategory.fromJson(item))
              ?.toList() ??
          [],
      providers: str["services"]
              ?.map<Provider>((item) => Provider.fromJson(item))
              ?.toList() ??
          [],
    );
  }
}

class Venue {
  final String type;
  final int capacity;

  Venue({this.type, this.capacity});

  factory Venue.fromJson(str) {
    if (str == null) return null;
    return Venue(type: str["type"], capacity: str["capacity"]);
  }
}

class OpenHour {
  final int day;
  final String start;
  final String end;
  final bool isToday;

  OpenHour({this.day, this.start, this.end, this.isToday});

  factory OpenHour.fromJson(str) {
    if (str == null) return null;
    return OpenHour(
      day: str["day"],
      start: str["start"],
      end: str["end"],
      isToday: str["is_today"],
    );
  }

  @override
  String toString() {
    return "$day";
  }
}

class Policy {
  final String title;
  final String link;

  Policy({this.title, this.link});

  factory Policy.fromJson(str) {
    if (str == null) return null;
    return Policy(title: str["title"], link: str["link"]);
  }
}

class Amenity {
  final String title;
  final String icon;
  final String description;

  Amenity({this.title, this.icon, this.description});

  factory Amenity.fromJson(str) {
    if (str == null) return null;
    return Amenity(
      title: str["title"],
      icon: str["icon"],
      description: str["description"],
    );
  }
}

class ServiceType {
  final String slug;
  final String name;
  final String description;
  final String icon;

  ServiceType({this.slug, this.name, this.description, this.icon});

  factory ServiceType.fromJson(str) {
    if (str == null) return null;
    return ServiceType(
      slug: str["slug"],
      name: str["name"],
      description: str["description"],
      icon: str["icon"],
    );
  }

  @override
  String toString() {
    return this.name;
  }
}

class ProviderMedia {
  final String type;
  final String file;
  final String caption;

  ProviderMedia(this.type, this.file, this.caption);

  factory ProviderMedia.fromJson(str) {
    if (str == null) return null;
    return ProviderMedia(
      str["type"],
      str["file"],
      str["caption"],
    );
  }
}

class ServiceOrPackage {
  final int id;
  final String name;
  final String summary;
  final String description;
  final String icon;
  final double price;
  final double usualPrice;
  final bool isPackage;
  final ServiceType serviceType;
  final List<ServiceOrPackage> included;

  get discount {
    if (usualPrice == null || price == null) return 0;
    if (usualPrice > price) return usualPrice - price;
    return 0;
  }

  ServiceOrPackage({
    this.summary,
    this.isPackage,
    this.serviceType,
    this.included,
    this.id,
    this.name,
    this.description,
    this.icon,
    this.price,
    this.usualPrice,
  });

  factory ServiceOrPackage.fromJson(str) {
    if (str == null) return null;
    return ServiceOrPackage(
      id: str["id"],
      name: str["name"],
      description: str["description"],
      summary: str["summary"],
      isPackage: str["is_package"],
      serviceType: ServiceType.fromJson(str["category"]),
      included: str["services"]
              ?.map<ServiceOrPackage>((item) => ServiceOrPackage.fromJson(item))
              ?.toList() ??
          [],
      icon: str["image"],
      price: str["price"],
      usualPrice: str["usual_price"],
    );
  }

  @override
  String toString() {
    return this.name;
  }
}

class RequestItem {
  final int id;
  final int quantity;
  final num amount;
  final ServiceOrPackage serviceOrPackage;

  RequestItem({this.id, this.quantity, this.amount, this.serviceOrPackage});

  factory RequestItem.fromJson(str) {
    if (str == null) return null;
    return RequestItem(
      id: str["id"],
      quantity: str["quantity"],
      amount: str["amount"],
      serviceOrPackage: ServiceOrPackage.fromJson(str["service"]),
    );
  }

  @override
  String toString() {
    return serviceOrPackage?.name ?? "";
  }
}

class ServiceRequest {
  final int id;
  final Provider provider;
  final Pet pet;
  final num amount;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final int dateCreated;
  final int dateUpdated;
  final bool homeService;
  final List<RequestItem> items;
  String state;

  String get status => this.state;

  set status(String v) => this.state = v;

  ServiceRequest({
    this.id,
    this.provider,
    this.pet,
    this.amount,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.dateCreated,
    this.dateUpdated,
    this.homeService,
    this.items,
    this.state,
  });

  // String get timeLabel {
  //   String value = "";
  //   if (startTime != null) {
  //     value += startTime.timeStr;
  //   }
  //   if (startDate != null) {
  //     if (value.trim().isNotEmpty) value += " ";
  //     value += startDate.dateStr;
  //   }
  //   if (endDate != null && endTime != null) {}
  //   return value;
  // }

  String get serviceLabels {
    try {
      return items.join(", ");
    } catch (e) {
      return "";
    }
  }

  factory ServiceRequest.fromJson(str) {
    if (str == null) return null;
    return ServiceRequest(
      id: str["id"],
      provider: Provider.fromJson(str["provider"]),
      pet: Pet.fromJson(str["pet"]),
      amount: str["amount"],
      startDate: str["start_date"],
      startTime: str["start_time"],
      endDate: str["end_date"],
      endTime: str["end_time"],
      dateCreated: str["date_created"],
      dateUpdated: str["date_updated"],
      homeService: str["home_service"],
      state: str["status"],
      items: str["items"]
              ?.map<RequestItem>((item) => RequestItem.fromJson(item))
              ?.toList() ??
          [],
    );
  }
}

class OrderItem {
  final String title;
  final ServiceOrPackage serviceOrPackage;
  final num inclPrice;
  final num exclPrice;
  final int quantity;
  final String status;
  final String statusRemark;
  final String date;

  OrderItem({
    this.title,
    this.serviceOrPackage,
    this.inclPrice,
    this.exclPrice,
    this.quantity,
    this.status,
    this.statusRemark,
    this.date,
  });

  factory OrderItem.fromJson(str) {
    if (str == null) return null;
    return OrderItem(
      title: str["title"],
      serviceOrPackage: ServiceOrPackage.fromJson(str["service"]),
      inclPrice: str["incl_price"],
      exclPrice: str["excl_price"],
      quantity: str["quantity"],
      status: str["status"],
      statusRemark: str["status_remark"],
      date: str["date_modified"],
    );
  }
}

class Order {
  final String number;
  final num exclPriceWODiscount;
  final num inclPriceWODiscount;
  final num exclPrice;
  final num inclPrice;
  final String paymentMode;
  final String paymentMethod;
  final String status;
  final String statusRemark;
  final String itemLabel;
  final String datePlaced;
  final String dateModified;
  final Pet pet;
  final String petName;
  final Provider provider;
  final String providerName;
  final List<OrderItem> items;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;

  Order({
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.number,
    this.exclPriceWODiscount,
    this.inclPriceWODiscount,
    this.exclPrice,
    this.inclPrice,
    this.paymentMode,
    this.paymentMethod,
    this.status,
    this.statusRemark,
    this.itemLabel,
    this.datePlaced,
    this.dateModified,
    this.pet,
    this.petName,
    this.provider,
    this.providerName,
    this.items,
  });

  // String get timeLabel {
  //   String value = "";
  //   if (startTime != null) {
  //     value += startTime.timeStr;
  //   }
  //   if (startDate != null) {
  //     if (value.trim().isNotEmpty) value += " ";
  //     value += startDate.dateStr;
  //   }
  //   if (endDate != null && endTime != null) {}
  //   return value;
  // }

  factory Order.fromJson(str) {
    if (str == null) return null;
    return Order(
      number: str["number"],
      startDate: str["start_date"],
      startTime: str["start_time"],
      endDate: str["end_date"],
      endTime: str["end_time"],
      exclPriceWODiscount: str["total_excl_before_discount"],
      inclPriceWODiscount: str["total_incl_before_discount"],
      inclPrice: str["total_incl_price"],
      exclPrice: str["total_excl_price"],
      paymentMode: str["payment_mode"],
      paymentMethod: str["payment_method"],
      status: str["status"],
      statusRemark: str["status_remark"],
      itemLabel: str["label"],
      datePlaced: str["date_placed"],
      dateModified: str["date_modified"],
      pet: Pet.fromJson(str["pet"]),
      petName: str["pet_name"],
      provider: Provider.fromJson(str["provider"]),
      providerName: str["provider_name"],
      items: str["items"]
              ?.map<OrderItem>((e) => OrderItem.fromJson(e))
              ?.toList() ??
          [],
    );
  }
}

class PendingService {
  final List<ServiceRequest> requests;
  final List<Order> orders;

  PendingService({this.requests, this.orders});

  factory PendingService.fromJson(str) {
    if (str == null) return null;
    return PendingService(
      requests: str["requests"]
              ?.map<ServiceRequest>((e) => ServiceRequest.fromJson(e))
              ?.toList() ??
          [],
      orders:
          str["bookings"]?.map<Order>((e) => Order.fromJson(e))?.toList() ?? [],
    );
  }
}

class BookingPackage {
  final ServiceOrPackage serviceOrPackage;
  bool selected;

  set isSelected(bool v) {
    this.selected = v;
  }

  get isSelected {
    if (this.selected == null) return false;
    return this.selected;
  }

  @override
  String toString() {
    return this.serviceOrPackage.toString();
  }

  BookingPackage(this.serviceOrPackage, this.selected);
}

class OpenHourLabel {
  final String title;
  final String summary;
  final bool open;

  OpenHourLabel(this.title, this.summary, this.open);
}

class Provider {
  final String slug;
  final String parent;
  final String name;
  final String description;
  final String tagline;
  final String address;
  final double rating;
  final String logo;
  final List<ServiceCategory> categories;
  final List<ProviderMedia> media;

  final List<BookingPackage> services;
  final List<BookingPackage> packages;
  final List<Policy> policies;
  final List<Amenity> amenities;
  final Venue venue;
  final List<OpenHour> openHours;

  DateTime _onlyTime(DateTime dateTime) {
    return DateTime(
        1990, 1, 1, dateTime.hour, dateTime.minute, dateTime.second, 0, 0);
  }

  ServiceCategory get category {
    if (this.categories.isEmpty) return null;
    return this.categories.first;
  }

  String dayName(int day) {
    return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][day];
  }

  OpenHourLabel get todaysHours {
    try {
      var hour = openHours.firstWhere((item) => item.isToday);
      var start = DateTime.parse("1990-01-01 ${hour?.start}:00");
      var end = DateTime.parse("1990-01-01 ${hour?.end}:00");
      var now = _onlyTime(DateTime.now());
      if (now.isAfter(start) && now.isBefore(end)) {
        return OpenHourLabel("Open now", "closes ${hour.end}", true);
      } else {
        var index = openHours.indexOf(hour);
        var nextOpen = index + 1;
        if (openHours.length - 1 == index) {
          nextOpen = 0;
        }
        return OpenHourLabel(
          "Closed now",
          "Opens: ${openHours[nextOpen].start} ${dayName(openHours[nextOpen].day)}",
          false,
        );
      }
    } catch (e) {
      var index =
          openHours.indexWhere((item) => item.day > DateTime.now().weekday);

      var nextOpen = index + 1;
      if (openHours.length - 1 == index) {
        nextOpen = 0;
      }
      if (openHours.length <= nextOpen)
        return OpenHourLabel(
          "Closed now",
          "n/a",
          false,
        );
      return OpenHourLabel(
        "Closed now",
        "Opens: ${openHours[nextOpen].start} ${dayName(openHours[nextOpen].day)}",
        false,
      );
    }
  }

  int get typeCount {
    var type = "";
    int count = 0;
    media.forEach((item) {
      if (item.type != type) {
        count += 1;
        type = item.type;
      }
    });

    return count;
  }

  int get interiorIndex {
    return media.indexWhere((item) => item.type == "interior");
  }

  int get exteriorIndex {
    return media.indexWhere((item) => item.type == "exterior");
  }

  int get utilityIndex {
    return media.indexWhere((item) => item.type == "utility");
  }

  int get videoIndex {
    return media.indexWhere((item) => item.type == "video");
  }

  int get interiorIndexLast {
    return media.lastIndexWhere((item) => item.type == "interior") + 1;
  }

  int get exteriorIndexLast {
    return media.lastIndexWhere((item) => item.type == "exterior") + 1;
  }

  int get utilityIndexLast {
    return media.lastIndexWhere((item) => item.type == "utility") + 1;
  }

  int get videoIndexLast {
    return media.lastIndexWhere((item) => item.type == "video") + 1;
  }

  Provider({
    this.slug,
    this.parent,
    this.name,
    this.description,
    this.categories,
    this.tagline,
    this.address,
    this.rating,
    this.logo,
    this.services,
    this.packages,
    this.media,
    this.venue,
    this.openHours,
    this.policies,
    this.amenities,
  });

  String get serviceLabel {
    if (this.services?.isEmpty ?? false) return "";
    return services?.take(2)?.toList()?.join(", ") ?? "";
  }

  int get servicesCount {
    if ((this.services?.length ?? 0) > 2) return this.services.length - 2;
    return 0;
  }

  String get tagLine {
    if (this.tagline == null) return "";
    return this.tagline;
  }

  factory Provider.fromJson(str) {
    if (str == null) return null;

    return Provider(
      slug: str["slug"],
      parent: str["parent"],
      name: str["name"],
      description: str["description"],
      tagline: str["tagline"],
      address: str["address"],
      rating: str["rating"],
      logo: str["logo"],
      categories: str["category"]
              ?.map<ServiceCategory>((item) => ServiceCategory.fromJson(item))
              ?.toList() ??
          [],
      venue: Venue.fromJson(str["venue"]),
      openHours: str["hours"]
              ?.map<OpenHour>((item) => OpenHour.fromJson(item))
              ?.toList() ??
          [],
      policies: str["policies"]
              ?.map<Policy>((item) => Policy.fromJson(item))
              ?.toList() ??
          [],
      amenities: str["amenities"]
              ?.map<Amenity>((item) => Amenity.fromJson(item))
              ?.toList() ??
          [],
      services: str["services"]
              ?.map<BookingPackage>((item) =>
                  BookingPackage(ServiceOrPackage.fromJson(item), false))
              ?.toList() ??
          [],
      packages: str["packages"]
              ?.map<BookingPackage>((item) =>
                  BookingPackage(ServiceOrPackage.fromJson(item), false))
              ?.toList() ??
          [],
      media: str["media"]
              ?.map<ProviderMedia>((item) => ProviderMedia.fromJson(item))
              ?.toList() ??
          [],
    );
  }
}
