
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/error_text_widget.dart';
import '../../../home/ui/bloc/balance_bloc.dart';
import '../../data/model/card.dart';
import '../../data/repository/card_repository.dart';

class BillingDetails extends StatefulWidget {
  const BillingDetails({Key? key, required this.card});//required this.cardOwnerName, required this.cardNum, required this.cardExpiryDate}) : super(key: key);

  final CCard card;//String cardOwnerName, cardNum, cardExpiryDate;

  @override
  State<BillingDetails> createState() => _BillingDetailsState();
}

class _BillingDetailsState extends State<BillingDetails> {
  double _amount = 0.0;
  var _errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ErrorTextWidget(errorMsg: _errorMsg),
        Row(
            children: [
              Text(
                  "Name: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  )
              ),
              Text(widget.card.name)
            ]
        ),
        Row(
            children: [
              Text(
                  "Card Number: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  )
              ),
              Text(truncatedCardNum())
            ]
        ),
        Row(
            children: [
              Text(
                  "Expiry Date: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  )
              ),
              Text(widget.card.expiryDate)
            ]
        ),
        SizedBox(height: 10,),
        TextField(
          onChanged: (newValue){
            setState(()=>_amount = double.parse(newValue));
          },
          decoration: const InputDecoration(
              labelText: "Amount (NGN)",
              border: OutlineInputBorder()
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        ElevatedButton(
          onPressed: (){
            if(_amount < 0.0 || _amount > 1000000){
              setState(() {
                _errorMsg = "You entered an invalid amount";
              });
              return;
            }
            //saveCardDetails
            context.read<CardRepository>().saveCard(widget.card);
            //increment balance
            context.read<BalanceBloc>().addToBalance(_amount);
            //close modal
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: FutureBuilder(
                      future: Future.delayed(
                        Duration(seconds: 5),
                          ()=>"Successful"
                      ),
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(content: Text("Wallet Funded Successfully"))
                          // );
                          Navigator.pop(context);
                        }
                        return SizedBox(
                            width:60,
                            height:60,
                            child: CircularProgressIndicator()
                        );
                      },
                    ),
                  );
                }
            );
          },
          child: Text("Complete Transaction"),
        )
      ],
    );
  }

  String truncatedCardNum() => widget.card.number.replaceRange(4, widget.card.number.length-4, "******");
}
