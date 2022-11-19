import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sistem_pakar_kspr/admin/home/diagnosa/ModelDiagnosa.dart';

import 'ModelRiwayat.dart';

class RepositoryRiwayat {

  final UrlGetDataRiwayatt = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_riwayat.php';
  final UrlGetDataRiwayatUserr = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_riwayat_user.php';

  Future getDataRiwayat() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDataRiwayatt));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataRiwayat> dataRiwayat = it.map((e) => DataRiwayat.fromJson(e)).toList();
        return dataRiwayat;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDataRiwayatUser() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDataRiwayatUserr));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataRiwayat> dataRiwayat = it.map((e) => DataRiwayat.fromJson(e)).toList();
        return dataRiwayat;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postDataTambahUsiaKandungan(
      String id_pengguna) async {
    try {
      final response = await http.post(Uri.parse(UrlGetDataRiwayatUserr),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "id_pengguna": id_pengguna,
          }));
      print(response.request);
      return json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
