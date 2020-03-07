import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;

public class Golf extends BotFunctions
{
	private static Robot robot;
	public Golf()
	{
		try {
			robot = new Robot();
		} catch (AWTException e) {
			e.printStackTrace();
		}
	}
	
	private static void showMessage()
	{
		JOptionPane.showConfirmDialog(null, "Press OK before the 15 seconds are over!", "", JOptionPane.DEFAULT_OPTION);
		makeBotSleep(1);
		bringTTRScreenToFocus();
	}
	
	public static void afternoonTee()//works, finished
	{
		showMessage();
		makeBotSleep(15);
		toonLookAtHole();
		makeBotSleep(3);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("2120");
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	// GOLF - Holey Mackeral
	public static void holeyMackeral()//works, finished
	{
		showMessage();
		makeBotSleep(15);
		toonLookAtHole();
		makeBotSleep(3);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep(1);
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	// GOLF - Hole on the Range
	public static void holeOnTheRange()//needs fixed? Not sure
	{
		showMessage();
		makeBotSleep(15);
		toonLookAtHole();
		makeBotSleep(3);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("1800"); // 68%
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	// GOLF - Seeing green
	public static void seeingGreen()//works, finished
	{
		showMessage();
		makeBotSleep(15);
		toonLookAtHole();
		makeBotSleep(3);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("1790");// 67%
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	// GOLF - Swing Time
	public static void swingTime()//yellow, needs fixed (move to the right?)
	{
		showMessage();
		makeBotSleep("100");
		//move toon to the right location
		robot.keyPress(KeyEvent.VK_RIGHT);
		makeBotSleep("50");
		robot.keyRelease(KeyEvent.VK_RIGHT);
		makeBotSleep("100");
		makeBotSleep(15);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep(2);
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	// GOLF - Down the Hatch
	public static void downTheHatch()//yellow, needs fixed
	{
		showMessage();
		makeBotSleep(15);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("2340");
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	//GOLF - Peanut Putter
	public static void peanutPutter()
	{
		showMessage();
		makeBotSleep(15);
		toonLookAtHole();
		makeBotSleep(3);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("1860");// 69-70% ?
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	//GOLF - Hot Links
	public static void hotLinks()
	{
		showMessage();
		makeBotSleep(15);
		toonLookAtHole();
		makeBotSleep(3);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("1800"); // 67%
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	//GOLF - Hole In Fun
	public static void holeInFun()
	{
		showMessage();
		makeBotSleep(15);
		toonLookAtHole();
		makeBotSleep(3);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("1300");// 52%
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	//GOLF - Swing-A-Long
	public static void swingALong()
	{
		showMessage();
		makeBotSleep(15);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("2340");// 82%
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	public static void oneLittleBirdie()
	{
		showMessage();
		makeBotSleep(15);
		//rotate the toon right
		robot.keyPress(KeyEvent.VK_RIGHT);
		makeBotSleep("700");
		robot.keyRelease(KeyEvent.VK_RIGHT);
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("1870");// 69-70% ?
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	private static void confirmLocation()
	{
		robot.keyPress(KeyEvent.VK_CONTROL);
		makeBotSleep("50");
		robot.keyRelease(KeyEvent.VK_CONTROL);
	}

	private static void toonLookAtHole()//this is just to stop the timer
	{
		robot.keyPress(KeyEvent.VK_UP);
		makeBotSleep("50");
		robot.keyRelease(KeyEvent.VK_UP);
	}
}
