import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core_models.dart';

class Speciality {
  final int id;
  final String title;
  final String description;
  final String icon;

  Speciality({this.id, this.title, this.description, this.icon});

  factory Speciality.fromJson(str) {
    if (str == null) return null;
    return Speciality(
      id: str["id"],
      title: str["title"],
      description: str["description"],
      icon: str["icon"],
    );
  }

  @override
  String toString() {
    return title;
  }
}

class Option {
  final int id;
  final int specialityId;
  final String answer;
  bool selected;

  get isSelected {
    return this.selected;
  }

  set isSelected(bool v) {
    this.selected = v;
  }

  Option(this.id, this.answer, {this.specialityId, this.selected = false});

  factory Option.fromJson(str) {
    if (str == null) return null;
    return Option(
      str["id"],
      str["title"],
      specialityId: str["speciality_id"],
    );
  }
}

class Question {
  final int id;
  final String question;
  final List<Option> options;
  String answer;
  final String hint;
  final TextEditingController controller;

  unSelectAll() {
    options.forEach((item) => item.isSelected = false);
  }

  get input {
    return this.answer;
  }

  set input(String v) {
    this.answer = v;
  }

  get hasAnswer {
    if (options?.isNotEmpty ?? false) {
      return options.indexWhere((item) => item.isSelected == true) > -1;
    }
    if (input?.isNotEmpty ?? false) return true;
    return false;
  }

  Question(
    this.id,
    this.question, {
    this.answer,
    this.hint,
    this.options,
    this.controller,
  });

  factory Question.fromJson(str) {
    if (str == null) return null;
    return Question(
      str["id"],
      str["question"],
      answer: null,
      hint: str["hint"],
      options: str["option"]
              ?.map<Option>((item) => Option.fromJson(item))
              ?.toList() ??
          [],
      controller: TextEditingController(),
    );
  }
}

class TitleSummary {
  final String title;
  final String description;

  TitleSummary(this.title, this.description);

  factory TitleSummary.fromJson(str) {
    if (str == null) return null;
    return TitleSummary(str["title"], str["description"]);
  }
}

class ConsultantEducation {
  final String title;
  final String university;
  final String fromYear;
  final String toYear;

  ConsultantEducation(
      {this.title, this.university, this.fromYear, this.toYear});

  factory ConsultantEducation.fromJson(str) {
    if (str == null) return null;
    return ConsultantEducation(
      title: str["title"],
      university: str["university"],
      fromYear: str["from"],
      toYear: str["to"],
    );
  }
}

class Consultant {
  final String slug;
  final String name;
  final String gender;
  final String medicalId;
  final String speciality;
  final String qualification;
  final String mobile;
  final String status;
  final double rating;
  final int oneStars;
  final int twoStars;
  final int threeStars;
  final int fourStars;
  final int fiveStars;
  final int totalReviews;
  final String photo;
  final bool verified;
  final String experience;

  final List<Speciality> specialities;
  final List<TitleSummary> subSpecialities;
  final List<TitleSummary> animalSpecialities;
  final List<TitleSummary> hospitals;
  final List<TitleSummary> languages;
  final List<ConsultantEducation> qualifications;
  final List<Review> reviews;

  Consultant({
    this.slug,
    this.name,
    this.gender,
    this.medicalId,
    this.mobile,
    this.speciality,
    this.qualification,
    this.status,
    this.rating,
    this.oneStars,
    this.twoStars,
    this.threeStars,
    this.fourStars,
    this.fiveStars,
    this.totalReviews,
    this.photo,
    this.verified,
    this.experience,
    this.specialities,
    this.subSpecialities,
    this.animalSpecialities,
    this.hospitals,
    this.languages,
    this.qualifications,
    this.reviews,
  });

  get subtitle {
    return "$speciality";
  }

  get ratingFormatted {
    if (rating == null) return null;
    return rating.toStringAsFixed(1);
  }

