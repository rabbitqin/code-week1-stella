import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int state,posY,vel;
Minim minim;
AudioPlayer player;
AudioInput input;
 
void setup(){
size (500,500);
background(0);
minim = new Minim(this);
player = minim.loadFile("Raindrops-sound.mp3");
input = minim.getLineIn();
posY = 0;
vel = 5;
state = 0;
}

void draw(){
  if (state == 0) {
    fill(255);
    ellipse(210,200,40,140);
    ellipse(290,200,40,140);
    fill(255,192,203);
    noStroke();
    ellipse(290,200,20,80);
    ellipse(210,200,20,80);
    fill(255);
    ellipse(250,270,160,120);
    fill(0);
    ellipse(220,260,10,10);
    ellipse(280,260,10,10);
    fill(255,192,203);
    ellipse(210,285,30,15);
    ellipse(290,285,30,15);
    println("You are a rabbit and you are looking for your little sister. You see a cat under a tree.");
    println("A. Talk to him.");
    println("B. Walk away.");
    state = 1;
  }
  
  if(state == 4||state==5 ){
  player.play();
  fill (0,50);
  rect (0,0,width,height);//low opacity to hide the cllipse
  move();
  makeCircle(300,random(100),5);
  makeCircle(width/3,random(100),5);
  makeCircle(width/4, random(100),5);
  makeCircle(3*width/2, random(100),5);
  makeCircle(400, random(100),5);
  makeCircle(350, random(100),5);
  makeCircle(150, random(100),5);
  makeCircle(450, random(100),5);
  makeCircle(20, random(100),5);
  makeCircle(250, random(100),5);
  }
}

void makeCircle(float posX, float z, float size){
  float r = posX;
  float g = posY;
  float b = 227;

  noStroke();
  fill(r,g,b);
  ellipse(posX,z+posY,size,size);
}

void move(){
  posY += vel;
  if (posY>height){
  posY = 0;}
}

void keyPressed() {
  if (key == 'a') {
    if (state == 1) {
      background(0);
      fill(240,248,255);
      rect (170,170,150,100);
      fill(255);
      triangle(170,170,320,170,245,230);
      println("");
      println("He wants you to help with delivering a letter to a panda.");
      println("A. Take the task");
      println("B. Say sorry to him.");
      state = 2;
    } else if (state == 2) {
      println(" ");
      println("A panda hosts you and invites you to have dinner together.");
      println("A. Take the invitation.");
      println("B. Thank him and leave.");
      state = 3;
    }
    else if(state ==3){
    println(" ");
    println("After dinner, it starts to rain. You dont have an umbrella.");
    println("A. Stay here.");
    println("B. Leave");
    state = 4;
    }
    else if(state ==4){
    println(" ");
    println("After watching a movie in the house, it is 12am and there is no bed for you to stay over night.");
    println("A.You have to go home.");
    state = 5;
    }
    else if(state ==5){
    noStroke();
    fill(50,205,50);
    rect (235,170,13,50);
    rect (245,190,10,50);
    fill(255,127,80);
    triangle(220,200,270,200,245,330);
    println(" ");
    println("Finally you are back home and you totally forget your little sister after such a long day");
    state = 6;
    }
  }
    
    if (key == 'b') {
    if (state == 1) {
      println(" ");
      background(0);
      
      println("You keep walking on the road and meet a dog who invites you to his house");
      println("A. Go with him.");
      println("B. Keep walking.");
      state = 2;
    } else if (state == 2) {
      background(0);
      println(" ");
      println("You keep walking on the road and meet a turtle who invites you to a house party nearby");
      println("A. Go to the party and have dinner.");
      println("B. keep walking");
      state = 3;
    } 
    else if (state == 3) {
      println(" ");
      println("It starts to rain and you do not have an umbrella.");
      println("A. Go to the house nearby.");
      println("B. Waiting for a taxi to go back.");
      state = 4;
    } else if (state == 4) {
      noStroke();
      fill(50,205,50);
      rect (235,170,13,50);
      rect (245,190,10,50);
      fill(255,127,80);
      triangle(220,200,270,200,245,330);
      println(" ");
      println("Finally you get a taxi and go back home.");
      println("And you totally forget your little sister after such a long day.");
      state = 6;
    } 
    } 
}