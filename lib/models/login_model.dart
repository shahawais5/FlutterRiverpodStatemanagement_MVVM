class AuthModel {
  int? expiresIn;
  String? orgName;
  String? accessToken;
  User? user;
  String? status;
  Map<String, dynamic> additionalProperties = {};

  AuthModel({
    this.expiresIn,
    this.orgName,
    this.accessToken,
    this.user,
    this.status,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    expiresIn = json['expiresIn'] ?? 0;
    orgName = json['orgName'] ?? '';
    accessToken = json['accessToken'] ?? '';
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    status = json['status'] ?? '';

    // Store additional unknown properties
    json.forEach((key, value) {
      if (!toJson().containsKey(key)) {
        additionalProperties[key] = value;
      }
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expiresIn'] = expiresIn;
    data['orgName'] = orgName;
    data['accessToken'] = accessToken;
    data['status'] = status;

    if (user != null) {
      data['user'] = user!.toJson();
    }

    // Add additional properties
    additionalProperties.forEach((key, value) {
      data[key] = value;
    });

    return data;
  }
}

class User {
  int? id;
  int? createdAt;
  int? updatedAt;
  bool? deleted;
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? orgName;
  String? pictureUrl;
  bool? termsAgreed;
  bool? privacyAgreed;
  String? authTenantId;
  String? fullName;
  String? uid;
  bool? emailVerified;
  String? tenantId;
  String? mobilePhone;
  Map<String, dynamic> lastOrgAccessed = {};
  Map<String, dynamic> additionalProperties = {};

  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.orgName,
    this.pictureUrl,
    this.termsAgreed,
    this.privacyAgreed,
    this.authTenantId,
    this.fullName,
    this.uid,
    this.emailVerified,
    this.tenantId,
    this.mobilePhone,
    this.lastOrgAccessed = const {},
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    createdAt = json['createdAt'] ?? 0;
    updatedAt = json['updatedAt'] ?? 0;
    deleted = json['deleted'] ?? false;
    userId = json['userId'] ?? '';
    firstName = json['firstName'] ?? '';
    lastName = json['lastName'] ?? '';
    email = json['email'] ?? '';
    role = json['role'] ?? '';
    orgName = json['orgName'] ?? '';
    pictureUrl = json['pictureUrl'] ?? '';
    termsAgreed = json['termsAgreed'] ?? false;
    privacyAgreed = json['privacyAgreed'] ?? false;
    authTenantId = json['authTenantId'] ?? '';
    fullName = json['fullName'] ?? '';
    uid = json['uid'] ?? '';
    emailVerified = json['emailVerified'] ?? false;
    tenantId = json['tenantId'] ?? '';
    mobilePhone = json['mobilePhone'] ?? '';

    // Store lastOrgAccessed details if available
    lastOrgAccessed = json['lastOrgAccessed'] ?? {};

    // Store additional unknown properties
    json.forEach((key, value) {
      if (!toJson().containsKey(key)) {
        additionalProperties[key] = value;
      }
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deleted'] = deleted;
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['role'] = role;
    data['orgName'] = orgName;
    data['pictureUrl'] = pictureUrl;
    data['termsAgreed'] = termsAgreed;
    data['privacyAgreed'] = privacyAgreed;
    data['authTenantId'] = authTenantId;
    data['fullName'] = fullName;
    data['uid'] = uid;
    data['emailVerified'] = emailVerified;
    data['tenantId'] = tenantId;
    data['mobilePhone'] = mobilePhone;
    data['lastOrgAccessed'] = lastOrgAccessed;

    // Add additional properties
    additionalProperties.forEach((key, value) {
      data[key] = value;
    });

    return data;
  }
}