class VehicleList {
  String? name;
  int? seatingCapacity;
  int? costPerKm;
  int? costPerHour;
  int? costPerDay;
  String? vehicleNumber;
  bool? availabilityStatus;
  Null? vehicleImagePath;
  String? createdAt;
  Null? createdById;
  String? updatedAt;
  Null? updatedById;
  String? deletedAt;
  Null? deletedById;
  Brand? brand;
  int? brandID;
  int? vehicleTypeID;
  Null? vehicleAmenities;
  Null? vehicleTypeDTO;
  int? id;

  VehicleList(
      {this.name,
      this.seatingCapacity,
      this.costPerKm,
      this.costPerHour,
      this.costPerDay,
      this.vehicleNumber,
      this.availabilityStatus,
      this.vehicleImagePath,
      this.createdAt,
      this.createdById,
      this.updatedAt,
      this.updatedById,
      this.deletedAt,
      this.deletedById,
      this.brand,
      this.brandID,
      this.vehicleTypeID,
      this.vehicleAmenities,
      this.vehicleTypeDTO,
      this.id});

  VehicleList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    seatingCapacity = json['seatingCapacity'];
    costPerKm = json['costPerKm'];
    costPerHour = json['costPerHour'];
    costPerDay = json['costPerDay'];
    vehicleNumber = json['vehicleNumber'];
    availabilityStatus = json['availabilityStatus'];
    vehicleImagePath = json['vehicleImagePath'];
    createdAt = json['createdAt'];
    createdById = json['createdById'];
    updatedAt = json['updatedAt'];
    updatedById = json['updatedById'];
    deletedAt = json['deletedAt'];
    deletedById = json['deletedById'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    brandID = json['brandID'];
    vehicleTypeID = json['vehicleTypeID'];
    vehicleAmenities = json['vehicleAmenities'];
    vehicleTypeDTO = json['vehicleTypeDTO'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['seatingCapacity'] = this.seatingCapacity;
    data['costPerKm'] = this.costPerKm;
    data['costPerHour'] = this.costPerHour;
    data['costPerDay'] = this.costPerDay;
    data['vehicleNumber'] = this.vehicleNumber;
    data['availabilityStatus'] = this.availabilityStatus;
    data['vehicleImagePath'] = this.vehicleImagePath;
    data['createdAt'] = this.createdAt;
    data['createdById'] = this.createdById;
    data['updatedAt'] = this.updatedAt;
    data['updatedById'] = this.updatedById;
    data['deletedAt'] = this.deletedAt;
    data['deletedById'] = this.deletedById;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['brandID'] = this.brandID;
    data['vehicleTypeID'] = this.vehicleTypeID;
    data['vehicleAmenities'] = this.vehicleAmenities;
    data['vehicleTypeDTO'] = this.vehicleTypeDTO;
    data['id'] = this.id;
    return data;
  }
}

class Brand {
  String? name;
  String? description;
  bool? isDeleted;
  int? id;

  Brand({this.name, this.description, this.isDeleted, this.id});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    isDeleted = json['isDeleted'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['isDeleted'] = this.isDeleted;
    data['id'] = this.id;
    return data;
  }
}
