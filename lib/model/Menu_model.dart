class MenuApi {
  int? id;
  String? namaMenu;
  int? harga;
  String? foto;
  String? statusStok;
  int? idKantin;
  Null? diskon;
  String? createdAt;
  String? updatedAt;
  Null? kantins;

  MenuApi(
      {this.id,
      this.namaMenu,
      this.harga,
      this.foto,
      this.statusStok,
      this.idKantin,
      this.diskon,
      this.createdAt,
      this.updatedAt,
      this.kantins});

  MenuApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaMenu = json['nama_menu'];
    harga = json['harga'];
    foto = json['foto'];
    statusStok = json['status_stok'];
    idKantin = json['id_kantin'];
    diskon = json['diskon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kantins = json['kantins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_menu'] = this.namaMenu;
    data['harga'] = this.harga;
    data['foto'] = this.foto;
    data['status_stok'] = this.statusStok;
    data['id_kantin'] = this.idKantin;
    data['diskon'] = this.diskon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['kantins'] = this.kantins;
    return data;
  }
}
