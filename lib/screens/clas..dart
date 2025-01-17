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
      children:[]
    )
  }












}
