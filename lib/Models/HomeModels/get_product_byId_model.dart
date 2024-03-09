class GetProductByIdModel {
  GetProductByIdModel({
    this.success,
    this.message,
    this.code,
    this.data,
    this.relatedProducts,
    this.productReview,
  });

  final bool? success;
  final String? message;
  final num? code;
  final Data? data;
  final List<RelatedProduct>? relatedProducts;
  final ProductReview? productReview;

  factory GetProductByIdModel.fromJson(Map<String, dynamic> json) {
    return GetProductByIdModel(
      success: json["success"],
      message: json["message"],
      code: json["code"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      relatedProducts: json["relatedProducts"] == null
          ? []
          : List<RelatedProduct>.from(
              json["relatedProducts"]!.map((x) => RelatedProduct.fromJson(x))),
      productReview:
          json["productReview"] == null ? null : ProductReview.fromJson(json["productReview"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "code": code,
        "data": data?.toJson(),
        "relatedProducts": relatedProducts?.map((x) => x.toJson()).toList(),
        "productReview": productReview?.toJson(),
      };
}

class Data {
  Data({
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
    required this.metaData,
    required this.stockStatus,
    required this.hasOptions,
    required this.postPassword,
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
  final List<dynamic> attributes;
  final List<dynamic> defaultAttributes;
  final List<dynamic> variations;
  final List<dynamic> groupedProducts;
  final num? menuOrder;
  final String? priceHtml;
  final List<num> relatedIds;
  final List<DataMetaDatum> metaData;
  final String? stockStatus;
  final bool? hasOptions;
  final String? postPassword;
  final DataLinks? links;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
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
      downloads:
          json["downloads"] == null ? [] : List<dynamic>.from(json["downloads"]!.map((x) => x)),
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
      upsellIds:
          json["upsell_ids"] == null ? [] : List<dynamic>.from(json["upsell_ids"]!.map((x) => x)),
      crossSellIds: json["cross_sell_ids"] == null
          ? []
          : List<dynamic>.from(json["cross_sell_ids"]!.map((x) => x)),
      parentId: json["parent_id"],
      purchaseNote: json["purchase_note"],
      categories: json["categories"] == null
          ? []
          : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
      tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
      images: json["images"] == null
          ? []
          : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      attributes:
          json["attributes"] == null ? [] : List<dynamic>.from(json["attributes"]!.map((x) => x)),
      defaultAttributes: json["default_attributes"] == null
          ? []
          : List<dynamic>.from(json["default_attributes"]!.map((x) => x)),
      variations:
          json["variations"] == null ? [] : List<dynamic>.from(json["variations"]!.map((x) => x)),
      groupedProducts: json["grouped_products"] == null
          ? []
          : List<dynamic>.from(json["grouped_products"]!.map((x) => x)),
      menuOrder: json["menu_order"],
      priceHtml: json["price_html"],
      relatedIds:
          json["related_ids"] == null ? [] : List<num>.from(json["related_ids"]!.map((x) => x)),
      metaData: json["meta_data"] == null
          ? []
          : List<DataMetaDatum>.from(json["meta_data"]!.map((x) => DataMetaDatum.fromJson(x))),
      stockStatus: json["stock_status"],
      hasOptions: json["has_options"],
      postPassword: json["post_password"],
      links: json["_links"] == null ? null : DataLinks.fromJson(json["_links"]),
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
        "attributes": attributes.map((x) => x).toList(),
        "default_attributes": defaultAttributes.map((x) => x).toList(),
        "variations": variations.map((x) => x).toList(),
        "grouped_products": groupedProducts.map((x) => x).toList(),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": relatedIds.map((x) => x).toList(),
        "meta_data": metaData.map((x) => x.toJson()).toList(),
        "stock_status": stockStatus,
        "has_options": hasOptions,
        "post_password": postPassword,
        "_links": links?.toJson(),
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

  factory Category.fromJson(Map<String, dynamic> json) {
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

  factory Dimensions.fromJson(Map<String, dynamic> json) {
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
  });

  final int? id;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["id"],
      dateCreated: DateTime.tryParse(json["date_created"] ?? ""),
      dateCreatedGmt: DateTime.tryParse(json["date_created_gmt"] ?? ""),
      dateModified: DateTime.tryParse(json["date_modified"] ?? ""),
      dateModifiedGmt: DateTime.tryParse(json["date_modified_gmt"] ?? ""),
      src: json["src"],
      name: json["name"],
      alt: json["alt"],
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
      };
}

class DataLinks {
  DataLinks({
    required this.self,
    required this.collection,
  });

  final List<Collection> self;
  final List<Collection> collection;

  factory DataLinks.fromJson(Map<String, dynamic> json) {
    return DataLinks(
      self: json["self"] == null
          ? []
          : List<Collection>.from(json["self"]!.map((x) => Collection.fromJson(x))),
      collection: json["collection"] == null
          ? []
          : List<Collection>.from(json["collection"]!.map((x) => Collection.fromJson(x))),
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

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class DataMetaDatum {
  DataMetaDatum({
    required this.id,
    required this.key,
    required this.value,
  });

  final int? id;
  final String? key;
  final String? value;

  factory DataMetaDatum.fromJson(Map<String, dynamic> json) {
    return DataMetaDatum(
      id: json["id"],
      key: json["key"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };
}

class ProductReview {
  ProductReview({required this.json});

  final Map<String, dynamic> json;

  factory ProductReview.fromJson(Map<String, dynamic> json) {
    return ProductReview(json: json);
  }

  Map<String, dynamic> toJson() => {};
}

class RelatedProduct {
  RelatedProduct({
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
    required this.metaData,
    required this.stockStatus,
    required this.hasOptions,
    required this.postPassword,
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
  final num? stockQuantity;
  final String? backorders;
  final bool? backordersAllowed;
  final bool? backordered;
  final num? lowStockAmount;
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
  final List<num> upsellIds;
  final List<num> crossSellIds;
  final int? parentId;
  final String? purchaseNote;
  final List<Category> categories;
  final List<Category> tags;
  final List<Image> images;
  final List<Attribute> attributes;
  final List<DefaultAttribute> defaultAttributes;
  final List<num> variations;
  final List<dynamic> groupedProducts;
  final num? menuOrder;
  final String? priceHtml;
  final List<num> relatedIds;
  final List<RelatedProductMetaDatum> metaData;
  final String? stockStatus;
  final bool? hasOptions;
  final String? postPassword;
  final RelatedProductLinks? links;

  factory RelatedProduct.fromJson(Map<String, dynamic> json) {
    return RelatedProduct(
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
      downloads:
          json["downloads"] == null ? [] : List<dynamic>.from(json["downloads"]!.map((x) => x)),
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
      upsellIds:
          json["upsell_ids"] == null ? [] : List<num>.from(json["upsell_ids"]!.map((x) => x)),
      crossSellIds: json["cross_sell_ids"] == null
          ? []
          : List<num>.from(json["cross_sell_ids"]!.map((x) => x)),
      parentId: json["parent_id"],
      purchaseNote: json["purchase_note"],
      categories: json["categories"] == null
          ? []
          : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
      tags: json["tags"] == null
          ? []
          : List<Category>.from(json["tags"]!.map((x) => Category.fromJson(x))),
      images: json["images"] == null
          ? []
          : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      attributes: json["attributes"] == null
          ? []
          : List<Attribute>.from(json["attributes"]!.map((x) => Attribute.fromJson(x))),
      defaultAttributes: json["default_attributes"] == null
          ? []
          : List<DefaultAttribute>.from(
              json["default_attributes"]!.map((x) => DefaultAttribute.fromJson(x))),
      variations:
          json["variations"] == null ? [] : List<num>.from(json["variations"]!.map((x) => x)),
      groupedProducts: json["grouped_products"] == null
          ? []
          : List<dynamic>.from(json["grouped_products"]!.map((x) => x)),
      menuOrder: json["menu_order"],
      priceHtml: json["price_html"],
      relatedIds:
          json["related_ids"] == null ? [] : List<num>.from(json["related_ids"]!.map((x) => x)),
      metaData: json["meta_data"] == null
          ? []
          : List<RelatedProductMetaDatum>.from(
              json["meta_data"]!.map((x) => RelatedProductMetaDatum.fromJson(x))),
      stockStatus: json["stock_status"],
      hasOptions: json["has_options"],
      postPassword: json["post_password"],
      links: json["_links"] == null ? null : RelatedProductLinks.fromJson(json["_links"]),
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
        "tags": tags.map((x) => x.toJson()).toList(),
        "images": images.map((x) => x.toJson()).toList(),
        "attributes": attributes.map((x) => x.toJson()).toList(),
        "default_attributes": defaultAttributes.map((x) => x.toJson()).toList(),
        "variations": variations.map((x) => x).toList(),
        "grouped_products": groupedProducts.map((x) => x).toList(),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": relatedIds.map((x) => x).toList(),
        "meta_data": metaData.map((x) => x.toJson()).toList(),
        "stock_status": stockStatus,
        "has_options": hasOptions,
        "post_password": postPassword,
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

  factory Attribute.fromJson(Map<String, dynamic> json) {
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

class DefaultAttribute {
  DefaultAttribute({
    required this.id,
    required this.name,
    required this.option,
  });

  final int? id;
  final String? name;
  final String? option;

  factory DefaultAttribute.fromJson(Map<String, dynamic> json) {
    return DefaultAttribute(
      id: json["id"],
      name: json["name"],
      option: json["option"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "option": option,
      };
}

class RelatedProductLinks {
  RelatedProductLinks({
    required this.self,
    required this.collection,
    required this.up,
  });

  final List<Collection> self;
  final List<Collection> collection;
  final List<Collection> up;

  factory RelatedProductLinks.fromJson(Map<String, dynamic> json) {
    return RelatedProductLinks(
      self: json["self"] == null
          ? []
          : List<Collection>.from(json["self"]!.map((x) => Collection.fromJson(x))),
      collection: json["collection"] == null
          ? []
          : List<Collection>.from(json["collection"]!.map((x) => Collection.fromJson(x))),
      up: json["up"] == null
          ? []
          : List<Collection>.from(json["up"]!.map((x) => Collection.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "self": self.map((x) => x.toJson()).toList(),
        "collection": collection.map((x) => x.toJson()).toList(),
        "up": up.map((x) => x.toJson()).toList(),
      };
}

class RelatedProductMetaDatum {
  RelatedProductMetaDatum({
    required this.id,
    required this.key,
    required this.value,
  });

  final int? id;
  final String? key;
  final dynamic value;

  factory RelatedProductMetaDatum.fromJson(Map<String, dynamic> json) {
    return RelatedProductMetaDatum(
      id: json["id"],
      key: json["key"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };
}

class ValueClass {
  ValueClass({
    required this.fbtProducts,
    required this.fbtDiscountEnable,
    required this.fbtDiscountType,
    required this.fbtDiscountFixed,
    required this.fbtDiscountPercentage,
    required this.fbtDiscountCondition,
    required this.fbtDiscountSpend,
    required this.fbtDiscountProductsCount,
    required this.commissionMode,
    required this.commissionPercent,
    required this.commissionFixed,
    required this.taxName,
    required this.taxPercent,
  });

  final List<dynamic> fbtProducts;
  final String? fbtDiscountEnable;
  final String? fbtDiscountType;
  final String? fbtDiscountFixed;
  final String? fbtDiscountPercentage;
  final String? fbtDiscountCondition;
  final num? fbtDiscountSpend;
  final num? fbtDiscountProductsCount;
  final String? commissionMode;
  final String? commissionPercent;
  final String? commissionFixed;
  final String? taxName;
  final String? taxPercent;

  factory ValueClass.fromJson(Map<String, dynamic> json) {
    return ValueClass(
      fbtProducts: json["fbt_products"] == null
          ? []
          : List<dynamic>.from(json["fbt_products"]!.map((x) => x)),
      fbtDiscountEnable: json["fbt_discount_enable"],
      fbtDiscountType: json["fbt_discount_type"],
      fbtDiscountFixed: json["fbt_discount_fixed"],
      fbtDiscountPercentage: json["fbt_discount_percentage"],
      fbtDiscountCondition: json["fbt_discount_condition"],
      fbtDiscountSpend: json["fbt_discount_spend"],
      fbtDiscountProductsCount: json["fbt_discount_products_count"],
      commissionMode: json["commission_mode"],
      commissionPercent: json["commission_percent"],
      commissionFixed: json["commission_fixed"],
      taxName: json["tax_name"],
      taxPercent: json["tax_percent"],
    );
  }

  Map<String, dynamic> toJson() => {
        "fbt_products": fbtProducts.map((x) => x).toList(),
        "fbt_discount_enable": fbtDiscountEnable,
        "fbt_discount_type": fbtDiscountType,
        "fbt_discount_fixed": fbtDiscountFixed,
        "fbt_discount_percentage": fbtDiscountPercentage,
        "fbt_discount_condition": fbtDiscountCondition,
        "fbt_discount_spend": fbtDiscountSpend,
        "fbt_discount_products_count": fbtDiscountProductsCount,
        "commission_mode": commissionMode,
        "commission_percent": commissionPercent,
        "commission_fixed": commissionFixed,
        "tax_name": taxName,
        "tax_percent": taxPercent,
      };
}
