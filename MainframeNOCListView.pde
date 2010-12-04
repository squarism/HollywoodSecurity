public class MainframeNOCListView implements GameView {
	
	PImage nocList;
	PImage scanLines;
	
	public MainframeNOCListView() {
		nocList = loadImage("noc_list.jpg");
		scanLines = genScanLines();
	}

	public void paint() {
		background(0);
		tint(255);
		image(nocList, 0, 0, nocList.width, nocList.height);
		
		// overlay scanlines last
		tint(255,255,255,120);
		image(scanLines, 0, 0, scanLines.width, scanLines.height);
	}

	PImage genScanLines() {
		PGraphics sl = createGraphics(width, height, P2D);

		int lineSize = 1;
		sl.beginDraw();
		sl.stroke(0,0,0,20);

		for (int i=0; i < height; i+=lineSize * 2) {
			sl.line(0,i,width,i);
		}
		sl.endDraw();
		return sl;
	}

}