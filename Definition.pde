Info info;
StartRoom startRoom;
CreateRoom createRoom;
JoinRoom joinRoom;
int mode = 0; // 0: start, 1: createRoom, 2: joinRoom
String name = "";
import java.net.InetAddress;
import processing.net.*;
boolean unmodefirePressed = false;

void unmodefirePressed(){
  if(key >= 0 && key <= 127){
    unmodefirePressed = true;
  }
}

void unmodefireReleased(){
  unmodefirePressed = false;
}