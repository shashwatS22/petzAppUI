class FilterCategory {
  final Category category;
  final List<FilterCategory> categories;
  bool selected;

  get isSelected {
    return this.selected;
  }

  set isSelected(selected) {
    this.selected = selected;
  }

  FilterCategory(this.category, this.selected, this.categories);
}

class FilterBrand {
  final Brand brand;
  bool selected;

  get isSelected {
    return this.selected;
  }

  set isSelected(selected) {
    this.selected = selected;
  }

  FilterBrand(this.brand, this.selected);
}

class SpotLight {
  final int id;
  final String image;
  final String title;
  final String description;
  final String url;

  SpotLight({this.id, this.image, this.title, this.description, this.url});

  factory SpotLight.fromJson(Map<String, dynamic> str) {
    return SpotLight(
      id: str["id"],
      image: str["image"],
      title: str["title"],
      description: str["summary"],
      url: str["url"],
    );
  }
}

class Category {
  final int id;
  final String slug;
  final String title;
  final String description;
  final String image;
  final String url;
  final List<Category> categories;

  Category({
    this.id,
    this.slug,
    this.title,
    this.image,
    this.description,
    this.url,
    this.categories,
  });

  factory Category.fromJson(Map<String, dynamic> str) {
    return Category(
      id: str["id"],
      slug: str["slug"],
      title: str["title"],
      description: str["description"],
      image: str["icon"],
      url: str["url"],
      categories: str["children"]
              ?.map<Category>((cat) => Category.fromJson(cat))
              ?.toList() ??
          [],
    );
  }

  @override
  String toString() {
    return {
      this.title: this.image,
    }.toString();
  }
}

class Brand {
  final int id;
  final String slug;
  final String title;
  final String description;
  final String image;
  final String url;

  Brand({
    this.id,
    this.slug,
    this.title,
    this.image,
    this.description,
    this.url,
  });

  factory Brand.fromJson(Map<String, dynamic> str) {
    return Brand(
      id: str["id"],
      slug: str["slug"],
      title: str["title"],
      description: str["description"],
      image: str["logo"],
      url: str["url"],
    );
  }
}

class Stock {
  final int id;
  final Seller seller;
  final String sellerSKU;
  final double priceExclTax;
  final double priceInclTax;
  final double taxApplicable;
  final double retailPrice;
  final double costPrice;
  final int numInStock;
  final int returnAbleIn;

  Stock({
    this.id,
    this.seller,
    this.sellerSKU,
    this.priceExclTax,
    this.priceInclTax,
    this.taxApplicable,
    this.retailPrice,
    this.costPrice,
    this.numInStock,
    this.returnAbleIn,
  });

  get discount {
    if (retailPrice != null) {
      return retailPrice - priceInclTax;
    }
    return 0;
  }

  factory Stock.fromJson(Map<String, dynamic> str) {
    return Stock(
      id: str["id"],
      seller: Seller.fromJson(str["seller"]),
      sellerSKU: str["seller_sku"],
      priceExclTax: str["price_excl_tax"],
      priceInclTax: str["price_incl_tax"],
      taxApplicable: str["tax_application"],
      retailPrice: str["retail_price"],
      costPrice: str["cost_price"],
      numInStock: str["num_in_stock"],
      returnAbleIn: str["returnable_in"],
    );
  }
}

class DynamicString {
  final String text;
  final String link;

  DynamicString(this.text, this.link);

  @override
  String toString() {
    return text;
  }
}

enum AddressType { SHIPPING, BILLING }
enum AddressLabel { HOME, WORK, OTHER }

class UserAddress {
  final int id;
  final String labelName;
  final String flatNumber;
  final String landmark;
  final String pincode;
  final String name;
  final String mobile;
  final String address;
  final double latitude;
  final double longitude;
  final String instruction;
  final bool isDefautShipping;
  final bool isDefaultBilling;

  UserAddress({
    this.id,
    this.labelName,
    this.address,
    this.latitude,
    this.longitude,
    this.name,
    this.mobile,
    this.flatNumber,
    this.instruction,
    this.isDefaultBilling,
    this.isDefautShipping,
    this.landmark,
    this.pincode,
  });

  factory UserAddress.fromJson(Map<String, dynamic> str) {
    return UserAddress(
      id: str["id"],
      labelName: str["label"],
      name: str["person"],
      mobile: str["mobile"],
      flatNumber: str["flat_number"],
      pincode: str["pincode"],
      address: str["address"],
      landmark: str["landmark"],
      longitude: str["longitude"],
      latitude: str["latitude"],
      instruction: str["instruction"],
      isDefautShipping: str["default_shipping_address"],
      isDefaultBilling: str["default_billing_address"],
    );
  }
}

