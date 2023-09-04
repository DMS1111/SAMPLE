import controlP5.*;
ControlP5 cp5;

String name = "cars";
void setup () {
    size(400, 400);
   cp5 = new ControlP5(this);
   cp5.addButton("OPEN").setWidth(100).setHeight(25).setPosition(10,10);




}
void draw(){
background(999);
}
void OPEN(){
for (int i = 1; i < 21; i = i+1) {
 // delay (1000);
 // println(name + " " + i);
   println(name + i + "=" +"loadImage" + "(" + "Car" +i +".jpg" +")" + ";");
}
}
