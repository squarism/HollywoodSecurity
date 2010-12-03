public class AuthorizedState implements GameState {

	// key handling
	boolean pressedEnter = false;
	
	
	public GameState nextState () {
		return this;
	}
	
	// if they press any key
	public void keyPressed() {
		if (keyCode == KeyEvent.VK_H) {
			//key = 0;
			println("You pressed H.  This is AuthorizedState.");
		}
	}
		
	public void keyReleased() {

	}
	
	public void update() {
	
	}
	
}