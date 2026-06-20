import 'interfaces.dart';
import 'mixins.dart';

abstract class Transport implements Drawable {}

class Car extends Transport {
  @override
  void draw() {
    print('🏎️');
  }

  @override
  String draw3D(String material) {
    return 'Car is drawn in 3D with $material';
  }
}

class Plane extends Transport with Fly {
  @override
  void draw() {
    print('🛩️');
  }

  @override
  String draw3D(String material) {
    return 'Plane is drawn in 3D with $material';
  }
}