class User {
  final int id;
  final String name;
  final String mobile;
  final String email;
  final String gender;
  final String picture;
  final int numOfOrders;

  User(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.gender,
      this.picture,
      this.numOfOrders});

  factory User.fromJson(Map<String, dynamic> str) {
    return User(
      id: str["id"],
      name: str["name"],
      mobile: str["mobile"],
      email: str["email"],
      gender: str["gender"],
      picture: str["picture"],
      numOfOrders: str["num_orders"],
    );
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final double rating;
  final int totalReviews;
  final String code;
  final String primaryImage;
  bool inWishlist;
  final List<String> images;
  final double price;
  final Variant variant;
  final List<Stock> stocks;
  final double discount;
  final String url;
  final List<String> variants;

  Product({
    this.id,
    this.title,
    this.code,
    this.description,
    this.rating,
    this.totalReviews,
    this.images,
    this.price,
    this.discount,
    this.primaryImage,
    this.inWishlist,
    this.variant,
    this.variants,
    this.stocks,
    this.url,
  });

  get desc {
    if (description == null) return null;
    if (description.trim().isEmpty) return null;
    return description;
  }

  get lowestStock {
    if (stocks.length > 0) {
      return stocks.reduce((a, b) => a.priceExclTax < b.priceExclTax ? a : b);
    }
    return null;
  }

  get isInWishList {
    return inWishlist;
  }

  set isInWishList(bool value) {
    inWishlist = value;
  }

  factory Product.fromJson(Map<String, dynamic> str) {
    return Product(
      id: str["id"],
      title: str["title"],
      description: str["description"],
      rating: str["rating"],
      totalReviews: str["total_reviews"],
      code: str["code"],
      inWishlist: str["in_wishlist"],
      primaryImage: str["primary_image"],
      images: str["images"]?.cast<String>(),
      variants: str["variants"]?.cast<String>(),
      price: str["min_price"],
      discount: str["discount"],
      url: str["url"],
      variant: str["variant"] != null ? Variant.fromJson(str["variant"]) : null,
      stocks:
          str["stocks"]?.map<Stock>((item) => Stock.fromJson(item))?.toList() ??
              [],
    );
  }
}

class Variant {
  final String variantType;
  final List<VariantItem> items;

  Variant({this.variantType, this.items});

  factory Variant.fromJson(Map<String, dynamic> str) {
    return Variant(
      variantType: str["type"],
      items: str["items"]
              ?.map<VariantItem>((item) => VariantItem.fromJson(item))
              ?.toList() ??
          [],
    );
  }
}

class VariantItem {
  final int id;
  final String code;
  final String name;
  final List<String> images;
  final List<Stock> stocks;
  final Variant variant;

  get primaryImage {
    if (images.length > 0) return images.first;
    return null;
  }

  get lowestStock {
    if (stocks.length > 0) {
      return stocks.reduce((a, b) {
        return a.numInStock > 0
            ? a.priceExclTax < b.priceExclTax
                ? a
                : b
            : b;
      });
    }
    return null;
  }

  VariantItem(
      {this.id, this.name, this.code, this.images, this.stocks, this.variant});

  factory VariantItem.fromJson(Map<String, dynamic> str) {
    return VariantItem(
      id: str["id"],
      name: str["name"],
      code: str["code"],
      images: str["images"].cast<String>(),
      stocks:
          str["stocks"]?.map<Stock>((item) => Stock.fromJson(item))?.toList() ??
              [],
      variant: str["variant"] != null ? Variant.fromJson(str["variant"]) : null,
    );
  }
}

class BasketItem {
  final int id;
  final Product product;
  final Stock stock;
  int qty;
  final String error;
  final double exclPrice;
  final double inclPrice;
  final List<String> variants;

  bool isAdding;

  get unitPrice {
    return (inclPrice ?? 0) / quantity;
  }

  get quantity {
    return qty;
  }

  set quantity(int value) {
    qty = value;
  }

  get adding {
    return isAdding;
  }

  set adding(val) {
    isAdding = val;
  }

  BasketItem(
      {this.id,
      this.product,
      this.stock,
      this.qty,
      this.error,
      this.isAdding,
      this.exclPrice,
      this.variants,
      this.inclPrice});