  factory Consultant.fromJson(str) {
    if (str == null) return null;
    print(str["one_stars"]);
    return Consultant(
      slug: str["slug"],
      name: str["name"],
      gender: str["gender"],
      medicalId: str["medical_id"],
      mobile: str["mobile"],
      speciality: str["speciality"],
      qualification: str["qualification"],
      status: str["status"],
      rating: str["rating"],
      oneStars: str["one_stars"],
      twoStars: str["two_stars"],
      threeStars: str["three_stars"],
      fourStars: str["four_stars"],
      fiveStars: str["five_stars"],
      totalReviews: str["total_reviews"],
      photo: str["photo"],
      verified: str["verified"],
      experience: str["experience"],
      specialities: str["specialities"]
              ?.map<Speciality>((item) => Speciality.fromJson(item))
              ?.toList() ??
          [],
      subSpecialities: str["sub_specialities"]
              ?.map<TitleSummary>((item) => TitleSummary.fromJson(item))
              ?.toList() ??
          [],
      animalSpecialities: str["animal_specialities"]
              ?.map<TitleSummary>((item) => TitleSummary.fromJson(item))
              ?.toList() ??
          [],
      hospitals: str["hospitals"]
              ?.map<TitleSummary>((item) => TitleSummary.fromJson(item))
              ?.toList() ??
          [],
      languages: str["languages"]
              ?.map<TitleSummary>((item) => TitleSummary.fromJson(item))
              ?.toList() ??
          [],
      qualifications: str["qualifications"]
              ?.map<ConsultantEducation>(
                  (item) => ConsultantEducation.fromJson(item))
              ?.toList() ??
          [],
      reviews: str["reviews"]
              ?.map<Review>((item) => Review.fromJson(item))
              ?.toList() ??
          [],
    );
  }
}

class Review {
  final String name;
  final int date;
  final String review;
  final int rating;
  final List<int> criteria;

  get hasReview {
    if (review != null && review.isNotEmpty) return true;
    return false;
  }

  Review({
    this.name,
    this.date,
    this.review,
    this.rating,
    this.criteria,
  });

  factory Review.fromJson(str) {
    if (str == null) return null;

    return Review(
      name: str["name"],
      date: str["date"],
      review: str["review"],
      rating: str["rating"],
      criteria: str["criteria"].cast<int>(),
    );
  }
}

class PetCare {
  final Speciality speciality;
  final String title;
  final String summary;
  final String image;

  PetCare({this.speciality, this.title, this.summary, this.image});

  factory PetCare.fromJson(str) {
    if (str == null) return null;
    return PetCare(
      speciality: Speciality.fromJson(str["speciality"]),
      title: str["title"],
      summary: str["summary"],
      image: str["image"],
    );
  }
}

class HealthBanner {
  final String title;
  final String subTitle;
  final String image;
  final String color;
  final String link;

  HealthBanner({this.title, this.subTitle, this.image, this.color, this.link});

  factory HealthBanner.fromJson(str) {
    if (str == null) return null;
    return HealthBanner(
      title: str["title"],
      subTitle: str["subtitle"],
      image: str["image"],
      color: str["color"],
      link: str["link"],
    );
  }
}

class HealthParagraph {
  final String title;
  final String content;
  final List<String> images;

  HealthParagraph({this.title, this.content, this.images});

  factory HealthParagraph.fromJson(str) {
    if (str == null) return null;
    return HealthParagraph(
      title: str["title"],
      content: str["content"],
      images: str["images"].cast<String>(),
    );
  }
}

class HealthTip {
  final String slug;
  final String title;
  final Speciality speciality;
  final List<HealthParagraph> paragraphs;

  get content {
    try {
      return paragraphs.first.content;
    } catch (e) {
      return "";
    }
  }

  get image {
    try {
      var image;
      paragraphs.forEach((item) {
        var i = item.images;
        i.forEach((img) {
          image = img;
          return;
        });
        if (image != null) return;
      });
      return image;
    } catch (e) {
      return null;
    }
  }

  HealthTip({this.slug, this.title, this.speciality, this.paragraphs});

  factory HealthTip.fromJson(str) {
    if (str == null) return null;
    return HealthTip(
      slug: str["slug"],
      title: str["title"],
      speciality: Speciality.fromJson(str["speciality"]),
      paragraphs: str["paragraphs"]
              ?.map<HealthParagraph>((item) => HealthParagraph.fromJson(item))
              ?.toList() ??
          [],
    );
  }
}

