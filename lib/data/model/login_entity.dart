class LoginEntity {
	int code;
	String jwt;
	String expiredDate;
	LoginUser user;

	LoginEntity({this.code, this.jwt, this.expiredDate, this.user});

	LoginEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		jwt = json['jwt'];
		expiredDate = json['expiredDate'];
		user = json['user'] != null ? new LoginUser.fromJson(json['user']) : null;
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

class LoginUser {
	LoginUserRole role;
	bool blocked;
	String provider;
	int id;
	String uuid;
	bool confirmed;
	String email;
	String username;

	LoginUser({this.role, this.blocked, this.provider, this.id, this.uuid, this.confirmed, this.email, this.username});

	LoginUser.fromJson(Map<String, dynamic> json) {
		role = json['role'] != null ? new LoginUserRole.fromJson(json['role']) : null;
		blocked = json['blocked'];
		provider = json['provider'];
		id = json['id'];
		uuid = json['uuid'];
		confirmed = json['confirmed'];
		email = json['email'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.role != null) {
      data['role'] = this.role.toJson();
    }
		data['blocked'] = this.blocked;
		data['provider'] = this.provider;
		data['id'] = this.id;
		data['uuid'] = this.uuid;
		data['confirmed'] = this.confirmed;
		data['email'] = this.email;
		data['username'] = this.username;
		return data;
	}
}

class LoginUserRole {
	String name;
	String description;
	int id;
	String type;

	LoginUserRole({this.name, this.description, this.id, this.type});

	LoginUserRole.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		description = json['description'];
		id = json['id'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['description'] = this.description;
		data['id'] = this.id;
		data['type'] = this.type;
		return data;
	}
}