  factory BasketItem.fromJson(Map<String, dynamic> str) {
    return BasketItem(
      id: str["id"],
      product: Product.fromJson(str["product"]),
      stock: Stock.fromJson(str["stock"]),
      qty: str["quantity"],
      error: str["error"],
      variants: str["variants"].cast<String>(),
      exclPrice: str["price_excl_price"],
      inclPrice: str["price_incl_price"],
    );
  }
}

class Basket {
  final int id;
  final String status;
  final Offer offer;
  final bool canCheckout;
  final double itemTotalIncl;
  final double itemTotalExcl;
  final double gstCharges;
  final double offerDiscount;
  final double totalAfterDiscount;
  final String dateCreated;
  final List<BasketItem> items;

  Basket({
    this.id,
    this.canCheckout,
    this.itemTotalIncl,
    this.itemTotalExcl,
    this.gstCharges,
    this.offerDiscount,
    this.offer,
    this.totalAfterDiscount,
    this.status,
    this.dateCreated,
    this.items,
  });

  factory Basket.fromJson(Map<String, dynamic> str) {
    return Basket(
      id: str["id"],
      status: str["status"],
      canCheckout: str["can_checkout"] ?? false,
      dateCreated: str["date_created"],
      offer: str["offer"] == null ? null : Offer.fromJson(str["offer"]),
      items: str["items"]
              ?.map<BasketItem>((item) => BasketItem.fromJson(item))
              ?.toList() ??
          [],
      itemTotalIncl: str["total_incl"]?.toDouble(),
      itemTotalExcl: str["total_excl"]?.toDouble(),
      gstCharges: str["gst_charges"]?.toDouble(),
      offerDiscount: str["discount"]?.toDouble(),
      totalAfterDiscount: str["total_after_discount"]?.toDouble(),
    );
  }
}

class Seller {
  final int id;
  final String name;
  final String logo;

  Seller({this.id, this.name, this.logo});

  factory Seller.fromJson(Map<String, dynamic> str) {
    if (str == null) return null;
    return Seller(
      id: str["id"],
      name: str["name"],
      logo: str["logo"],
    );
  }
}

class Review {
  final int id;
  final int star;
  final User user;
  final String date;
  final String reviewTitle;
  final String reviewText;

  Review({
    this.id,
    this.star,
    this.user,
    this.date,
    this.reviewTitle,
    this.reviewText,
  });

  factory Review.fromJson(Map<String, dynamic> str) {
    return Review(
      id: str["id"],
      star: str["star"],
      user: User.fromJson(str["user"]),
      date: str["date"],
      reviewTitle: str["title"],
      reviewText: str["text"],
    );
  }
}

enum OrderStatus {
  ORDER_PLACED,
  DISPATCHED,
  SHIPPED,
  OUT_FOR_DELIVERY,
  DELIVERED,
  CANCELLED
}

class OrderEvent {
  final String date;
  final String time;
  final OrderStatus status;
  final String description;

  OrderEvent({this.date, this.time, this.status, this.description});
}

class Order {
  final int id;
  final String number;
  final double totalExclPreDiscount;
  final double totalInclPreDiscount;
  final double totalExcl;
  final double totalIncl;
  final double totalExclShipping;
  final double totalInclShipping;
  final ShippingMethod shippingMethod;
  final UserAddress shippingAddress;
  final UserAddress billingAddress;
  final String paymentMode;
  bool paymentCaptured;
  final String status;
  final String image;
  final String label;
  final String statusRemark;
  final String datePlaced;
  final String dateModified;
  final int basketId;

  Order({
    this.id,
    this.number,
    this.totalExclPreDiscount,
    this.totalInclPreDiscount,
    this.totalExcl,
    this.totalIncl,
    this.totalExclShipping,
    this.totalInclShipping,
    this.shippingMethod,
    this.shippingAddress,
    this.billingAddress,
    this.paymentMode,
    this.paymentCaptured,
    this.status,
    this.statusRemark,
    this.datePlaced,
    this.dateModified,
    this.image,
    this.label,
    this.basketId,
  });

  get paymentDone {
    return this.paymentCaptured;
  }

  set paymentDone(bool done) {
    this.paymentCaptured = done;
  }

