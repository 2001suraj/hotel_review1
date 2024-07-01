import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:review_app/data/model/hotel_model.dart';

class HotelRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<HotelModel>> gethotel() async {
    List<HotelModel> hotel = [];
    try {
      final response = await FirebaseFirestore.instance.collection('all_hotel').get();

      for (var element in response.docs) {
        // Convert each document to a HotelModel instance and add it to the list
        hotel.add(HotelModel.fromMap(element.data()));
      }
      return hotel;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('failed with error:${e.code}:${e.message}');
      }
      return hotel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<HotelModel>> popular() async {
    List<HotelModel> hotel = [];
    try {
      final response = await FirebaseFirestore.instance.collection('all_hotel').where('category', isEqualTo: 'popular').get();

      for (var element in response.docs) {
        hotel.add(HotelModel.fromMap(element.data()));
      }
      return hotel;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Failed with error: ${e.code}: ${e.message}');
      }
      return hotel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<List<HotelModel>> popular() async {
  //   List<HotelModel> hotel = [];
  //   try {
  //     final response =
  //         // await FirebaseFirestore.instance.collection('all_hotel').get();
  //         await FirebaseFirestore.instance.collection('all_hotel').where('category', isEqualTo: 'popular').get();
  //     for (var element in response.docs) {
  //       continue;
  //     }
  //     return hotel;
  //   } on FirebaseException catch (e) {
  //     if (kDebugMode) {
  //       print('failed with error:${e.code}:${e.message}');
  //     }
  //     return hotel;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
  Future<List<HotelModel>> nearyou() async {
    List<HotelModel> hotel = [];
    try {
      final response = await FirebaseFirestore.instance.collection('all_hotel').where('category', isEqualTo: 'nearyou').get();

      for (var element in response.docs) {
        hotel.add(HotelModel.fromMap(element.data()));
      }
      return hotel;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Failed with error: ${e.code}: ${e.message}');
      }
      return hotel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<List<HotelModel>> nearyou() async {
  //   List<HotelModel> hotel = [];
  //   try {
  //     final response =
  //         // await FirebaseFirestore.instance.collection('all_hotel').get();
  //         await FirebaseFirestore.instance.collection('all_hotel').where('category', isEqualTo: 'nearyou').get();
  //     for (var element in response.docs) {
  //       continue;
  //     }
  //     return hotel;
  //   } on FirebaseException catch (e) {
  //     if (kDebugMode) {
  //       print('failed with error:${e.code}:${e.message}');
  //     }
  //     return hotel;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  Future<List<HotelModel>> advanture() async {
    List<HotelModel> hotel = [];
    try {
      final response =
          // await FirebaseFirestore.instance.collection('all_hotel').get();
          await FirebaseFirestore.instance.collection('all_hotel').where('category', isEqualTo: 'advanture').get();
      for (var element in response.docs) {
        continue;
      }
      return hotel;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('failed with error:${e.code}:${e.message}');
      }
      return hotel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
