public abstract class Game {

	public GameState state;
	public GameView view;
	
	public boolean viewDone;
	
	public void run() {
		state.update();
		view.paint();
		state = game.state.nextState();
	}
	
	public void keyPressed() {
		state.keyPressed();
	}
	
	public void init() {
		// override me
	}
}
