class RegisterEntity {
	int code;
	String jwt;
	String expiredDate;
	RegisterUser user;

	RegisterEntity({this.code, this.jwt, this.expiredDate, this.user});

	RegisterEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		jwt = json['jwt'];
		expiredDate = json['expiredDate'];
		user = json['user'] != null ? new RegisterUser.fromJson(json['user']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['jwt'] = this.jwt;
		data['expiredDate'] = this.expiredDate;
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		return data;
	}
}

class RegisterUser {
	int role;
	String provider;
	int id;
	String uuid;
	bool confirmed;
	String email;
	String username;

	RegisterUser({this.role, this.provider, this.id, this.uuid, this.confirmed, this.email, this.username});

	RegisterUser.fromJson(Map<String, dynamic> json) {
		role = json['role'];
		provider = json['provider'];
		id = json['id'];
		uuid = json['uuid'];
		confirmed = json['confirmed'];
		email = json['email'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['role'] = this.role;
		data['provider'] = this.provider;
		data['id'] = this.id;
		data['uuid'] = this.uuid;
		data['confirmed'] = this.confirmed;
		data['email'] = this.email;
		data['username'] = this.username;
		return data;
	}
}
