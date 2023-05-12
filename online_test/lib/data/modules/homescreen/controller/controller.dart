import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_test/data/models/blog.dart';
import 'package:online_test/data/models/candidates.dart';
import 'package:online_test/data/provider/provider.dart';

class HomeScreenController extends GetxController {
  var listCandidate = [].obs;
  var blog = [].obs;
  var shuffleList = [].obs;
  RxBool isErrorRequest = false.obs;
  RxBool isLoadingShuffelData = false.obs;
  Provider provider = Provider();

  @override
  void onInit() {
    super.onInit();
    getAllData();
  }

  fetchCandidateData() async {
    var data = await provider.getListCandidate();
    if (data.isNotEmpty) {
      listCandidate.assignAll(data);
    } else {
      isErrorRequest.value = true;
    }
    return listCandidate;
  }

  fetchBlogData() async {
    var data = await provider.getListBlog();
    if (data.isNotEmpty) {
      blog.assignAll(data);
    } else {
      isErrorRequest.value = true;
    }
    return blog;
  }

  void getAllData() async {
    isLoadingShuffelData.value = true;
    var candidates = await fetchCandidateData();
    var blogs = await fetchBlogData();
    shuffleList.addAll(candidates);
    shuffleList.addAll(blogs);
    final random = Random();
    shuffleList.shuffle(random);
    isLoadingShuffelData.value = false;
  }

  searchData(String searchQuery) {
    List<dynamic> candidateAndBlogList = shuffleList.toList();
    shuffleList.value = [];
    candidateAndBlogList.where((item) {
      if (item is Candidate) {
        Candidate candidate = item;
        if (candidate.name.toLowerCase().contains(searchQuery.toLowerCase())) {
          shuffleList.add(item);
        }
      } else if (item is Blog) {
        Blog blog = item;
        if (blog.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            blog.author.toLowerCase().contains(searchQuery.toLowerCase())) {
          shuffleList.add(item);
        }
      }
      return false;
    }).toList();
  }
}