class ConsultantHome {
  final List<ConsultantMatch> recent;
  final HealthBanner banner;
  final List<PetCare> petCares;
  final List<HealthTip> tips;

  ConsultantHome({this.recent, this.banner, this.petCares, this.tips});

  factory ConsultantHome.fromJson(str) {
    if (str == null) return null;

    return ConsultantHome(
      banner: HealthBanner.fromJson(str["banner"]),
      recent: str["recent"]
              ?.map<ConsultantMatch>((item) => ConsultantMatch.fromJson(item))
              ?.toList() ??
          [],
      petCares: str["pet_care"]
              ?.map<PetCare>((item) => PetCare.fromJson(item))
              ?.toList() ??
          [],
      tips: str["tips"]
              ?.map<HealthTip>((item) => HealthTip.fromJson(item))
              ?.toList() ??
          [],
    );
  }
}

class ConsultationPackage {
  final int id;
  final String type;
  final String title;
  final String summary;
  final double price;
  final double gst;
  final double inclPrice;
  final double discountPrice;
  final double inclDiscountPrice;
  final int totalDays;
  final int maxConsultations;

  bool get hasDiscount {
    try {
      return this.inclDiscountPrice < this.inclPrice;
    } catch (e) {
      return false;
    }
  }

  ConsultationPackage({
    this.id,
    this.type,
    this.title,
    this.summary,
    this.price,
    this.gst,
    this.inclPrice,
    this.discountPrice,
    this.inclDiscountPrice,
    this.totalDays,
    this.maxConsultations,
  });

  factory ConsultationPackage.fromJson(str) {
    if (str == null) return null;
    return ConsultationPackage(
      id: str["id"],
      type: str["type"],
      title: str["title"],
      summary: str["summary"],
      price: str["price"],
      gst: str["gst"],
      inclPrice: str["incl_price"],
      discountPrice: str["discounted_price"],
      inclDiscountPrice: str["discounted_price_incl"],
      totalDays: str["total_days"],
      maxConsultations: str["max_consultations"],
    );
  }
}

enum MessageStatus { sent, sending, failed }

class ConsultationMessage {
  final int id;
  final bool sentByConsultant;
  final String message;
  final String file;
  final String msgType;
  final int dateSent;
  MessageStatus state;
  final String readStatus;
  final Pet pet;
  bool downloading;

  bool get dLoading {
    return this.downloading ?? false;
  }

  set dLoading(bool v) {
    this.downloading = v;
  }

  bool get isImage {
    if (file == null) return false;
    if (file.endsWith("jpg") || file.endsWith("png") || file.endsWith("gif")) {
      return true;
    }
    return false;
  }

  String get fileName {
    if (file == null) return "";
    try {
      return file.split("/").last;
    } catch (e) {
      return "";
    }
  }

  String get fileType {
    if (file == null) return "UNKNOWN FILE";
    try {
      return "${file.split(".").last} FILE".toUpperCase();
    } catch (e) {
      return "UNKNOWN FILE";
    }
  }

  // IconData get fileIcon {
  //   if (file.endsWith("jpg") || file.endsWith("png") || file.endsWith("gif")) {
  //     return FontAwesomeIcons.fileImage;
  //   }
  //   if (file.endsWith("mp3") || file.endsWith("aac")) {
  //     return FontAwesomeIcons.fileAudio;
  //   }
  //   if (file.endsWith("mp4") || file.endsWith("3gp")) {
  //     return FontAwesomeIcons.fileVideo;
  //   }
  //   if (file.endsWith("pdf")) {
  //     return FontAwesomeIcons.filePdf;
  //   }
  //   if (file.endsWith("doc") || file.endsWith("docx")) {
  //     return FontAwesomeIcons.fileWord;
  //   }
  //   if (file.endsWith("xls") || file.endsWith("xlsx")) {
  //     return FontAwesomeIcons.fileExcel;
  //   }
  //   return FontAwesomeIcons.file;
  // }

  ConsultationMessage({
    this.id,
    this.message,
    this.file,
    this.dateSent,
    this.state,
    this.sentByConsultant,
    this.msgType,
    this.readStatus,
    this.pet,
  });

  get type {
    return this.msgType ?? "text";
  }

  get sentByMe {
    return this.sentByConsultant ?? false;
  }

