public interface GameState {
	public void update();
	public GameState nextState();
	public void keyPressed();
	public void keyReleased();
	//public PImage shot();
}
