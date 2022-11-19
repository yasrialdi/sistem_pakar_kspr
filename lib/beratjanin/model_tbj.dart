class DataTBJ {
  final String id_tbj;
  final String tfu;
  final String nilai_n;
  final String nilai_tbj;

  DataTBJ({
    required this.id_tbj,
    required this.tfu,
    required this.nilai_n,
    required this.nilai_tbj
  });

  factory DataTBJ.fromJson(Map<String, dynamic> json) {
    return DataTBJ(
      id_tbj: json['id_tbj'],
      tfu: json['tfu'],
      nilai_n: json['nilai_n'],
      nilai_tbj: json['nilai_tbj']
    );
  }
}
