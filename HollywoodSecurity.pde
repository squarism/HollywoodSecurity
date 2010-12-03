// fake hollywood security system

Game game;
PApplet applet;

PFont monaco;
PFont menlo;
PFont proggyClean;

int height;
int width;

void setup() {
	size(640, 480); 
	height = getSize().height;
	width = getSize().width;

 	frameRate(60);
 	fill(0); 
	noSmooth();
	
	applet = this;
	game = new MainframeGame();
	game.init();
	println("game:" + game);

	
	monaco = loadFont("Monaco-9.vlw");
	menlo = loadFont("Menlo-Regular-10.vlw");
	proggyClean = loadFont("ProggySquareTT-16.vlw");
	textFont(monaco, 9);
}

void draw(){
	game.run();
}

void keyPressed() {
	game.state.keyPressed();
}
