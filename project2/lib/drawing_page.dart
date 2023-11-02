// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:project2/drawing_canvas.dart';
import 'package:project2/model/drawing_mode.dart';
import 'package:project2/model/sketch.dart';
import 'package:project2/model/undoredo_stack.dart';

class DrawingPage extends HookWidget {
  const DrawingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMenuOpen = useState<bool>(false);
    final selectedColor = useState(Colors.black);
    final strokeSize = useState<double>(10);
    final eraserSize = useState<double>(30);
    final drawingMode = useState(DrawingMode.pencil); //DrawingMode.eraser
    final filled = useState<bool>(false);
    final polygonSides = useState<int>(3);
    final backgroundImage = useState<Image?>(null);
    // final canvasGlobalkey = GlobalKey();
    final savedSketches = useState<List<Sketch>>([]);

    ValueNotifier<Sketch?> currentSketch = useState(null);
    ValueNotifier<List<Sketch>> allSketches = useState([]);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
      initialValue: 1,
    );

    final undoRedoStack = useState(UndoRedoStack(
      sketchesNotifier: allSketches,
      currentSketchNotifier: currentSketch,
    ));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => isMenuOpen.value = !isMenuOpen.value,
        ),
        title: Text('Drawing App'),
        centerTitle: true,
      ),
      body: PageView(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/sidePlank.jpg'))),
              ),
              Container(
                //color: kCanvasColor,
                width: double.maxFinite,
                height: double.maxFinite,
                child: DrawingCanvas(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  selectedColor: selectedColor,
                  strokeSize: strokeSize,
                  eraserSize: eraserSize,
                  drawingMode: drawingMode,
                  sideBarController: animationController,
                  currentSketch: currentSketch,
                  allSketches: allSketches,
                  filled: filled,
                  polygonSides: polygonSides,
                  backgroundImage: backgroundImage,
                ),
              ),
              Visibility(
                visible: isMenuOpen.value,
                child: Positioned(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.circle),
                              onPressed: () {
                                selectedColor.value = Colors.red;
                              },
                              color: Colors.red,
                            ),
                            IconButton(
                              icon: Icon(Icons.circle),
                              onPressed: () {
                                selectedColor.value = Colors.yellow;
                              },
                              color: Colors.yellow,
                            ),
                            IconButton(
                              icon: Icon(Icons.circle),
                              onPressed: () {
                                selectedColor.value = Colors.blue;
                              },
                              color: Colors.blue,
                            ),
                            IconButton(
                              icon: Icon(Icons.circle),
                              onPressed: () {
                                selectedColor.value = Colors.green;
                              },
                              color: Colors.green,
                            ),
                            IconButton(
                              icon: Icon(Icons.circle),
                              onPressed: () {
                                selectedColor.value = Colors.black;
                              },
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.circle_outlined),
                              onPressed: () {
                                drawingMode.value = DrawingMode.circle;
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.square_outlined),
                              onPressed: () {
                                drawingMode.value = DrawingMode.rect;
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.horizontal_rule),
                              onPressed: () {
                                drawingMode.value = DrawingMode.line;
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                drawingMode.value = DrawingMode.pencil;
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.line_weight),
                            SizedBox(
                              width: 4,
                            ),
                            Slider(
                              thumbColor: Colors.white,
                              activeColor: Colors.grey,
                              inactiveColor: Colors.grey.withOpacity(0.5),
                              value: strokeSize.value,
                              min: 0,
                              max: 50,
                              onChanged: (val) {
                                strokeSize.value = val;
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: allSketches.value.isNotEmpty
                                    ? () => undoRedoStack.value.undo()
                                    : null,
                                icon: Icon(Icons.undo)),
                            IconButton(
                                onPressed: allSketches.value.isNotEmpty
                                    ? () => undoRedoStack.value.redo()
                                    : null,
                                icon: Icon(Icons.redo))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text('빈 페이지'),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: allSketches.value.isNotEmpty
                ? () => undoRedoStack.value.clear()
                : null,
          ),
          FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () => savedSketches.value = allSketches.value,
          ),
        ],
      ),
    );
  }
}
