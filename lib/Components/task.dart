import 'package:flutter/material.dart';
import 'package:projeto_alura/Components/star.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  Task({
    super.key,
    required this.nome,
    required this.foto,
    required this.dificuldade,
  });
  int _nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetsOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  void _aumentaNivel() {
    setState(() {
      widget._nivel++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      height: 100,
                      width: 72,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetsOrNetwork()
                            ? Image.asset(
                                widget.foto,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Star(dificulty: widget.dificuldade),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                        onPressed: () => _aumentaNivel(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text(
                              'UP',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (widget._nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nivel: ${widget._nivel}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
