
class PaymentsModel {

   String? id;
   String? paymentId;
   String? amount;
   String? status;
   int? createdAt;
   List? cart;

  PaymentsModel({this.id, this.paymentId, this.amount, this.status, this.createdAt, this.cart});

  PaymentsModel.fromMap(Map data){
    id = data["id"];
    createdAt = data["createdAt"];
    paymentId = data["paymentId"];
    amount = data["amount"];
    status = data["status"];
    cart = data["cart"];
  }
}