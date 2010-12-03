public abstract class Game {

	public GameState state;
	public GameView view;
	
	public void run() {
		state.update();
		view.paint();
		state = game.state.nextState();
		//view = game.view.nextView();
	}
	
	public void keyPressed() {
		state.keyPressed();
	}
		
}
