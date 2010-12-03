// fake hollywood security system

Game game;
PApplet applet;

void setup() {
	size(480, 640); 
  	frameRate(60);
  	fill(0); 
	noSmooth();
	
	applet = this;
	game = new MainframeGame();
}

void draw(){
	game.run();
}

void keyPressed() {
	game.state.keyPressed();
}
