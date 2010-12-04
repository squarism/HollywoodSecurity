// fake hollywood security system

import fullscreen.*; 

Game game;
PApplet applet;

PFont monaco;
PFont menlo;
PFont proggyClean;

int height;
int width;

FullScreen fs;

void setup() {
	size(640, 480); 
	height = getSize().height;
	width = getSize().width;

 	frameRate(60);
 	fill(0); 
	noSmooth();
	
	applet = this;

	// we have to do init after constructing because
	// the view needs to know the game state
	// so if we return too fast then it doesn't work
	game = new MainframeGame();
	game.init();
	
	monaco = loadFont("Monaco-9.vlw");
	menlo = loadFont("Menlo-Regular-10.vlw");
	proggyClean = loadFont("ProggySquareTT-16.vlw");
	textFont(monaco, 9);
	
	fs = new FullScreen(this);
	fs.setShortcutsEnabled(false);
	hint(DISABLE_OPENGL_2X_SMOOTH);
	fs.enter();
  
}

void draw(){
	game.run();
}

void keyPressed() {
	game.state.keyPressed();
}
