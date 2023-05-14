import 'dart:convert';

import 'package:http/http.dart';
import 'package:online_test/data/models/address.dart';
import 'package:online_test/data/models/blog.dart';
import 'package:online_test/data/models/candidates.dart';
import 'package:online_test/data/models/candidates_status.dart';
import 'package:online_test/data/models/email.dart';

class Provider {
  getListCandidate() async {
    try {
      var url = Uri.https(
          'private-b9a758-candidattest.apiary-mock.com', '/candidates');
      Response res = await get(url);
      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        List<Map<String, dynamic>> responseData =
            List.castFrom(response['results']);
        List<Candidate> candidates = responseData
            .map((dynamic candidate) => Candidate.fromJson(candidate))
            .toList();
        return candidates;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  getListBlog() async {
    try {
      var url =
          Uri.https('private-b9a758-candidattest.apiary-mock.com', '/blogs');
      Response res = await get(url);
      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        List<Map<String, dynamic>> responseData =
            List.castFrom(response['results']);
        List<Blog> blogs =
            responseData.map((dynamic blog) => Blog.fromJson(blog)).toList();
        return blogs;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  getListAddress() async {
    try {
      var url =
          Uri.https('private-b9a758-candidattest.apiary-mock.com', '/address');
      Response res = await get(url);
      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        List<Map<String, dynamic>> responseData =
            List.castFrom(response['results']);
        List<Address> addressList = responseData
            .map((dynamic address) => Address.fromJson(address))
            .toList();
        return addressList;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  getListEmail() async {
    try {
      var url =
          Uri.https('private-b9a758-candidattest.apiary-mock.com', '/emails');
      Response res = await get(url);
      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        List<Map<String, dynamic>> responseData =
            List.castFrom(response['results']);
        List<Email> emailList =
            responseData.map((dynamic email) => Email.fromJson(email)).toList();
        return emailList;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  getListCandidateStatus() async {
    try {
      var url = Uri.https(
          'private-b9a758-candidattest.apiary-mock.com', '/experiences');
      Response res = await get(url);
      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        List<Map<String, dynamic>> responseData =
            List.castFrom(response['results']);
        List<CandidateStatus> candidateStatusList = responseData
            .map((dynamic candidateStatus) =>
                CandidateStatus.fromJson(candidateStatus))
            .toList();
        return candidateStatusList;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
