import controlP5.*;
import processing.video.*;
import meter.*;
import processing.serial.*;
Serial serial;

ControlP5 cp5;

Textarea myTextarea;

Meter m, av;//описание датчиков

boolean keyq=false;
boolean keys=false;

int cap=20;

  String portName;
  int speed = 115200;

PImage logo;
PImage logo2;//подгрузка фото
PImage[] cars;
PImage car0;

PWindow one;
PWindow2 two;
PWindow3 three;
PWindow4 four;
PWindow5 five;
PWindow6 six;
public void settings() {
  size(1415, 35,P2D);
  }

public void setup() {
  windowMove(0,0);//(w, h);
  surface.setTitle("Главное меню");
    
  cp5 = new ControlP5(this);
  cp5.addButton("Карта").setWidth(100).setHeight(25).setPosition(5, 5);
  cp5.addButton("Камера").setWidth(100).setHeight(25).setPosition(110, 5);
  cp5.addButton("Консоль").setWidth(100).setHeight(25).setPosition(215, 5);
  cp5.addButton("Датчики").setWidth(100).setHeight(25).setPosition(320, 5);
  cp5.addButton("Машинки").setWidth(100).setHeight(25).setPosition(425, 5);
  cp5.addButton("Настройки").setWidth(100).setHeight(25).setPosition(635, 5);
  cp5.addButton("Выход").setWidth(100).setHeight(25).setPosition(1310, 5);
  cp5.setFont(createFont("", 10));//задается шрифт и размер
  
    cp5.addIcon("icon",10)
     .setPosition(900,0)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 40))
     .setFontIcons(#00f205,#00f204)
     .setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground();
     
     cp5.addIcon("icon2",10)
     .setPosition(950,0)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 40))
     .setFontIcons(#00f205,#00f204)
     .setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground();
  
  logo = loadImage("logo.jpg");
  logo2 = loadImage("logo2.jpg");
  
  cars = new PImage[cap+1];
  for (int i=1; i<cap+1; i++){
    String qqq = "Cars/Car"+i+".jpg";
    cars[i] = loadImage(qqq);
  }

  car0 = loadImage("Data/Car0.png");
  
  one = new PWindow();
  //two = new PWindow2();
  three = new PWindow3();
  four = new PWindow4();
  five = new PWindow5();
//  six = new PWindow6();
}

void draw() {//управление программой
background(200);//220
}

/* функции открытия окон */
void Карта() {
  if (one == null) one = new PWindow();
}
void Камера () {
  if (two == null) two = new PWindow2();
}
void Консоль(){ //Console() {
  if (five == null) five = new PWindow5();
}
void Датчики() {
  if (four == null) four = new PWindow4();
}
void Машинки(){
  if (three == null) three = new PWindow3();
}

  void Выход(){
  exit();
}

void Настройки () {
  if (six == null) six = new PWindow6();
}

void icon(boolean theValue) {
  if (theValue) keyq = true;
  else keyq = false;
}

void icon2(boolean theValue) {
  if (theValue) keys = true;
  else keys = false;
}

void mousePressed() {

}
