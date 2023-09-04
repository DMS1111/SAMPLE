import controlP5.*;
import javax.swing.*;

ControlP5 cp5;

void setup(){
  cp5 = new ControlP5(this);
  size(800,800);  
  cp5.addButton("ButtonA").setPosition(300,100).setSize(10,10).setLabel("A");
  cp5.addButton("ButtonB").setPosition(300,200).setSize(80,40).setLabel("B");
}

void draw(){
  background(200);
  fill(0);
  text(frameCount,20,20);
}

//*********************** Functions **************************
void ButtonA(){
  println("Button A pressed");
  loop();
  displayMessageBoxYesNo("Good");    
}

void ButtonB(){
  println("Button B pressed");
  loop();  
  displayMessageBoxOKCancel("Error: Press B Button");
}

// ******************************* MessageBox ****************************
void displayMessageBoxYesNo(String abc){
    switch(JOptionPane.showConfirmDialog(null,abc,"Some title text goes here.",JOptionPane.YES_NO_OPTION,JOptionPane.QUESTION_MESSAGE)) {
      case JOptionPane.YES_OPTION:
        println("yes!");
        break;
      default:
        println("no!");
    };
}

void displayMessageBoxOKCancel(String abc){
    switch(JOptionPane.showConfirmDialog(null,abc,"Some title text goes here.",JOptionPane.OK_CANCEL_OPTION,JOptionPane.QUESTION_MESSAGE)) {
      case JOptionPane.OK_OPTION:
        println("yes!");
        break;
      default:
        println("no!");
    };
}
