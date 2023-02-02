import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sistem_pakar_kspr/admin/home/diagnosa/ModelDiagnosa.dart';

import 'ModelRiwayat.dart';

class RepositoryRiwayat {

  final UrlGetDataRiwayatt = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_riwayat.php';
  final UrlGetDataRiwayatUserr = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_riwayat_user.php';
  final UrlGetDataRiwayatPengguna = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_riwayat_user.php';
  final UrlGetDataPersentaseCF = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_persentase_cf.php';
  final UrlGetDataPersentaseFC = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_persentase_fc.php';
  final UrlGetDataRegisterUser = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_count_pengguna.php';

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

  Future<List<DataRiwayat>?> getDataRiwayatUser() async {
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

  Future getDataPersentaseRiwayatCF() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDataPersentaseCF));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['persentase'];
        List<DataRiwayat> dataRiwayat = it.map((e) => DataRiwayat.fromJson(e)).toList();
        return dataRiwayat;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDataJumlahRegister() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDataRegisterUser));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['aturan'];
        List<DataRiwayat> dataRiwayat = it.map((e) => DataRiwayat.fromJson(e)).toList();
        return dataRiwayat;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDataPersentaseRiwayatFC() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDataPersentaseFC));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['persentase'];
        List<DataRiwayat> dataRiwayat = it.map((e) => DataRiwayat.fromJson(e)).toList();
        return dataRiwayat;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future getDataRiwayatUser() async {
  //   try {
  //     final response = await http.get(Uri.parse(UrlGetDataRiwayatUserr));
  //
  //     if (response.statusCode == 200) {
  //       Iterable it = jsonDecode(response.body);
  //       List<DataRiwayat> dataRiwayat = it.map((e) => DataRiwayat.fromJson(e)).toList();
  //       return dataRiwayat;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future postDataGetRiwayatPengguna(
      String id_pengguna) async {
    try {
      final response = await http.post(Uri.parse(UrlGetDataRiwayatPengguna),
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
