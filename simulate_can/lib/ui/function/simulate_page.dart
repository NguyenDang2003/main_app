import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:simulate_can/var.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SimulatePage extends StatefulWidget {
  const SimulatePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SimulateUIstate();
  }
}

class _SimulateUIstate extends State<SimulatePage> {
  // Hàm gửi dữ liệu
  void sendData(String addr, String field, String value) async {
    final url = Uri.parse('http://127.0.0.1:8000/send'); // thay <raspi-ip>

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'addr': addr, 'field': field, 'value': value}),
      );

      if (response.statusCode == 200) {
        print('✅ Gửi thành công tới $addr: $field = $value');
      } else {
        print('❌ Lỗi khi gửi: ${response.body}');
      }
    } catch (e) {
      print('❌ Lỗi kết nối: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "WAVEFORM SIMULATION",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Tiêu đề "Engine Setup"
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.red,
                  child: Text(
                    'ENGINE SETUP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 10),
                // Tiêu đề "Engine Speed"
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey[300],
                  child: Text(
                    'Engine Speed',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Thanh kéo tốc độ
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Speed', style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Slider(
                        value: crankValue,
                        min: 500,
                        max: 6000,
                        divisions: 110,
                        label: crankValue.toInt().toString(),
                        activeColor: Colors.red, // Màu của phần đã trượt
                        inactiveColor:
                            Colors.red.shade100, // Màu của phần chưa trượt
                        onChanged: (value) {
                          setState(() {
                            crankValue = value;

                            sendData('2', 'rpm', crankValue.toInt().toString());
                          });
                        },
                      ),
                    ),
                    Text(
                      '${crankValue.toInt()} rpm',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                // CRANKSHAFT GEAR SETUP
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey[300],
                  child: Text(
                    'CRANKSHAFT GEAR SETUP',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Nhập số teeth
                Center(
                  child: SizedBox(
                    width: 500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ideal Teeth Count',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 60,
                          child: TextField(
                            controller: teethController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(hintText: '36'),
                            // onChanged: (value) {
                            //   final teeth = int.tryParse(value);
                            //   if (teeth != null) {
                            //     sendData('2', 'bate', teeth.toString());
                            //   }
                            // },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Teeth Gap', style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 60,
                          child: TextField(
                            controller: gapteethController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(hintText: '0'),
                            // onChanged: (value) {
                            //   final gap = int.tryParse(value);
                            //   if (gap != null) {
                            //     sendData('2', 'gap', gap.toString());
                            //   }
                            // },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        crksending = !crksending;
                        if (crksending == true) {
                          if (teethController.text.trim().isNotEmpty) {
                            sendData('2', 'bate', teethController.text.trim());
                          } else {
                            sendData('2', 'bate', '36');
                          }
                          if (gapteethController.text.trim().isNotEmpty) {
                            sendData(
                              '2',
                              'gap',
                              gapteethController.text.trim(),
                            );
                          } else {
                            sendData('2', 'gap', '4');
                          }
                          sendData('2', 'crksend', '1');
                        }
                        crksending = !crksending;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Button vuông
                      ),
                    ),
                    child: Text(
                      'SEND SIGNAL',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey[300],
                  child: Text(
                    'CAMSHAFT GEAR SETUP',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Nhập số teeth cam induct và cam hall dùng chung biến
                ScrollConfiguration(
                  behavior: MaterialScrollBehavior().copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            // const SizedBox(height: 20),
                            // Container(
                            //   padding: EdgeInsets.all(10),
                            //   decoration: BoxDecoration(
                            //     color: Colors.redAccent,
                            //   ),
                            //   child: Text(
                            //     "INDUCTIVE CAMSHAFT SIGNAL",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold,
                            //       fontFamily: "Roboto",
                            //       fontSize: 15,
                            //     ),
                            //   ),
                            // ),
                            Center(
                              child: SizedBox(
                                width: 260,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Number of Teeth',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 60,
                                      child: TextField(
                                        controller: numCampInducteethController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        decoration: InputDecoration(
                                          hintText: '3',
                                        ),
                                        // onChanged: (value) {
                                        //   final numcamInduct = int.tryParse(
                                        //     value,
                                        //   );
                                        //   if (numcamInduct != null) {
                                        //     sendData(
                                        //       '2',
                                        //       'numcaminduct',
                                        //       numcamInduct.toString(),
                                        //     );
                                        //   }
                                        // },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                width: 260,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cam IN Crank Offset',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 60,
                                      child: TextField(
                                        controller: difInCampCrkInducController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        decoration: InputDecoration(
                                          hintText: '0',
                                        ),
                                        // onChanged: (value) {
                                        //   final difin = int.tryParse(value);
                                        //   if (difin != null) {
                                        //     sendData(
                                        //       '2',
                                        //       'difin',
                                        //       difin.toString(),
                                        //     );
                                        //   }
                                        // },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                width: 260,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cam EX Crank Offset',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 60,
                                      child: TextField(
                                        controller: difExCampCrkInducController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        decoration: InputDecoration(
                                          hintText: '0',
                                        ),
                                        // onChanged: (value) {
                                        //   final difex = int.tryParse(value);
                                        //   if (difex != null) {
                                        //     sendData(
                                        //       '2',
                                        //       'difout',
                                        //       difex.toString(),
                                        //     );
                                        //   }
                                        // },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Teeth Width",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(width: 50),
                                    Text(
                                      "Gap Width",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 360,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '1st',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      teeth1widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camteeth1 =
                                                  //       int.tryParse(value);
                                                  //   if (camteeth1 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camteeth1',
                                                  //       camteeth1.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      gap1widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camgap1 =
                                                  //       int.tryParse(value);
                                                  //   if (camgap1 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camgap1',
                                                  //       camgap1.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 360,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: Text(
                                            '2nd',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      teeth2widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camteeth2 =
                                                  //       int.tryParse(value);
                                                  //   if (camteeth2 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camteeth2',
                                                  //       camteeth2.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      gap2widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camgap2 =
                                                  //       int.tryParse(value);
                                                  //   if (camgap2 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camgap2',
                                                  //       camgap2.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 360,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: Text(
                                            '3rd',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      teeth3widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camteeth3 =
                                                  //       int.tryParse(value);
                                                  //   if (camteeth3 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camteeth3',
                                                  //       camteeth3.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      gap3widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camgap2 =
                                                  //       int.tryParse(value);
                                                  //   if (camgap2 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camgap2',
                                                  //       camgap2.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 360,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: Text(
                                            '4th',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      teeth4widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camteeth4 =
                                                  //       int.tryParse(value);
                                                  //   if (camteeth4 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camteeth4',
                                                  //       camteeth4.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      gap4widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camgap4 =
                                                  //       int.tryParse(value);
                                                  //   if (camgap4 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camgap4',
                                                  //       camgap4.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Center(
                                  child: SizedBox(
                                    width: 360,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: Text(
                                            '5th',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      teeth5widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camteeth5 =
                                                  //       int.tryParse(value);
                                                  //   if (camteeth5 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camteeth5',
                                                  //       camteeth5.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      gap5widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camgap5 =
                                                  //       int.tryParse(value);
                                                  //   if (camgap5 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camgap5',
                                                  //       camgap5.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 360,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: Text(
                                            '6th',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      teeth6widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camteeth6 =
                                                  //       int.tryParse(value);
                                                  //   if (camteeth6 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camteeth6',
                                                  //       camteeth6.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      gap6widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camgap6 =
                                                  //       int.tryParse(value);
                                                  //   if (camgap6 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camgap6',
                                                  //       camgap6.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 360,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: Text(
                                            '7th',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      teeth7widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camteeth7 =
                                                  //       int.tryParse(value);
                                                  //   if (camteeth7 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camteeth7',
                                                  //       camteeth7.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      gap7widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camgap7 =
                                                  //       int.tryParse(value);
                                                  //   if (camgap7 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camgap7',
                                                  //       camgap7.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 360,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: Text(
                                            '8th',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      teeth8widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camteeth8 =
                                                  //       int.tryParse(value);
                                                  //   if (camteeth8 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camteeth8',
                                                  //       camteeth8.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      gap8widthController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                    TextInputFormatter
                                                  >[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  // onChanged: (value) {
                                                  //   final camgap8 =
                                                  //       int.tryParse(value);
                                                  //   if (camgap8 != null) {
                                                  //     sendData(
                                                  //       '2',
                                                  //       'camgap8',
                                                  //       camgap8.toString(),
                                                  //     );
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 200,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        caminductsend = !caminductsend;
                                        if (caminductsend == true) {
                                          if (numCampInducteethController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "numcaminduct",
                                              numCampInducteethController.text
                                                  .trim(),
                                            );
                                          } else {
                                            sendData("2", "numcaminduct", '0');
                                          }

                                          if (difInCampCrkInducController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "difin",
                                              difInCampCrkInducController.text
                                                  .trim(),
                                            );
                                          } else {
                                            sendData("2", "difin", '0');
                                          }

                                          if (difExCampCrkInducController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "difout",
                                              difExCampCrkInducController.text
                                                  .trim(),
                                            );
                                          } else {
                                            sendData("2", "difout", '0');
                                          }

                                          if (teeth1widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camteeth1",
                                              teeth1widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camteeth1", '0');
                                          }

                                          if (gap1widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camgap1",
                                              gap1widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camgap1", '0');
                                          }

                                          if (teeth2widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camteeth2",
                                              teeth2widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camteeth2", '0');
                                          }

                                          if (gap2widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camgap2",
                                              gap2widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camgap2", '0');
                                          }

                                          if (teeth3widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camteeth3",
                                              teeth3widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camteeth3", '0');
                                          }

                                          if (gap3widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camgap3",
                                              gap3widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camgap3", '0');
                                          }

                                          if (teeth4widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camteeth4",
                                              teeth4widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camteeth4", '0');
                                          }

                                          if (gap4widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camgap4",
                                              gap4widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camgap4", '0');
                                          }

                                          if (teeth5widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camteeth5",
                                              teeth5widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camteeth5", '0');
                                          }

                                          if (gap5widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camgap5",
                                              gap5widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camgap5", '0');
                                          }

                                          if (teeth6widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camteeth6",
                                              teeth6widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camteeth6", '0');
                                          }

                                          if (gap6widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camgap6",
                                              gap6widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camgap6", '0');
                                          }

                                          if (teeth7widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camteeth7",
                                              teeth7widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camteeth7", '0');
                                          }

                                          if (gap7widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camgap7",
                                              gap7widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camgap7", '0');
                                          }

                                          if (teeth8widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camteeth8",
                                              teeth8widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camteeth8", '0');
                                          }

                                          if (gap8widthController.text
                                              .trim()
                                              .isNotEmpty) {
                                            sendData(
                                              "2",
                                              "camgap8",
                                              gap8widthController.text.trim(),
                                            );
                                          } else {
                                            sendData("2", "camgap8", '0');
                                          }

                                          sendData("2", "caminductsend", "1");
                                        }
                                        caminductsend = !caminductsend;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.zero, // Button vuông
                                      ),
                                    ),
                                    child: Text(
                                      'SEND SIGNAL',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 100),
                      ],
                    ),
                  ),
                ),
                // // Dropdown chọn gap teeth
                const SizedBox(height: 20),
                // DANH SÁCH ABS & ANALOG
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey[300],
                  child: Text(
                    'ABS',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Teeth Count', style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 300,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: teethabsController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: InputDecoration(
                                        hintText: '0',
                                      ),
                                      // onChanged: (value) {
                                      //   final abs1send = int.tryParse(value);
                                      //   if (abs1send != null) {
                                      //     sendData(
                                      //       "3",
                                      //       "absbate",
                                      //       abs1send.toString(),
                                      //     );
                                      //   }
                                      // },
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.zero, // Button vuông
                                      ),
                                    ),
                                    child: Text(
                                      'SEND SIGNAL',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Cụm tín hiệu ABS
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ABS1', style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Slider(
                        value: abs1,
                        min: 50,
                        max: 1000,
                        divisions: 95,
                        label: abs1.toInt().toString(),
                        activeColor: Colors.red, // Màu của phần đã trượt
                        inactiveColor:
                            Colors.red.shade100, // Màu của phần chưa trượt

                        onChanged: (value) {
                          setState(() {
                            abs1 = value;
                            sendData("3", "abs1speed", abs1.toInt().toString());
                          });
                        },
                      ),
                    ),
                    Text('${abs1.toInt()} rpm', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ABS2', style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Slider(
                        value: abs2,
                        min: 50,
                        max: 1000,
                        divisions: 95,
                        label: abs2.toInt().toString(),
                        activeColor: Colors.red, // Màu của phần đã trượt
                        inactiveColor:
                            Colors.red.shade100, // Màu của phần chưa trượt
                        onChanged: (value) {
                          setState(() {
                            abs2 = value;
                            sendData("3", "abs2speed", abs2.toInt().toString());
                          });
                        },
                      ),
                    ),
                    Text('${abs2.toInt()} rpm', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ABS3', style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Slider(
                        value: abs3,
                        min: 50,
                        max: 1000,
                        divisions: 95,
                        label: abs3.toInt().toString(),
                        activeColor: Colors.red, // Màu của phần đã trượt
                        inactiveColor:
                            Colors.red.shade100, // Màu của phần chưa trượt
                        onChanged: (value) {
                          setState(() {
                            abs3 = value;
                            sendData("3", "abs3speed", abs3.toInt().toString());
                          });
                        },
                      ),
                    ),
                    Text('${abs3.toInt()} rpm', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ABS4', style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Slider(
                        value: abs4,
                        min: 50,
                        max: 1000,
                        divisions: 95,
                        label: abs4.toInt().toString(),
                        activeColor: Colors.red, // Màu của phần đã trượt
                        inactiveColor:
                            Colors.red.shade100, // Màu của phần chưa trượt
                        onChanged: (value) {
                          setState(() {
                            abs4 = value;
                            sendData("3", "abs4speed", abs4.toInt().toString());
                          });
                        },
                      ),
                    ),
                    Text('${abs4.toInt()} rpm', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                  ],
                ),

                // Phần Analog
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey[300],
                  child: Text(
                    'ANALOG',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ANALOG1', style: TextStyle(fontSize: 18)),
                        Expanded(
                          child: Slider(
                            value: ana1 / 20,
                            min: 0,
                            max: 5,
                            divisions: 50,
                            label: (ana1 / 20).toStringAsFixed(2),
                            activeColor: Colors.red,
                            inactiveColor: Colors.red.shade100,
                            onChanged: (value) {
                              setState(() {
                                ana1 = value * 20;
                                // print(ana1);
                                sendData('2', 'ana1', ana1.toInt().toString());
                              });
                            },
                          ),
                        ),
                        Text(
                          '${(ana1 / 20).toStringAsFixed(2)} V',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ANALOG2', style: TextStyle(fontSize: 18)),
                        Expanded(
                          child: Slider(
                            value: ana2 / 20,
                            min: 0,
                            max: 5,
                            divisions: 50,
                            label: (ana2 / 20).toStringAsFixed(2),
                            activeColor: Colors.red,
                            inactiveColor: Colors.red.shade100,
                            onChanged: (value) {
                              setState(() {
                                ana2 = value * 20;
                                // print(ana2);
                                sendData('2', 'ana2', ana2.toInt().toString());
                              });
                            },
                          ),
                        ),
                        Text(
                          '${(ana2 / 20).toStringAsFixed(2)} V',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ANALOG3', style: TextStyle(fontSize: 18)),
                        Expanded(
                          child: Slider(
                            value: ana3 / 20,
                            min: 0,
                            max: 5,
                            divisions: 50,
                            label: (ana3 / 20).toStringAsFixed(2),
                            activeColor: Colors.red,
                            inactiveColor: Colors.red.shade100,
                            onChanged: (value) {
                              setState(() {
                                ana3 = value * 20;
                                // print(ana6);
                                sendData('2', 'ana3', ana3.toInt().toString());
                              });
                            },
                          ),
                        ),
                        Text(
                          '${(ana3 / 20).toStringAsFixed(2)} V',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ANALOG4', style: TextStyle(fontSize: 18)),
                        Expanded(
                          child: Slider(
                            value: ana4 / 20,
                            min: 0,
                            max: 5,
                            divisions: 50,
                            label: (ana4 / 20).toStringAsFixed(2),
                            activeColor: Colors.red,
                            inactiveColor: Colors.red.shade100,
                            onChanged: (value) {
                              setState(() {
                                ana4 = value * 20;
                                // print(ana6);
                                sendData('2', 'ana4', ana4.toInt().toString());
                              });
                            },
                          ),
                        ),
                        Text(
                          '${(ana4 / 20).toStringAsFixed(2)} V',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ANALOG5', style: TextStyle(fontSize: 18)),
                        Expanded(
                          child: Slider(
                            value: ana5 / 20,
                            min: 0,
                            max: 5,
                            divisions: 50,
                            label: (ana5 / 20).toStringAsFixed(2),
                            activeColor: Colors.red,
                            inactiveColor: Colors.red.shade100,
                            onChanged: (value) {
                              setState(() {
                                ana5 = value * 20;
                                // print(ana5);
                                sendData('2', 'ana5', ana5.toInt().toString());
                              });
                            },
                          ),
                        ),
                        Text(
                          '${(ana5 / 20).toStringAsFixed(2)} V',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ANALOG6', style: TextStyle(fontSize: 18)),
                        Expanded(
                          child: Slider(
                            value: ana6 / 20,
                            min: 0,
                            max: 5,
                            divisions: 50,
                            label: (ana6 / 20).toStringAsFixed(2),
                            activeColor: Colors.red,
                            inactiveColor: Colors.red.shade100,
                            onChanged: (value) {
                              setState(() {
                                ana6 = value * 20;
                                // print(ana6);
                                sendData('2', 'ana6', ana6.toInt().toString());
                              });
                            },
                          ),
                        ),
                        Text(
                          '${(ana6 / 20).toStringAsFixed(2)} V',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),

                // Phần Actuator
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey[300],
                  child: Text(
                    'ACTUATOR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ACTUA1 - 4', style: TextStyle(fontSize: 18)),
                        Expanded(
                          child: Slider(
                            value: actua1,
                            min: 0,
                            max: 100,
                            divisions: 100,
                            label: actua1.toInt().toString(),
                            activeColor: Colors.red,
                            inactiveColor: Colors.red.shade100,
                            onChanged: (value) {
                              setState(() {
                                actua1 = value;
                                sendData('3', 'act', actua1.toInt().toString());
                              });
                            },
                          ),
                        ),
                        Text(
                          '${actua1.toInt()} Hz',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    // const SizedBox(height: 20),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('ACTUA2', style: TextStyle(fontSize: 18)),
                    //     Expanded(
                    //       child: Slider(
                    //         value: actua2,
                    //         min: 0,
                    //         max: 100,
                    //         divisions: 100,
                    //         label: actua2.toInt().toString(),
                    //         activeColor: Colors.red,
                    //         inactiveColor: Colors.red.shade100,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             actua2 = value;
                    //             sendData(
                    //               '3',
                    //               'act2',
                    //               actua2.toInt().toString(),
                    //             );
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     Text(
                    //       '${actua2.toInt()} Hz',
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //     const SizedBox(width: 10),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('ACTUA3', style: TextStyle(fontSize: 18)),
                    //     Expanded(
                    //       child: Slider(
                    //         value: actua3,
                    //         min: 0,
                    //         max: 100,
                    //         divisions: 100,
                    //         label: actua3.toInt().toString(),
                    //         activeColor: Colors.red,
                    //         inactiveColor: Colors.red.shade100,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             actua3 = value;
                    //             sendData(
                    //               '3',
                    //               'act3',
                    //               actua3.toInt().toString(),
                    //             );
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     Text(
                    //       '${actua3.toInt()} Hz',
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //     const SizedBox(width: 10),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('ACTUA4', style: TextStyle(fontSize: 18)),
                    //     Expanded(
                    //       child: Slider(
                    //         value: actua4,
                    //         min: 0,
                    //         max: 100,
                    //         divisions: 100,
                    //         label: actua4.toInt().toString(),
                    //         activeColor: Colors.red,
                    //         inactiveColor: Colors.red.shade100,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             actua4 = value;
                    //             sendData(
                    //               '3',
                    //               'act4',
                    //               actua4.toInt().toString(),
                    //             );
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     Text(
                    //       '${actua4.toInt()} Hz',
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //     const SizedBox(width: 10),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
