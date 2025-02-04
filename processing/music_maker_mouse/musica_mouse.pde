import processing.sound.*;

Delay delay;

int timeLine = 0;
int value = 0;
float volume;
boolean clicked = false;
boolean isEcho = false; 
boolean canJump = false;
int audioDuration = 0;

SoundFile soundfile;

void setup() {
  size(640, 360);
  background(255);

  // Load a soundfile
  soundfile = new SoundFile(this, "sons/TimMaia.mp3");
  
  // These methods return useful infos about the file
  println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
  println("SFSamples= " + soundfile.frames() + " samples");
  println("SFDuration= " + soundfile.duration() + " seconds");
  

}      

void draw() {
  
  createButtons();
  
  jumpTimeLine();
  
  createTimeLine();
  
}

void mouseClicked() {

   boolean playX = (mouseX > 71 && mouseX < 118);
   boolean playY = (mouseY > 226 && mouseY < 288);
   boolean isJumpedY = (mouseY > 20 && mouseY < 80);

   //se clicar no botão, tocar ou pausar
   if (playX && playY){
     playAudio();
   }
   
   //se clicar na timeline, liga ou desliga a possibilidade de mover a música
   if (isJumpedY && !canJump){
     canJump = true;
   }
   else{
     canJump = false;
   }
   
   println("X", mouseX);
   println("Y", mouseY);
}


void playAudio(){
  
  if (soundfile.isPlaying() == false){
    println("tocar áudio");
    soundfile.play(1);
    //arquivo_audio.rate(1);
 
    fill(204, 102, 0);
  }
  else{
    println("pausar áudio");
    soundfile.pause();
    
    canJump = false;
    
    fill(255);
  }
}

void createTimeLine(int musicChangedTime){
  
  audioDuration = int(soundfile.duration());
  
  if (audioDuration > 0 && soundfile.isPlaying()){
  
    int musicProgressTime = int(640/audioDuration);
    if (musicChangedTime > 0){
      musicProgressTime = musicChangedTime;
    }
    
    line(timeLine, 20, timeLine, 80);
    
    timeLine = timeLine + musicProgressTime;
    if (timeLine > 640) { 
      timeLine = 0; 
      soundfile.stop();
      clean();
    }
    delay(1000);
  }
  
}

void jumpTimeLine(){
  
  if (canJump){
    float musicTime = map(mouseX, 0, width, 0, audioDuration);
    println(musicTime);
    jumpMusicTime(musicTime);
  }
  
}

void createButtons(){
  
  //x, y, sizeX, sizeY
  //play
  rect(60, 220, 70, 70, 28);  
  triangle(72, 237, 95, 256, 73, 273);
  line(105, 237, 105, 273);
  line(115, 237, 115, 273);
}

void playEcho(){
 
  if (!isEcho){
    
    println("echo");
    // create a delay effect
    delay = new Delay(this);

    // Patch the delay
    delay.process(soundfile, 5);
    delay.time(0.5); 
    
    isEcho = true;
  }
}

void jumpMusicTime(float valor){
  
  if (soundfile.isPlaying() == true){
    println(valor);
    if (valor > 10){
      soundfile.jump(valor);
    }
  }
}

void clean(){
  
  background(255);
  timeLine = 0;
  line(1, 50, 640, 50);    
    
}

void velocity_effects(){
  
    // Map mouseX from 0.25 to 4.0 for playback rate. 1 equals original playback speed,
  // 2 is twice the speed and will sound an octave higher, 0.5 is half the speed and
  // will make the file sound one ocative lower.
  float playbackSpeed = map(mouseX, 0, width, 0.25, 4.0);
  soundfile.rate(playbackSpeed);

  // Map mouseY from 0.2 to 1.0 for amplitude
  float amplitude = map(mouseY, 0, width, 0.2, 1.0);
  soundfile.amp(amplitude);

  // Map mouseY from -1.0 to 1.0 for left to right panning
  float panning = map(mouseY, 0, height, -1.0, 1.0);
  soundfile.pan(panning);
  
}


void keyPressed() {
  // We use a boolean helper variable to determine whether one of the branches
  // of the switch-statement was activated or not
  boolean validKey = true;

  switch(key) {
  case 'a':
    soundfile.play(0.5, 1.0);
    break;

    // no valid key was pressed, store that information
  default:
    validKey = false;
  }

  // If a new sample playback was triggered, change the background color
  if (validKey) {

  }
}
