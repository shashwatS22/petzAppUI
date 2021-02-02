import 'package:petzapp_ui/models/consultations_models.dart';
import 'package:petzapp_ui/models/service_models.dart';
import 'package:petzapp_ui/models/shop_now_models.dart' as shopNow;

import '../models/core_models.dart';
import '../models/service_models.dart';

class SampleData {
  static User user = User("John Smith", "1234567890", "test@test.com");

  static List<Genus> genuses = [
    Genus(
        name: "Dogs",
        image:
            "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
    Genus(
        name: "Fishes",
        image:
            "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/"),
    Genus(
        name: "Farm Animals",
        image:
            "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/"),
    Genus(
        name: "Small Pets",
        image:
            "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/"),
    Genus(
        name: "Pet Birds",
        image:
            "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
    Genus(
        name: "Cats",
        image:
            "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/"),
    Genus(
        name: "Domestic Birds",
        image:
            "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/"),
    Genus(
        name: "Horses",
        image:
            "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/"),
  ];
  static AnimalCategory animalCategory = AnimalCategory(
      Genus(
          name: "Dog",
          image:
              "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
      genuses);
  static List<AnimalCategory> animalCategoryList = [
    animalCategory,
    animalCategory,
    animalCategory,
    animalCategory,
    animalCategory,
    animalCategory,
    animalCategory,
    animalCategory,
  ];
  static Breed breed = Breed(
    name: "Dog",
    slug: "2 months old | Male",
    traits: [
      Trait("Life expectancy", "10-12 years"),
      Trait("Height", "24-28 inches"),
      Trait("Size", "Medium"),
      Trait("Intelligence", "Very high"),
      Trait("Male", "40-46Kg"),
      Trait("Female", "30-35Kg"),
    ],
    specialities: ["Loyal", "Fearless", "Outgoing", "Alert", "Obedient"],
    genus: Genus(
        name: "Dog",
        image:
            "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/"),
  );
  static List<Breed> breedList = [breed, breed, breed, breed, breed];
  static List<Provider> providers = [
    Provider(
      logo: "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/",
      name: "Service",
      description: "Test service",
    ),
    Provider(
      logo: "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/",
      name: "Service",
      description: "Test service",
    ),
    Provider(
      logo: "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/",
      name: "Service",
      description: "Test service",
    ),
    Provider(
      logo: "pexels.com/photo/two-yellow-labrador-retriever-puppies-1108099/",
      name: "Service",
      description: "Test service",
    ),
  ];
  static List<String> genderFilter = ['Male', 'Female', 'Pair'];
  static List<String> ageFilter = [
    '2 months',
    '3 months',
    '4 months',
    '5 months',
    '6 months',
    '7 months',
    '8 months',
    '9 months'
  ];
  static List<String> moreOptionsFilter = [
    'Vaccinated',
    'Transportation available',
    'Certificate available',
  ];
  static List<ServiceCategory> serviceCategories = [
    ServiceCategory(title: "Grooming"),
    ServiceCategory(title: "Stay"),
    ServiceCategory(title: "Training"),
    ServiceCategory(title: "Vetenarian"),
  ];
  static ServiceHomeData serviceHomeData =
      ServiceHomeData(categories: serviceCategories, providers: providers);
  static List<shopNow.Brand> brandsList = [
    shopNow.Brand(image: "assets/pedigree_logo.png", title: "Pedigree"),
    shopNow.Brand(image: "assets/pedigree_logo.png", title: "Pedigree"),
    shopNow.Brand(image: "assets/pedigree_logo.png", title: "Pedigree"),
    shopNow.Brand(image: "assets/pedigree_logo.png", title: "Pedigree"),
    shopNow.Brand(image: "assets/pedigree_logo.png", title: "Pedigree"),
    shopNow.Brand(image: "assets/pedigree_logo.png", title: "Pedigree"),
  ];
  static List<shopNow.Product> productsList = [
    shopNow.Product(
        primaryImage: "assets/product.png",
        discount: 10,
        price: 800,
        title: "Drools Ocean Fish 4 kg Dry Young Cat Food"),
    shopNow.Product(
        primaryImage: "assets/product.png",
        discount: 10,
        price: 800,
        title: "Drools Ocean Fish 4 kg Dry Young Cat Food"),
    shopNow.Product(
        primaryImage: "assets/product.png",
        discount: 10,
        price: 800,
        title: "Drools Ocean Fish 4 kg Dry Young Cat Food"),
    shopNow.Product(
        primaryImage: "assets/product.png",
        discount: 10,
        price: 800,
        title: "Drools Ocean Fish 4 kg Dry Young Cat Food"),
    shopNow.Product(
        primaryImage: "assets/product.png",
        discount: 10,
        price: 800,
        title: "Drools Ocean Fish 4 kg Dry Young Cat Food"),
    shopNow.Product(
        primaryImage: "assets/product.png",
        discount: 10,
        price: 800,
        title: "Drools Ocean Fish 4 kg Dry Young Cat Food")
  ];
  static List<Pet> petsList = [
    Pet(name: "Beagle", media: [
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
    ]),
    Pet(name: "Beagle", media: [
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
    ]),
    Pet(name: "Beagle", media: [
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
    ]),
    Pet(name: "Beagle", media: [
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
    ]),
    Pet(name: "Beagle", media: [
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
    ]),
    Pet(name: "Beagle", media: [
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
    ]),
    Pet(name: "Beagle", media: [
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
      Media(file: "assets/beagle.jpg"),
    ]),
  ];
  static List<Consultant> consultantList = [
    Consultant(
        photo: "assets/module1.png", rating: 4, name: "Dr. Dale Florence"),
    Consultant(
        photo: "assets/module1.png", rating: 4, name: "Dr. Dale Florence"),
    Consultant(
        photo: "assets/module1.png", rating: 4, name: "Dr. Dale Florence"),
    Consultant(
        photo: "assets/module1.png", rating: 4, name: "Dr. Dale Florence"),
    Consultant(
        photo: "assets/module1.png", rating: 4, name: "Dr. Dale Florence")
  ];
}