  get status {
    return this.state ?? MessageStatus.sent;
  }

  set status(v) {
    this.state = v;
  }

  factory ConsultationMessage.fromJson(str) {
    if (str == null) return null;
    return ConsultationMessage(
      id: str["id"],
      message: str["message"],
      file: str["file"],
      dateSent: str["date_sent"],
      sentByConsultant: str["sent_by_consultant"],
      msgType: str["type"],
      readStatus: str["status"],
      pet: Pet.fromJson(str["pet"]),
    );
  }
}

class ReviewCriteria {
  final int id;
  final String title;
  final String icon;
  final String type;
  bool selected;

  bool get isSelected {
    return this.selected ?? false;
  }

  set isSelected(bool v) {
    this.selected = v;
  }

  ReviewCriteria({
    this.id,
    this.title,
    this.icon,
    this.type,
  });

  factory ReviewCriteria.fromJson(str) {
    if (str == null) return null;
    return ReviewCriteria(
      id: str["id"],
      title: str["title"],
      icon: str["icon"],
      type: str["type"],
    );
  }
}

class ConsultantMatch {
  final int id;
  final Consultant consultant;
  final String consultantName;
  final Speciality speciality;
  final String specialityName;
  final Pet pet;
  final String petName;
  final String problem;
  final String state;
  final int dateUpdated;
  final int dateMessaged;
  final int dateEngaged;
  final int dateClosed;
  final int dateOffset;
  final bool followUpAllowed;
  final List<ConsultationMessage> messages;
  Review reviewData;
  final List<ReviewCriteria> criteria;

  get status {
    if (this.state?.toLowerCase() == "match") {
      return "Not started";
    }
    return this.state;
  }

  ConsultationMessage get lastMessage {
    try {
      return messages.first;
    } catch (e) {
      return null;
    }
  }

  Review get review {
    return this.reviewData;
  }

  set review(Review review) {
    this.reviewData = review;
  }

  // get offsetDate {
  //   if (dateOffset != null) return dateOffset;
  //   if (dateOffset == null && dateEngaged != null) {
  //     return dateEngaged + k30daysInMillis;
  //   }
  //   return null;
  // }

  // bool get canFollowUp {
  //   if (followUpAllowed) {
  //     if (offsetDate == null) {
  //       return false;
  //     }
  //     var now = DateTime.now().millisecondsSinceEpoch;
  //     if (now < offsetDate) return true;
  //   }
  //   return false;
  // }

  get statusColor {
    switch (this.state?.toLowerCase()) {
      case "engaged":
        return Colors.green;
      case "declined":
        return Colors.red;
      case "closed":
        return Colors.grey;
      default:
        return Colors.orange;
    }
  }

  ConsultantMatch({
    this.dateMessaged,
    this.dateEngaged,
    this.dateClosed,
    this.dateOffset,
    this.followUpAllowed,
    this.id,
    this.consultant,
    this.consultantName,
    this.speciality,
    this.specialityName,
    this.pet,
    this.petName,
    this.problem,
    this.state,
    this.dateUpdated,
    this.messages,
    this.reviewData,
    this.criteria,
  });

  factory ConsultantMatch.fromJson(str) {
    if (str == null) return null;
    return ConsultantMatch(
      id: str["id"],
      consultant: Consultant.fromJson(str["consultant"]),
      consultantName: str["consultant_name"],
      speciality: Speciality.fromJson(str["speciality"]),
      specialityName: str["speciality_title"],
      pet: Pet.fromJson(str["pet"]),
      petName: str["pet_name"],
      problem: str["problem"],
      state: str["status"],
      dateUpdated: str["date"],
      dateMessaged: str["date_messaged"],
      dateEngaged: str["date_engaged"],
      dateClosed: str["date_closed"],
      dateOffset: str["date_offset"],
      followUpAllowed: str["followup_allowed"],
      messages: str["messages"]
              ?.map<ConsultationMessage>(
                  (item) => ConsultationMessage.fromJson(item))
              ?.toList() ??
          [],
      criteria: str["criteria"]
              ?.map<ReviewCriteria>((item) => ReviewCriteria.fromJson(item))
              ?.toList() ??
          [],
      reviewData: Review.fromJson(str["review"]),
    );
  }
}
