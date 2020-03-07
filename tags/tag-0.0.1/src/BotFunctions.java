import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.awt.image.BufferedImage;
import javax.swing.*;
import java.awt.AWTException;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;

public class BotFunctions extends Thread
{
	private final static JFrame parent = new JFrame();
	protected Robot robot;
	private JSlider sliderKeepToonAwakeTime;
	
	public BotFunctions()
	{
		try {
			robot = new Robot();
		} catch (AWTException e) {
			e.printStackTrace();
		}
	}
	
	public BotFunctions(JSlider sliderKeepToonAwakeTime)
	{
		this.sliderKeepToonAwakeTime = sliderKeepToonAwakeTime;
	}
	
	public static void showMessageBox(String message)
	{
		parent.setAlwaysOnTop(true);
		JOptionPane.showMessageDialog(parent, message);
	}

	public static void bringTTRScreenToFocus()
	{
		Robot robotTemp = null;
		try {
			robotTemp = new Robot();
		} catch (AWTException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//need to create new robot because robot is static
		robotTemp.mousePress(InputEvent.BUTTON1_MASK);
		robotTemp.delay(200);
		robotTemp.mouseRelease(InputEvent.BUTTON1_MASK);
	}

	protected void typeSentenceInGame(String s)//types sentence in game
	{
		byte[] bytes = s.getBytes();
		for (byte b : bytes)
		{
			int code = b;
			// keycode only handles [A-Z] (which is ASCII decimal [65-90])
			if (code > 96 && code < 123) 
			{
				code = code - 32;
				robot.delay(40);//tweak this to determine how quickly characters are pressed/typed
				robot.keyPress(code);
				robot.keyRelease(code);
			}
			else
				pressUnicode(code);
		}
		robot.keyPress(KeyEvent.VK_ENTER);
		robot.keyRelease(KeyEvent.VK_ENTER);
	}

	private void pressUnicode(int key_code)//is for anything not A-Z
	{
		robot.keyPress(KeyEvent.VK_ALT);

		for(int i = 3; i >= 0; --i)
		{
			int numpad_kc = key_code / (int) (Math.pow(10, i)) % 10 + KeyEvent.VK_NUMPAD0;

			robot.keyPress(numpad_kc);
			robot.keyRelease(numpad_kc);
		}

		robot.keyRelease(KeyEvent.VK_ALT);
	}
	
	public static void makeBotSleep(int numberOfSeconds)
	{
		try 
		{
			Thread.sleep((numberOfSeconds * 1000));	
		} 
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
	}
	
	public static void makeBotSleep(String numberOfSeconds)
	{
		try 
		{
			Thread.sleep(Integer.parseInt(numberOfSeconds));	
		} 
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
	}
	
	public static String GetColorAt(int x, int y)
    {
		Robot robotTemp = null;
		try {
			robotTemp = new Robot();
		} catch (AWTException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Rectangle size = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
		BufferedImage image = robotTemp.createScreenCapture(size);
		int clr =  image.getRGB(x,y); 
		int  red   = (clr & 0x00ff0000) >> 16;
		int  green = (clr & 0x0000ff00) >> 8;
		int  blue  =  clr & 0x000000ff;
		return String.format("#%02x%02x%02x", red, green, blue);
    }
	
	public static void tellFishingLocation(String location)
    {
        switch (location)
        {
            case "TOONTOWN CENTRAL PUNCHLINE PLACE":
                showMessageBox("Fishes in the first dock when you walk in");
                break;
            case "DONALD DREAM LAND LULLABY LANE":
            	showMessageBox("Fishes in the dock to the left of the small box");
                break;
            case "BRRRGH POLAR PLACE":
            	showMessageBox("Fishes in the top right dock");
                break;
            case "BRRRGH WALRUS WAY":
            	showMessageBox("Fishes in the top left dock");
                break;
            case "BRRRGH SLEET STREET":
            	showMessageBox("Fishes in the first dock when you walk in");
                break;
            case "MINNIE'S MELODYLAND TENOR TERRACE":
            	showMessageBox("Fishes in the top left dock");
                break;
            case "DONALD DOCK LIGHTHOUSE LANE":
            	showMessageBox("Fishes in the 2nd one on the right");
                break;
            case "DAISY'S GARDEN ELM STREET":
            	showMessageBox("Fishes in the bottom left dock when you walk in");
                break;
            case "FISH ANYWHERE":
            	showMessageBox("Fishes for you anywhere, but will only fish, will not sell fish!");
                break;
        }
    }
	
	public void keepToonAwake()
	{
		try {
			robot = new Robot();
		} catch (AWTException e) {
			e.printStackTrace();
		}
		makeBotSleep(3);
		String sleep = "";
		int sleepTime = sliderKeepToonAwakeTime.getValue()*60;
		while(!sleep.equals("QUIT"))
		{
			robot.keyPress(KeyEvent.VK_CONTROL);
			makeBotSleep(sleepTime);
			sleep = "QUIT";
		}
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}
	
	public void run()//override run func for multithreading
	{
		keepToonAwake();
	}
}
