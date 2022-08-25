

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/post_model.dart';
import '../services/network_service.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with  Store{

  @observable
  List<Post>  items = [];
  @observable
  bool isLoading = false;


  Future getApiPosts() async {
    isLoading = true;
    String? response = await NetworkService.GET(NetworkService.apiPosts, NetworkService.headers);
    items = postListFromJson(response);
    isLoading = false;

  }


  void edit(BuildContext context){}

  void delete(BuildContext context){}



}