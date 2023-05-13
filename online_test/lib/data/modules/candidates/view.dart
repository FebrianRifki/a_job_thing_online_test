import 'package:flutter/material.dart';
import 'package:online_test/data/models/candidates.dart';
import 'package:online_test/data/modules/candidates/controller.dart';
import 'package:online_test/data/modules/widget/common_list_view_layout.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateView extends StatefulWidget {
  final Candidate candidate;
  const CandidateView({required this.candidate, super.key});

  @override
  State<CandidateView> createState() => _CandidateViewState();
}

class _CandidateViewState extends State<CandidateView> {
  final CandidateController candidateController =
      Get.find<CandidateController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    candidateController.getDetailData(widget.candidate);
  }

  @override
  Widget build(BuildContext context) {
    return CommonListViewLayout(
      hasAppBar: true,
      appbarTitle: 'Candidate Detail Page',
      children: [
        Obx(
          () {
            if (candidateController.isErrorRequest.value == true) {
              return AlertDialog(
                title: const Text('Request Error'),
                content:
                    const Text('Something went wrong when requesting data'),
                actions: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        candidateController.getDetailData(widget.candidate);
                      },
                      child: const Text('Retry'),
                    ),
                  ),
                ],
              );
            } else {
              if (candidateController.isProcessingData.value == true) {
                return const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(widget.candidate.photo),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3))
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Name :',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(widget.candidate.name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Gender :',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    widget.candidate.gender == "m"
                                        ? const Text('Male',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))
                                        : const Text('Female',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Email :',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: (() {
                                      candidateController.sendEmail(
                                          candidateController
                                              .candidateEmail.value.email);
                                    }),
                                    child: Text(
                                        candidateController
                                            .candidateEmail.value.email,
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Phone Number :',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        candidateController.openWhatsApp(
                                            candidateController
                                                .candidateEmail.value.phone);
                                      },
                                      child: Text(
                                          candidateController
                                              .candidateEmail.value.phone,
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Address :',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                        candidateController
                                            .candidateAddress.value.address,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Zip Code :',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        candidateController
                                            .candidateAddress.value.zipCode
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Birthday :',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(widget.candidate.brithDay.toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Expired :',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(widget.candidate.expired.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            }
          },
        )
      ],
    );
  }
}
// class CandidateView extends GetView<CandidateController> {
//   final Candidate candidate;
//   const CandidateView({required this.candidate, super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return CommonListViewLayout(
  //     children: [
  //       Obx(
  //         () {
  //           if (controller.isProcessingData.value == true) {
  //             return const Padding(
  //               padding: EdgeInsets.only(top: 10.0),
  //               child: Center(
  //                 child: SizedBox(
  //                   height: 50,
  //                   width: 50,
  //                   child: CircularProgressIndicator(),
  //                 ),
  //               ),
  //             );
  //           } else {
  //             return Padding(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
  //               child: Column(
  //                 children: [
  //                   Center(
  //                     child: CircleAvatar(
  //                       radius: 70,
  //                       backgroundImage: NetworkImage(candidate.photo),
  //                     ),
  //                   ),
  //                   SizedBox(height: MediaQuery.of(context).size.height * 0.05),
  //                   Container(
  //                     decoration:
  //                         BoxDecoration(color: Colors.white, boxShadow: [
  //                       BoxShadow(
  //                           color: Colors.grey.withOpacity(0.5),
  //                           spreadRadius: 5,
  //                           blurRadius: 7,
  //                           offset: Offset(0, 3))
  //                     ]),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(15.0),
  //                       child: Column(
  //                         children: [
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               const Text(
  //                                 'Name :',
  //                                 style: TextStyle(
  //                                     fontSize: 15,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                               Text(candidate.name,
  //                                   style: const TextStyle(
  //                                       fontSize: 15,
  //                                       fontWeight: FontWeight.bold))
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             );
  //           }
  //         },
  //       )
  //     ],
  //   );
  // }
// }