  factory Order.fromJson(Map<String, dynamic> str) {
    return Order(
      id: str["id"],
      number: str["number"],
      totalExclPreDiscount: str["total_excl_before_discount"],
      totalInclPreDiscount: str["total_incl_before_discount"],
      totalExcl: str["total_excl_price"],
      totalIncl: str["total_incl_price"],
      totalExclShipping: str["shipping_excl_price"],
      totalInclShipping: str["shipping_incl_price"],
      shippingMethod: ShippingMethod.fromJson(str["shipping_method"]),
      shippingAddress: UserAddress.fromJson(str["shipping_address"]),
      billingAddress: UserAddress.fromJson(str["billing_address"]),
      paymentMode: str["payment_mode"],
      paymentCaptured: str["payment_captured"],
      status: str["status"],
      image: str["image"],
      label: str["label"],
      statusRemark: str["status_remark"],
      datePlaced: str["date_placed"],
      dateModified: str["date_modified"],
      basketId: str["basket_id"],
    );
  }
}

class OrderItem {
  final String sellerName;
  final String sellerSKU;
  final String sellerNotes;
  final Product product;
  final String productTitle;
  final String upc;
  final int quantity;
  final double exclPricePreDiscount;
  final double inclPricePreDiscount;
  final double exclPrice;
  final double inclPrice;
  final String status;
  final String statusRemark;
  final String dateModified;

  OrderItem({
    this.sellerName,
    this.sellerSKU,
    this.sellerNotes,
    this.product,
    this.productTitle,
    this.upc,
    this.quantity,
    this.exclPricePreDiscount,
    this.inclPricePreDiscount,
    this.exclPrice,
    this.inclPrice,
    this.status,
    this.statusRemark,
    this.dateModified,
  });

  factory OrderItem.fromJson(Map<String, dynamic> str) {
    return OrderItem(
      sellerName: str["seller_name"],
      sellerSKU: str["seller_sku"],
      sellerNotes: str["seller_notes"],
      product: Product.fromJson(str["product"]),
      productTitle: str["title"],
      upc: str["upc"],
      quantity: str["quantity"],
      exclPricePreDiscount: str["excl_price_pre_discount"],
      inclPricePreDiscount: str["incl_price_pre_discount"],
      exclPrice: str["excl_price"],
      inclPrice: str["incl_price"],
      status: str["status"],
      statusRemark: str["status_remark"],
      dateModified: str["date_modified"],
    );
  }
}

class ShippingMethod {
  final String code;
  final String name;
  final double pricePerOrder;
  final double pricePerItem;
  final double freeThreshold;
  final String description;
  final int period;

  ShippingMethod(
      {this.code,
      this.name,
      this.pricePerOrder,
      this.pricePerItem,
      this.freeThreshold,
      this.description,
      this.period});

  get freeAfter {
    if (freeThreshold == null || freeThreshold == 0.0) return 100000;
    return freeThreshold;
  }

  factory ShippingMethod.fromJson(Map<String, dynamic> str) {
    return ShippingMethod(
      code: str["code"],
      name: str["name"],
      description: str["description"],
      pricePerOrder: str["price_per_order"],
      pricePerItem: str["price_per_item"],
      freeThreshold: str["free_shipping_threshold"],
      period: str["delivery_period"],
    );
  }
}

class WishlistItem {
  final String title;
  final Product product;
  final String dateCreated;

  WishlistItem({this.title, this.product, this.dateCreated});

  factory WishlistItem.fromJson(Map<String, dynamic> str) {
    return WishlistItem(
      title: str["title"],
      product: str["product"] == null ? null : Product.fromJson(str["product"]),
      dateCreated: str["date_created"],
    );
  }
}

enum LinkType { MAIL, CALL, KNOW_MORE, NONE }

class HelpTopic {
  final int id;
  final String title;
  final String content;
  final LinkType linkType;
  final String link;

  HelpTopic({this.title, this.content, this.id, this.linkType, this.link});

  factory HelpTopic.fromJson(Map<String, dynamic> str) {
    return HelpTopic(
      id: str["id"],
      title: str["title"],
      content: str["content"],
      link: str["link"],
      linkType: getLinkType(str["link_type"] ?? 3),
    );
  }
}

getLinkType(int index) {
  switch (index) {
    case 0:
      return LinkType.MAIL;
    case 1:
      return LinkType.CALL;
    case 2:
      return LinkType.KNOW_MORE;
    default:
      return LinkType.NONE;
  }
}

class Offer {
  final String code;
  final String title;
  final String summary;
  final String terms;

  Offer({this.code, this.title, this.summary, this.terms});

  factory Offer.fromJson(Map<String, dynamic> str) {
    return Offer(
      code: str["code"],
      title: str["title"],
      summary: str["summary"],
      terms: str["terms"],
    );
  }
}
