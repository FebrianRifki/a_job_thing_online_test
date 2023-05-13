import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_test/data/models/address.dart';
import 'package:online_test/data/models/candidates_status.dart';
import 'package:online_test/data/models/email.dart';
import 'package:online_test/data/provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateController extends GetxController {
  Rx<Email> candidateEmail = Email(id: 0, email: '', phone: '').obs;
  Rx<CandidateStatus> candidateStatus = CandidateStatus(
    id: 0,
    companyName: '',
    industry: '',
    jobTitle: '',
    status: '',
  ).obs;
  Rx<Address> candidateAddress =
      Address(id: 0, address: '', city: '', state: '', zipCode: 0).obs;
  List<Address> addressList = [];
  List<CandidateStatus> candidateStatusList = [];
  List<Email> emailList = [];
  Provider provider = Provider();
  RxBool isErrorRequest = false.obs;
  RxBool isProcessingData = false.obs;

  fetchEmailList() async {
    var data = await provider.getListEmail();
    if (data.isNotEmpty) {
      emailList.assignAll(data);
    } else {
      isErrorRequest.value = true;
    }
    return emailList;
  }

  fetchAdressList() async {
    var data = await provider.getListAddress();
    if (data.isNotEmpty) {
      addressList.assignAll(data);
    } else {
      isErrorRequest.value = true;
    }
    return addressList;
  }

  fetchCandidateStatus() async {
    var data = await provider.getListCandidateStatus();
    if (data.isNotEmpty) {
      candidateStatusList.assignAll(data);
    } else {
      isErrorRequest.value = true;
    }
    return candidateStatusList;
  }

  getDetailData(dynamic element) async {
    isProcessingData.value = true;
    await fetchEmailList();
    await fetchAdressList();
    await fetchCandidateStatus();
    candidateEmail.value = emailList.singleWhere(
        (email) => email.id == element.id,
        orElse: () => candidateEmail.value);
    candidateStatus.value = candidateStatusList.singleWhere(
        (candidateStatus) => candidateStatus.id == element.id,
        orElse: () => candidateStatus.value);
    candidateAddress.value = addressList.singleWhere(
        (address) => address.id == element.id,
        orElse: () => candidateAddress.value);
    isProcessingData.value = false;
  }

  void openWhatsApp(String phoneNumber) async {
    String formattedPhoneNumber =
        phoneNumber.replaceAll(' ', '').replaceAll('-', '');
    String message = Uri.encodeComponent("Hi, I am MK company");
    String url = "https://wa.me/$formattedPhoneNumber/?text=$message";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void sendEmail(String emailAddress) async {
    String subject = 'Hello';
    String body = 'Hi, I am MK company';

    String url =
        'mailto:$emailAddress?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
