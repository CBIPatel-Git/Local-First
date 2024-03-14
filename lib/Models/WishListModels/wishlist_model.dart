class WishlistModel {
  WishlistModel({
   this.success,
   this.message,
   this.code,
   this.data,
  });

  final bool? success;
  final String? message;
  final num? code;
  final Data? data;

  factory WishlistModel.fromJson(Map<String, dynamic> json){
    return WishlistModel(
      success: json["success"],
      message: json["message"],
      code: json["code"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "code": code,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.finalwishData,
  });

  final List<FinalwishDatum> finalwishData;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      finalwishData: json["finalwishData"] == null ? [] : List<FinalwishDatum>.from(json["finalwishData"]!.map((x) => FinalwishDatum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "finalwishData": finalwishData.map((x) => x.toJson()).toList(),
  };

}

class FinalwishDatum {
  FinalwishDatum({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.dateOnSaleFrom,
    required this.dateOnSaleFromGmt,
    required this.dateOnSaleTo,
    required this.dateOnSaleToGmt,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.downloads,
    required this.downloadLimit,
    required this.downloadExpiry,
    required this.externalUrl,
    required this.buttonText,
    required this.taxStatus,
    required this.taxClass,
    required this.manageStock,
    required this.stockQuantity,
    required this.backorders,
    required this.backordersAllowed,
    required this.backordered,
    required this.lowStockAmount,
    required this.soldIndividually,
    required this.weight,
    required this.dimensions,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.shippingClass,
    required this.shippingClassId,
    required this.reviewsAllowed,
    required this.averageRating,
    required this.ratingCount,
    required this.upsellIds,
    required this.crossSellIds,
    required this.parentId,
    required this.purchaseNote,
    required this.categories,
    required this.tags,
    required this.images,
    required this.attributes,
    required this.defaultAttributes,
    required this.variations,
    required this.groupedProducts,
    required this.menuOrder,
    required this.priceHtml,
    required this.relatedIds,
    // required this.metaData,
    required this.stockStatus,
    required this.hasOptions,
    required this.postPassword,
    required this.productUnits,
    required this.wcfmProductPolicyData,
    required this.showAdditionalInfoTab,
    required this.store,
    required this.productRestirctionMessage,
    required this.links,
  });

  final int? id;
  final String? name;
  final String? slug;
  final String? permalink;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? type;
  final String? status;
  final bool? featured;
  final String? catalogVisibility;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final dynamic dateOnSaleFrom;
  final dynamic dateOnSaleFromGmt;
  final dynamic dateOnSaleTo;
  final dynamic dateOnSaleToGmt;
  final bool? onSale;
  final bool? purchasable;
  final num? totalSales;
  final bool? virtual;
  final bool? downloadable;
  final List<dynamic> downloads;
  final num? downloadLimit;
  final num? downloadExpiry;
  final String? externalUrl;
  final String? buttonText;
  final String? taxStatus;
  final String? taxClass;
  final bool? manageStock;
  final dynamic stockQuantity;
  final String? backorders;
  final bool? backordersAllowed;
  final bool? backordered;
  final dynamic lowStockAmount;
  final bool? soldIndividually;
  final String? weight;
  final Dimensions? dimensions;
  final bool? shippingRequired;
  final bool? shippingTaxable;
  final String? shippingClass;
  final int? shippingClassId;
  final bool? reviewsAllowed;
  final String? averageRating;
  final num? ratingCount;
  final List<dynamic> upsellIds;
  final List<dynamic> crossSellIds;
  final int? parentId;
  final String? purchaseNote;
  final List<Category> categories;
  final List<dynamic> tags;
  final List<Image> images;
  final List<Attribute> attributes;
  final List<dynamic> defaultAttributes;
  final List<dynamic> variations;
  final List<dynamic> groupedProducts;
  final num? menuOrder;
  final String? priceHtml;
  final List<num> relatedIds;
  // final List<MetaDatum> metaData;
  final String? stockStatus;
  final bool? hasOptions;
  final String? postPassword;
  final ProductUnits? productUnits;
  final WcfmProductPolicyData? wcfmProductPolicyData;
  final bool? showAdditionalInfoTab;
  final Store? store;
  final String? productRestirctionMessage;
  final Links? links;

  factory FinalwishDatum.fromJson(Map<String, dynamic> json){
    return FinalwishDatum(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      permalink: json["permalink"],
      dateCreated: DateTime.tryParse(json["date_created"] ?? ""),
      dateCreatedGmt: DateTime.tryParse(json["date_created_gmt"] ?? ""),
      dateModified: DateTime.tryParse(json["date_modified"] ?? ""),
      dateModifiedGmt: DateTime.tryParse(json["date_modified_gmt"] ?? ""),
      type: json["type"],
      status: json["status"],
      featured: json["featured"],
      catalogVisibility: json["catalog_visibility"],
      description: json["description"],
      shortDescription: json["short_description"],
      sku: json["sku"],
      price: json["price"],
      regularPrice: json["regular_price"],
      salePrice: json["sale_price"],
      dateOnSaleFrom: json["date_on_sale_from"],
      dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
      dateOnSaleTo: json["date_on_sale_to"],
      dateOnSaleToGmt: json["date_on_sale_to_gmt"],
      onSale: json["on_sale"],
      purchasable: json["purchasable"],
      totalSales: json["total_sales"],
      virtual: json["virtual"],
      downloadable: json["downloadable"],
      downloads: json["downloads"] == null ? [] : List<dynamic>.from(json["downloads"]!.map((x) => x)),
      downloadLimit: json["download_limit"],
      downloadExpiry: json["download_expiry"],
      externalUrl: json["external_url"],
      buttonText: json["button_text"],
      taxStatus: json["tax_status"],
      taxClass: json["tax_class"],
      manageStock: json["manage_stock"],
      stockQuantity: json["stock_quantity"],
      backorders: json["backorders"],
      backordersAllowed: json["backorders_allowed"],
      backordered: json["backordered"],
      lowStockAmount: json["low_stock_amount"],
      soldIndividually: json["sold_individually"],
      weight: json["weight"],
      dimensions: json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]),
      shippingRequired: json["shipping_required"],
      shippingTaxable: json["shipping_taxable"],
      shippingClass: json["shipping_class"],
      shippingClassId: json["shipping_class_id"],
      reviewsAllowed: json["reviews_allowed"],
      averageRating: json["average_rating"],
      ratingCount: json["rating_count"],
      upsellIds: json["upsell_ids"] == null ? [] : List<dynamic>.from(json["upsell_ids"]!.map((x) => x)),
      crossSellIds: json["cross_sell_ids"] == null ? [] : List<dynamic>.from(json["cross_sell_ids"]!.map((x) => x)),
      parentId: json["parent_id"],
      purchaseNote: json["purchase_note"],
      categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
      tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      attributes: json["attributes"] == null ? [] : List<Attribute>.from(json["attributes"]!.map((x) => Attribute.fromJson(x))),
      defaultAttributes: json["default_attributes"] == null ? [] : List<dynamic>.from(json["default_attributes"]!.map((x) => x)),
      variations: json["variations"] == null ? [] : List<dynamic>.from(json["variations"]!.map((x) => x)),
      groupedProducts: json["grouped_products"] == null ? [] : List<dynamic>.from(json["grouped_products"]!.map((x) => x)),
      menuOrder: json["menu_order"],
      priceHtml: json["price_html"],
      relatedIds: json["related_ids"] == null ? [] : List<num>.from(json["related_ids"]!.map((x) => x)),
      // metaData: json["meta_data"] == null ? [] : List<MetaDatum>.from(json["meta_data"]!.map((x) => MetaDatum.fromJson(x))),
      stockStatus: json["stock_status"],
      hasOptions: json["has_options"],
      postPassword: json["post_password"],
      productUnits: json["product_units"] == null ? null : ProductUnits.fromJson(json["product_units"]),
      wcfmProductPolicyData: json["wcfm_product_policy_data"] == null ? null : WcfmProductPolicyData.fromJson(json["wcfm_product_policy_data"]),
      showAdditionalInfoTab: json["showAdditionalInfoTab"],
      store: json["store"] == null ? null : Store.fromJson(json["store"]),
      productRestirctionMessage: json["product_restirction_message"],
      links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "permalink": permalink,
    "date_created": dateCreated?.toIso8601String(),
    "date_created_gmt": dateCreatedGmt?.toIso8601String(),
    "date_modified": dateModified?.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
    "type": type,
    "status": status,
    "featured": featured,
    "catalog_visibility": catalogVisibility,
    "description": description,
    "short_description": shortDescription,
    "sku": sku,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "date_on_sale_from": dateOnSaleFrom,
    "date_on_sale_from_gmt": dateOnSaleFromGmt,
    "date_on_sale_to": dateOnSaleTo,
    "date_on_sale_to_gmt": dateOnSaleToGmt,
    "on_sale": onSale,
    "purchasable": purchasable,
    "total_sales": totalSales,
    "virtual": virtual,
    "downloadable": downloadable,
    "downloads": downloads.map((x) => x).toList(),
    "download_limit": downloadLimit,
    "download_expiry": downloadExpiry,
    "external_url": externalUrl,
    "button_text": buttonText,
    "tax_status": taxStatus,
    "tax_class": taxClass,
    "manage_stock": manageStock,
    "stock_quantity": stockQuantity,
    "backorders": backorders,
    "backorders_allowed": backordersAllowed,
    "backordered": backordered,
    "low_stock_amount": lowStockAmount,
    "sold_individually": soldIndividually,
    "weight": weight,
    "dimensions": dimensions?.toJson(),
    "shipping_required": shippingRequired,
    "shipping_taxable": shippingTaxable,
    "shipping_class": shippingClass,
    "shipping_class_id": shippingClassId,
    "reviews_allowed": reviewsAllowed,
    "average_rating": averageRating,
    "rating_count": ratingCount,
    "upsell_ids": upsellIds.map((x) => x).toList(),
    "cross_sell_ids": crossSellIds.map((x) => x).toList(),
    "parent_id": parentId,
    "purchase_note": purchaseNote,
    "categories": categories.map((x) => x.toJson()).toList(),
    "tags": tags.map((x) => x).toList(),
    "images": images.map((x) => x.toJson()).toList(),
    "attributes": attributes.map((x) => x.toJson()).toList(),
    "default_attributes": defaultAttributes.map((x) => x).toList(),
    "variations": variations.map((x) => x).toList(),
    "grouped_products": groupedProducts.map((x) => x).toList(),
    "menu_order": menuOrder,
    "price_html": priceHtml,
    "related_ids": relatedIds.map((x) => x).toList(),
    // "meta_data": metaData.map((x) => x.toJson()).toList(),
    "stock_status": stockStatus,
    "has_options": hasOptions,
    "post_password": postPassword,
    "product_units": productUnits?.toJson(),
    "wcfm_product_policy_data": wcfmProductPolicyData?.toJson(),
    "showAdditionalInfoTab": showAdditionalInfoTab,
    "store": store?.toJson(),
    "product_restirction_message": productRestirctionMessage,
    "_links": links?.toJson(),
  };

}

class Attribute {
  Attribute({
    required this.id,
    required this.name,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  final int? id;
  final String? name;
  final num? position;
  final bool? visible;
  final bool? variation;
  final List<String> options;

  factory Attribute.fromJson(Map<String, dynamic> json){
    return Attribute(
      id: json["id"],
      name: json["name"],
      position: json["position"],
      visible: json["visible"],
      variation: json["variation"],
      options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "position": position,
    "visible": visible,
    "variation": variation,
    "options": options.map((x) => x).toList(),
  };

}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  final int? id;
  final String? name;
  final String? slug;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };

}

class Dimensions {
  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  final String? length;
  final String? width;
  final String? height;

  factory Dimensions.fromJson(Map<String, dynamic> json){
    return Dimensions(
      length: json["length"],
      width: json["width"],
      height: json["height"],
    );
  }

  Map<String, dynamic> toJson() => {
    "length": length,
    "width": width,
    "height": height,
  };

}

class Image {
  Image({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
    required this.the1536X1536,
    required this.the2048X2048,
    required this.wolmartPostMedium,
    required this.wolmartPostSmall,
    required this.wolmartProductThumbnail,
    required this.wolmartCustom,
    required this.woocommerceThumbnail,
    required this.woocommerceSingle,
    required this.woocommerceGalleryThumbnail,
  });

  final int? id;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;
  final String? the1536X1536;
  final String? the2048X2048;
  final String? wolmartPostMedium;
  final String? wolmartPostSmall;
  final String? wolmartProductThumbnail;
  final String? wolmartCustom;
  final String? woocommerceThumbnail;
  final String? woocommerceSingle;
  final String? woocommerceGalleryThumbnail;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      id: json["id"],
      dateCreated: DateTime.tryParse(json["date_created"] ?? ""),
      dateCreatedGmt: DateTime.tryParse(json["date_created_gmt"] ?? ""),
      dateModified: DateTime.tryParse(json["date_modified"] ?? ""),
      dateModifiedGmt: DateTime.tryParse(json["date_modified_gmt"] ?? ""),
      src: json["src"],
      name: json["name"],
      alt: json["alt"],
      the1536X1536: json["1536x1536"],
      the2048X2048: json["2048x2048"],
      wolmartPostMedium: json["wolmart-post-medium"],
      wolmartPostSmall: json["wolmart-post-small"],
      wolmartProductThumbnail: json["wolmart-product-thumbnail"],
      wolmartCustom: json["Wolmart Custom"],
      woocommerceThumbnail: json["woocommerce_thumbnail"],
      woocommerceSingle: json["woocommerce_single"],
      woocommerceGalleryThumbnail: json["woocommerce_gallery_thumbnail"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated?.toIso8601String(),
    "date_created_gmt": dateCreatedGmt?.toIso8601String(),
    "date_modified": dateModified?.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
    "src": src,
    "name": name,
    "alt": alt,
    "1536x1536": the1536X1536,
    "2048x2048": the2048X2048,
    "wolmart-post-medium": wolmartPostMedium,
    "wolmart-post-small": wolmartPostSmall,
    "wolmart-product-thumbnail": wolmartProductThumbnail,
    "Wolmart Custom": wolmartCustom,
    "woocommerce_thumbnail": woocommerceThumbnail,
    "woocommerce_single": woocommerceSingle,
    "woocommerce_gallery_thumbnail": woocommerceGalleryThumbnail,
  };

}

class Links {
  Links({
    required this.self,
    required this.collection,
  });

  final List<Collection> self;
  final List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      self: json["self"] == null ? [] : List<Collection>.from(json["self"]!.map((x) => Collection.fromJson(x))),
      collection: json["collection"] == null ? [] : List<Collection>.from(json["collection"]!.map((x) => Collection.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "self": self.map((x) => x.toJson()).toList(),
    "collection": collection.map((x) => x.toJson()).toList(),
  };

}

class Collection {
  Collection({
    required this.href,
  });

  final String? href;

  factory Collection.fromJson(Map<String, dynamic> json){
    return Collection(
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
    "href": href,
  };

}

// class MetaDatum {
//   MetaDatum({
//     required this.id,
//     required this.key,
//     required this.value,
//   });
//
//   final int? id;
//   final String? key;
//   final String? value;
//
//   factory MetaDatum.fromJson(Map<String, dynamic> json){
//     return MetaDatum(
//       id: json["id"],
//       key: json["key"],
//       value: json["value"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "key": key,
//     "value": value,
//   };
//
// }

class ProductUnits {
  ProductUnits({
    required this.weightUnit,
    required this.dimensionUnit,
  });

  final String? weightUnit;
  final String? dimensionUnit;

  factory ProductUnits.fromJson(Map<String, dynamic> json){
    return ProductUnits(
      weightUnit: json["weight_unit"],
      dimensionUnit: json["dimension_unit"],
    );
  }

  Map<String, dynamic> toJson() => {
    "weight_unit": weightUnit,
    "dimension_unit": dimensionUnit,
  };

}

class Store {
  Store({
    required this.vendorId,
    required this.vendorDisplayName,
    required this.vendorShopName,
    required this.formattedDisplayName,
    required this.storeHideEmail,
    required this.storeHidePhone,
    required this.storeHideAddress,
    required this.storeHideDescription,
    required this.storeHidePolicy,
    required this.storeProductsPerPage,
    required this.vendorEmail,
    required this.vendorPhone,
    required this.vendorAddress,
    required this.disableVendor,
    required this.isStoreOffline,
    required this.vendorShopLogo,
    required this.vendorBannerType,
    required this.vendorBanner,
    required this.mobileBanner,
    required this.vendorListBannerType,
    required this.vendorListBanner,
    required this.storeRating,
    required this.emailVerified,
    required this.vendorAdditionalInfo,
    required this.membershipDetails,
    required this.vendorDescription,
    required this.vendorPolicies,
    required this.storeTabHeadings,
  });

  final int? vendorId;
  final String? vendorDisplayName;
  final String? vendorShopName;
  final String? formattedDisplayName;
  final String? storeHideEmail;
  final String? storeHidePhone;
  final String? storeHideAddress;
  final String? storeHideDescription;
  final String? storeHidePolicy;
  final num? storeProductsPerPage;
  final String? vendorEmail;
  final String? vendorPhone;
  final String? vendorAddress;
  final String? disableVendor;
  final String? isStoreOffline;
  final String? vendorShopLogo;
  final String? vendorBannerType;
  final String? vendorBanner;
  final String? mobileBanner;
  final String? vendorListBannerType;
  final String? vendorListBanner;
  final String? storeRating;
  final String? emailVerified;
  final List<VendorAdditionalInfo> vendorAdditionalInfo;
  final MembershipDetails? membershipDetails;
  final String? vendorDescription;
  final WcfmProductPolicyData? vendorPolicies;
  final StoreTabHeadings? storeTabHeadings;

  factory Store.fromJson(Map<String, dynamic> json){
    return Store(
      vendorId: json["vendor_id"],
      vendorDisplayName: json["vendor_display_name"],
      vendorShopName: json["vendor_shop_name"],
      formattedDisplayName: json["formatted_display_name"],
      storeHideEmail: json["store_hide_email"],
      storeHidePhone: json["store_hide_phone"],
      storeHideAddress: json["store_hide_address"],
      storeHideDescription: json["store_hide_description"],
      storeHidePolicy: json["store_hide_policy"],
      storeProductsPerPage: json["store_products_per_page"],
      vendorEmail: json["vendor_email"],
      vendorPhone: json["vendor_phone"],
      vendorAddress: json["vendor_address"],
      disableVendor: json["disable_vendor"],
      isStoreOffline: json["is_store_offline"],
      vendorShopLogo: json["vendor_shop_logo"],
      vendorBannerType: json["vendor_banner_type"],
      vendorBanner: json["vendor_banner"],
      mobileBanner: json["mobile_banner"],
      vendorListBannerType: json["vendor_list_banner_type"],
      vendorListBanner: json["vendor_list_banner"],
      storeRating: json["store_rating"],
      emailVerified: json["email_verified"],
      vendorAdditionalInfo: json["vendor_additional_info"] == null ? [] : List<VendorAdditionalInfo>.from(json["vendor_additional_info"]!.map((x) => VendorAdditionalInfo.fromJson(x))),
      membershipDetails: json["membership_details"] == null ? null : MembershipDetails.fromJson(json["membership_details"]),
      vendorDescription: json["vendor_description"],
      vendorPolicies: json["vendor_policies"] == null ? null : WcfmProductPolicyData.fromJson(json["vendor_policies"]),
      storeTabHeadings: json["store_tab_headings"] == null ? null : StoreTabHeadings.fromJson(json["store_tab_headings"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "vendor_id": vendorId,
    "vendor_display_name": vendorDisplayName,
    "vendor_shop_name": vendorShopName,
    "formatted_display_name": formattedDisplayName,
    "store_hide_email": storeHideEmail,
    "store_hide_phone": storeHidePhone,
    "store_hide_address": storeHideAddress,
    "store_hide_description": storeHideDescription,
    "store_hide_policy": storeHidePolicy,
    "store_products_per_page": storeProductsPerPage,
    "vendor_email": vendorEmail,
    "vendor_phone": vendorPhone,
    "vendor_address": vendorAddress,
    "disable_vendor": disableVendor,
    "is_store_offline": isStoreOffline,
    "vendor_shop_logo": vendorShopLogo,
    "vendor_banner_type": vendorBannerType,
    "vendor_banner": vendorBanner,
    "mobile_banner": mobileBanner,
    "vendor_list_banner_type": vendorListBannerType,
    "vendor_list_banner": vendorListBanner,
    "store_rating": storeRating,
    "email_verified": emailVerified,
    "vendor_additional_info": vendorAdditionalInfo.map((x) => x.toJson()).toList(),
    "membership_details": membershipDetails?.toJson(),
    "vendor_description": vendorDescription,
    "vendor_policies": vendorPolicies?.toJson(),
    "store_tab_headings": storeTabHeadings?.toJson(),
  };

}

class MembershipDetails {
  MembershipDetails({
    required this.membershipTitle,
    required this.membershipId,
  });

  final String? membershipTitle;
  final String? membershipId;

  factory MembershipDetails.fromJson(Map<String, dynamic> json){
    return MembershipDetails(
      membershipTitle: json["membership_title"],
      membershipId: json["membership_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "membership_title": membershipTitle,
    "membership_id": membershipId,
  };

}

class StoreTabHeadings {
  StoreTabHeadings({
    required this.products,
    required this.about,
    required this.policies,
    required this.reviews,
  });

  final String? products;
  final String? about;
  final String? policies;
  final String? reviews;

  factory StoreTabHeadings.fromJson(Map<String, dynamic> json){
    return StoreTabHeadings(
      products: json["products"],
      about: json["about"],
      policies: json["policies"],
      reviews: json["reviews"],
    );
  }

  Map<String, dynamic> toJson() => {
    "products": products,
    "about": about,
    "policies": policies,
    "reviews": reviews,
  };

}

class VendorAdditionalInfo {
  VendorAdditionalInfo({
    required this.enable,
    required this.type,
    required this.label,
    required this.options,
    required this.content,
    required this.helpText,
    required this.required,
    required this.name,
    required this.value,
  });

  final String? enable;
  final String? type;
  final String? label;
  final String? options;
  final String? content;
  final String? helpText;
  final String? required;
  final String? name;
  final String? value;

  factory VendorAdditionalInfo.fromJson(Map<String, dynamic> json){
    return VendorAdditionalInfo(
      enable: json["enable"],
      type: json["type"],
      label: json["label"],
      options: json["options"],
      content: json["content"],
      helpText: json["help_text"],
      required: json["required"],
      name: json["name"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
    "enable": enable,
    "type": type,
    "label": label,
    "options": options,
    "content": content,
    "help_text": helpText,
    "required": required,
    "name": name,
    "value": value,
  };

}

class WcfmProductPolicyData {
  WcfmProductPolicyData({
    required this.shippingPolicyHeading,
    required this.shippingPolicy,
    required this.refundPolicyHeading,
    required this.refundPolicy,
    required this.cancellationPolicyHeading,
    required this.cancellationPolicy,
    required this.visible,
    required this.tabTitle,
  });

  final String? shippingPolicyHeading;
  final String? shippingPolicy;
  final String? refundPolicyHeading;
  final String? refundPolicy;
  final String? cancellationPolicyHeading;
  final String? cancellationPolicy;
  final bool? visible;
  final String? tabTitle;

  factory WcfmProductPolicyData.fromJson(Map<String, dynamic> json){
    return WcfmProductPolicyData(
      shippingPolicyHeading: json["shipping_policy_heading"],
      shippingPolicy: json["shipping_policy"],
      refundPolicyHeading: json["refund_policy_heading"],
      refundPolicy: json["refund_policy"],
      cancellationPolicyHeading: json["cancellation_policy_heading"],
      cancellationPolicy: json["cancellation_policy"],
      visible: json["visible"],
      tabTitle: json["tab_title"],
    );
  }

  Map<String, dynamic> toJson() => {
    "shipping_policy_heading": shippingPolicyHeading,
    "shipping_policy": shippingPolicy,
    "refund_policy_heading": refundPolicyHeading,
    "refund_policy": refundPolicy,
    "cancellation_policy_heading": cancellationPolicyHeading,
    "cancellation_policy": cancellationPolicy,
    "visible": visible,
    "tab_title": tabTitle,
  };

}
