// A Bubble class

class Bubble {
  float x,y;
  float diameter;
  String name;
  
  boolean over = false;
  
  // Создать Bubble
  Bubble(float x_, float y_, float diameter_, String s) {
    x = x_;
    y = y_;
    diameter = diameter_;
    name = s;
  }
  
  // Проверяем, находится ли мышь над пузырьком
  void rollover(float px, float py) {
    float d = dist(px,py,x,y);
    if (d < diameter/2) {
      over = true; 
    } else {
      over = false;
    }
  }
  
  // Отобразить Bubble
  void display() {

    stroke(0);
    strokeWeight(2);    noFill();
    ellipse(x,y,diameter,diameter);
    if (over) {

      textAlign(CENTER);
      textSize(18);
      text(name,x,y+diameter/2+20);

    }
  }
}
