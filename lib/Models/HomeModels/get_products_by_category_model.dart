class GetProductsByCategory {
  bool? success;
  String? message;
  int? code;
  List<Data>? data;

  GetProductsByCategory({this.success, this.message, this.code, this.data});

  GetProductsByCategory.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic lowStockAmount;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Categories>? categories;
  List<dynamic>? tags;
  List<Images>? images;
  List<dynamic>? attributes;
  List<dynamic>? defaultAttributes;
  List<dynamic>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  String? priceHtml;
  List<int>? relatedIds;
  List<MetaData>? metaData;
  String? stockStatus;
  bool? hasOptions;
  String? postPassword;
  List<dynamic>? aioseoNotices;
  ProductUnits? productUnits;
  WcfmProductPolicyData? wcfmProductPolicyData;
  bool? showAdditionalInfoTab;
  List<dynamic>? store;
  String? productRestirctionMessage;
  Links? lLinks;

  Data(
      {this.id,
      this.name,
      this.slug,
      this.permalink,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.type,
      this.status,
      this.featured,
      this.catalogVisibility,
      this.description,
      this.shortDescription,
      this.sku,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.dateOnSaleFrom,
      this.dateOnSaleFromGmt,
      this.dateOnSaleTo,
      this.dateOnSaleToGmt,
      this.onSale,
      this.purchasable,
      this.totalSales,
      this.virtual,
      this.downloadable,
      this.downloads,
      this.downloadLimit,
      this.downloadExpiry,
      this.externalUrl,
      this.buttonText,
      this.taxStatus,
      this.taxClass,
      this.manageStock,
      this.stockQuantity,
      this.backorders,
      this.backordersAllowed,
      this.backordered,
      this.lowStockAmount,
      this.soldIndividually,
      this.weight,
      this.dimensions,
      this.shippingRequired,
      this.shippingTaxable,
      this.shippingClass,
      this.shippingClassId,
      this.reviewsAllowed,
      this.averageRating,
      this.ratingCount,
      this.upsellIds,
      this.crossSellIds,
      this.parentId,
      this.purchaseNote,
      this.categories,
      this.tags,
      this.images,
      this.attributes,
      this.defaultAttributes,
      this.variations,
      this.groupedProducts,
      this.menuOrder,
      this.priceHtml,
      this.relatedIds,
      this.metaData,
      this.stockStatus,
      this.hasOptions,
      this.postPassword,
      this.aioseoNotices,
      this.productUnits,
      this.wcfmProductPolicyData,
      this.showAdditionalInfoTab,
      this.store,
      this.productRestirctionMessage,
      this.lLinks});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    permalink = json['permalink'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    type = json['type'];
    status = json['status'];
    featured = json['featured'];
    catalogVisibility = json['catalog_visibility'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    dateOnSaleFrom = json['date_on_sale_from'];
    dateOnSaleFromGmt = json['date_on_sale_from_gmt'];
    dateOnSaleTo = json['date_on_sale_to'];
    dateOnSaleToGmt = json['date_on_sale_to_gmt'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    totalSales = json['total_sales'];
    virtual = json['virtual'];
    downloadable = json['downloadable'];
    if (json['downloads'] != null) {
      downloads = <dynamic>[];
      json['downloads'].forEach((v) {
        downloads!.add(v);
      });
    }
    downloadLimit = json['download_limit'];
    downloadExpiry = json['download_expiry'];
    externalUrl = json['external_url'];
    buttonText = json['button_text'];
    taxStatus = json['tax_status'];
    taxClass = json['tax_class'];
    manageStock = json['manage_stock'];
    stockQuantity = json['stock_quantity'];
    backorders = json['backorders'];
    backordersAllowed = json['backorders_allowed'];
    backordered = json['backordered'];
    lowStockAmount = json['low_stock_amount'];
    soldIndividually = json['sold_individually'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    shippingRequired = json['shipping_required'];
    shippingTaxable = json['shipping_taxable'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    reviewsAllowed = json['reviews_allowed'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    if (json['upsell_ids'] != null) {
      upsellIds = <dynamic>[];
      json['upsell_ids'].forEach((v) {
        upsellIds!.add(v);
      });
    }
    if (json['cross_sell_ids'] != null) {
      crossSellIds = <dynamic>[];
      json['cross_sell_ids'].forEach((v) {
        crossSellIds!.add(v);
      });
    }
    parentId = json['parent_id'];
    purchaseNote = json['purchase_note'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <dynamic>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <dynamic>[];
      json['attributes'].forEach((v) {
        attributes!.add(v);
      });
    }
    if (json['default_attributes'] != null) {
      defaultAttributes = <dynamic>[];
      json['default_attributes'].forEach((v) {
        defaultAttributes!.add(v);
      });
    }
    if (json['variations'] != null) {
      variations = <dynamic>[];
      json['variations'].forEach((v) {
        variations!.add(v);
      });
    }
    if (json['grouped_products'] != null) {
      groupedProducts = <dynamic>[];
      json['grouped_products'].forEach((v) {
        groupedProducts!.add(v);
      });
    }
    menuOrder = json['menu_order'];
    priceHtml = json['price_html'];
    relatedIds = json['related_ids'].cast<int>();
    if (json['meta_data'] != null) {
      metaData = <MetaData>[];
      json['meta_data'].forEach((v) {
        metaData!.add(MetaData.fromJson(v));
      });
    }
    stockStatus = json['stock_status'];
    hasOptions = json['has_options'];
    postPassword = json['post_password'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['permalink'] = permalink;
    data['date_created'] = dateCreated;
    data['date_created_gmt'] = dateCreatedGmt;
    data['date_modified'] = dateModified;
    data['date_modified_gmt'] = dateModifiedGmt;
    data['type'] = type;
    data['status'] = status;
    data['featured'] = featured;
    data['catalog_visibility'] = catalogVisibility;
    data['description'] = description;
    data['short_description'] = shortDescription;
    data['sku'] = sku;
    data['price'] = price;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    data['date_on_sale_from'] = dateOnSaleFrom;
    data['date_on_sale_from_gmt'] = dateOnSaleFromGmt;
    data['date_on_sale_to'] = dateOnSaleTo;
    data['date_on_sale_to_gmt'] = dateOnSaleToGmt;
    data['on_sale'] = onSale;
    data['purchasable'] = purchasable;
    data['total_sales'] = totalSales;
    data['virtual'] = virtual;
    data['downloadable'] = downloadable;
    if (downloads != null) {
      data['downloads'] = downloads!.map((v) => v.toJson()).toList();
    }
    data['download_limit'] = downloadLimit;
    data['download_expiry'] = downloadExpiry;
    data['external_url'] = externalUrl;
    data['button_text'] = buttonText;
    data['tax_status'] = taxStatus;
    data['tax_class'] = taxClass;
    data['manage_stock'] = manageStock;
    data['stock_quantity'] = stockQuantity;
    data['backorders'] = backorders;
    data['backorders_allowed'] = backordersAllowed;
    data['backordered'] = backordered;
    data['low_stock_amount'] = lowStockAmount;
    data['sold_individually'] = soldIndividually;
    data['weight'] = weight;
    if (dimensions != null) {
      data['dimensions'] = dimensions!.toJson();
    }
    data['shipping_required'] = shippingRequired;
    data['shipping_taxable'] = shippingTaxable;
    data['shipping_class'] = shippingClass;
    data['shipping_class_id'] = shippingClassId;
    data['reviews_allowed'] = reviewsAllowed;
    data['average_rating'] = averageRating;
    data['rating_count'] = ratingCount;
    if (upsellIds != null) {
      data['upsell_ids'] = upsellIds!.map((v) => v.toJson()).toList();
    }
    if (crossSellIds != null) {
      data['cross_sell_ids'] = crossSellIds!.map((v) => v.toJson()).toList();
    }
    data['parent_id'] = parentId;
    data['purchase_note'] = purchaseNote;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    if (defaultAttributes != null) {
      data['default_attributes'] = defaultAttributes!.map((v) => v.toJson()).toList();
    }
    if (variations != null) {
      data['variations'] = variations!.map((v) => v.toJson()).toList();
    }
    if (groupedProducts != null) {
      data['grouped_products'] = groupedProducts!.map((v) => v.toJson()).toList();
    }
    data['menu_order'] = menuOrder;
    data['price_html'] = priceHtml;
    data['related_ids'] = relatedIds;
    if (metaData != null) {
      data['meta_data'] = metaData!.map((v) => v.toJson()).toList();
    }
    data['stock_status'] = stockStatus;
    data['has_options'] = hasOptions;
    data['post_password'] = postPassword;
    if (aioseoNotices != null) {
      data['aioseo_notices'] = aioseoNotices!.map((v) => v.toJson()).toList();
    }
    if (productUnits != null) {
      data['product_units'] = productUnits!.toJson();
    }
    if (wcfmProductPolicyData != null) {
      data['wcfm_product_policy_data'] = wcfmProductPolicyData!.toJson();
    }
    data['showAdditionalInfoTab'] = showAdditionalInfoTab;
    if (store != null) {
      data['store'] = store!.map((v) => v.toJson()).toList();
    }
    data['product_restirction_message'] = productRestirctionMessage;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({this.length, this.width, this.height});

  Dimensions.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;

  Categories({this.id, this.name, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class Images {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;
  String? s1536x1536;
  String? s2048x2048;
  String? wolmartPostMedium;
  String? wolmartPostSmall;
  String? wolmartProductThumbnail;
  String? wolmartCustom;
  String? woocommerceThumbnail;
  String? woocommerceSingle;
  String? woocommerceGalleryThumbnail;

  Images(
      {this.id,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.src,
      this.name,
      this.alt,
      this.s1536x1536,
      this.s2048x2048,
      this.wolmartPostMedium,
      this.wolmartPostSmall,
      this.wolmartProductThumbnail,
      this.wolmartCustom,
      this.woocommerceThumbnail,
      this.woocommerceSingle,
      this.woocommerceGalleryThumbnail});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
    s1536x1536 = json['1536x1536'];
    s2048x2048 = json['2048x2048'];
    wolmartPostMedium = json['wolmart-post-medium'];
    wolmartPostSmall = json['wolmart-post-small'];
    wolmartProductThumbnail = json['wolmart-product-thumbnail'];
    wolmartCustom = json['Wolmart Custom'];
    woocommerceThumbnail = json['woocommerce_thumbnail'];
    woocommerceSingle = json['woocommerce_single'];
    woocommerceGalleryThumbnail = json['woocommerce_gallery_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_created'] = dateCreated;
    data['date_created_gmt'] = dateCreatedGmt;
    data['date_modified'] = dateModified;
    data['date_modified_gmt'] = dateModifiedGmt;
    data['src'] = src;
    data['name'] = name;
    data['alt'] = alt;
    data['1536x1536'] = s1536x1536;
    data['2048x2048'] = s2048x2048;
    data['wolmart-post-medium'] = wolmartPostMedium;
    data['wolmart-post-small'] = wolmartPostSmall;
    data['wolmart-product-thumbnail'] = wolmartProductThumbnail;
    data['Wolmart Custom'] = wolmartCustom;
    data['woocommerce_thumbnail'] = woocommerceThumbnail;
    data['woocommerce_single'] = woocommerceSingle;
    data['woocommerce_gallery_thumbnail'] = woocommerceGalleryThumbnail;
    return data;
  }
}

class MetaData {
  int? id;
  String? key;
  dynamic value;

  MetaData({this.id, this.key, this.value});

  MetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class ProductUnits {
  String? weightUnit;
  String? dimensionUnit;

  ProductUnits({this.weightUnit, this.dimensionUnit});

  ProductUnits.fromJson(Map<String, dynamic> json) {
    weightUnit = json['weight_unit'];
    dimensionUnit = json['dimension_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weight_unit'] = weightUnit;
    data['dimension_unit'] = dimensionUnit;
    return data;
  }
}

class WcfmProductPolicyData {
  bool? visible;
  String? shippingPolicy;
  String? shippingPolicyHeading;
  String? refundPolicy;
  String? refundPolicyHeading;
  String? cancellationPolicy;
  String? cancellationPolicyHeading;
  String? tabTitle;

  WcfmProductPolicyData(
      {this.visible,
      this.shippingPolicy,
      this.shippingPolicyHeading,
      this.refundPolicy,
      this.refundPolicyHeading,
      this.cancellationPolicy,
      this.cancellationPolicyHeading,
      this.tabTitle});

  WcfmProductPolicyData.fromJson(Map<String, dynamic> json) {
    visible = json['visible'];
    shippingPolicy = json['shipping_policy'];
    shippingPolicyHeading = json['shipping_policy_heading'];
    refundPolicy = json['refund_policy'];
    refundPolicyHeading = json['refund_policy_heading'];
    cancellationPolicy = json['cancellation_policy'];
    cancellationPolicyHeading = json['cancellation_policy_heading'];
    tabTitle = json['tab_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['visible'] = visible;
    data['shipping_policy'] = shippingPolicy;
    data['shipping_policy_heading'] = shippingPolicyHeading;
    data['refund_policy'] = refundPolicy;
    data['refund_policy_heading'] = refundPolicyHeading;
    data['cancellation_policy'] = cancellationPolicy;
    data['cancellation_policy_heading'] = cancellationPolicyHeading;
    data['tab_title'] = tabTitle;
    return data;
  }
}

class Links {
  List<Self>? self;
  List<dynamic>? collection;

  Links({this.self, this.collection});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = <dynamic>[];
      json['collection'].forEach((v) {
        collection!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      data['collection'] = collection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}
