import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

List<Widget> listOfCards = [];

class BudgetCard extends StatelessWidget {
  String judul;
  int nominal;
  String jenis;
  BudgetCard({Key? key, required this.judul, required this.nominal, required this.jenis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black38.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          )]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Text(judul, style: const TextStyle(
              fontSize: 20,
            ),),
          ),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(nominal.toString(), style: const TextStyle(
                        fontSize: 13
                    ),),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(jenis, style: const TextStyle(
                        fontSize: 13
                    ), textAlign: TextAlign.right,),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int nominal = 0;
  String? jenis;
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Judul",
                          border: OutlineInputBorder()
                      ),
                      onSaved: (String? value){
                        setState(() {
                          judul = value!;
                        });
                      },
                      onChanged: (String? value){
                        setState(() {
                          judul = value!;
                        });
                      },
                      validator: (String? value){
                        if (value == null || value.isEmpty){
                          return "Judul tak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Nominal",
                          border: OutlineInputBorder()
                      ),
                      onSaved: (String? value){
                        setState(() {
                          nominal = int.parse(value!);
                        });
                      },
                      onChanged: (String? value){
                        setState(() {
                          nominal = int.parse(value!);
                        });
                      },
                      validator: (String? value){
                        if (value == null || value.isEmpty){
                          return "Nominal tak boleh kosong";
                        } else if (int.tryParse(value) == null){
                          return "Nominal berupa angka";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    DropdownButton(
                      value: jenis,
                      hint: const Text('Pilih Jenis'),
                      items: listJenis.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue){
                        setState(() {
                          jenis = newValue!;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      listOfCards.add(BudgetCard(judul: judul, nominal: nominal, jenis: jenis!));
                      showDialog(context: context, builder: (context){
                        return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: ListView(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: [
                                const Center(child: Text('Data telah dimasukkan')),
                                SizedBox(height: 5,),
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text('Kembali'))
                              ],
                            ));
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Text("Simpan", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ),
          ),],
      ),
    );
  }
}