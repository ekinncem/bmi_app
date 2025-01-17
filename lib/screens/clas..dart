class HeightCounter extends StatefulWidget{
  @override
  _HeightCounterState createState() => _HeightCounterState();
}

class _HeightCounterState extends State<HeightCounter> {
  int height = 120;

  void _incrementHeight() {
    setState(() {
      height++;
    });
  }

  void _decrementAge() {
    setState((){
      height--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        const Text(
          'AGE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height:10),
        Text(
          '$height',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        )
        const SizedBox(height: 10),
      ]
    )
  }












}
