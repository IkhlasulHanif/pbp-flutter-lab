import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});
  static List<Budget> budgetList = [];

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class Budget {
  String nama = "";
  double nominal = 0;
  String jenis = "";
  DateTime tanggal = DateTime.now();
  Budget(this.nama, this.nominal, this.jenis, this.tanggal);
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  double nominal = 0;
  String? tipeBudget;
  String jenis = "";
  DateTime selectDate = DateTime.now();
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),
      drawer: DrawerWidget(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Judul",

                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            judul = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            judul = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nominal",

                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            nominal = double.parse(value!);
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            nominal = double.parse(value!);
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      // padding: const EdgeInsets.all(25.0),
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        child: ListTile(
                          trailing: DropdownButton(
                            value: tipeBudget,
                            hint: const Text("Pilih Jenis"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: listJenis.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Center(
                                  child: Text(
                                    items,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                tipeBudget = newValue!;
                                jenis = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100),
                          ).then((value) {
                            setState(() {
                              selectDate = value!;
                            });
                          });
                        },
                        child: Text("Pilih Tanggal")),
                  ],
                ),
              ),
            ),
            Expanded(
              // <-- SEE HERE
              child: SizedBox.shrink(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                child: const Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final _budget =
                        new Budget(judul, nominal, jenis, selectDate);
                    MyFormPage.budgetList.add(_budget);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
