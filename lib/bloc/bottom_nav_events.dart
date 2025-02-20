abstract class BottomNavBarEvents {}

class OnItemTapped extends BottomNavBarEvents {
  final int index;
  OnItemTapped(this.index);
}
