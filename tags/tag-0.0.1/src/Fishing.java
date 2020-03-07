import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

import javax.swing.JLabel;

public class Fishing extends CoordinatesManager
{
	/** The random variance of casting the fishing rod (if enabled).*/
	public static int VARIANCE = 20;
	private static int x, y;
	private static Random rand = new Random();
	private static Robot robot;
	private String location;
	private final int numberOfCasts;
	private int numberOfTimesToMeetFisherman;
	private boolean randomCasting;
	private static JLabel displayCastsRemaining, displaySellsRemaining;
	
	public Fishing(String location, int numberOfCasts, int numberOfTimesToMeetFisherman, boolean randomCasting, JLabel displayCastsRemaining, JLabel displaySellsRemaining)
	{
		this.location = location;
		this.numberOfCasts = numberOfCasts;
		this.numberOfTimesToMeetFisherman = numberOfTimesToMeetFisherman;
		this.randomCasting = randomCasting;
		this.displayCastsRemaining = displayCastsRemaining;
		this.displaySellsRemaining = displaySellsRemaining;
	}

	private void startFishing()
	{
		try 
		{
			robot = new Robot();
		} 
		catch (AWTException e) 
		{
			e.printStackTrace();
		}
		
		displaySellsRemaining.setVisible(true);
		displaySellsRemaining.setText("Number of sells remaining: " + Integer.toString(numberOfTimesToMeetFisherman));
		if (numberOfTimesToMeetFisherman != 0)
		{
			BotFunctions.makeBotSleep(3);
			if (!checkCoordinates("15"))//if they're 0,0, enter. Checks the red fishing button
				locateRedFishingButton();
			
			//start fishing
			startFishing(numberOfCasts, randomCasting);
			//walking to fisherman
			switch (location)
			{
			case "TOONTOWN CENTRAL PUNCHLINE PLACE":
				fishTTCPunchlinePlace();//goes to fisherman and back to dock
				numberOfTimesToMeetFisherman -= 1;
				startFishing();
				break;
			case "DONALD DREAM LAND LULLABY LANE":
				fishDDLLullabyLane();
				numberOfTimesToMeetFisherman -= 1;
				startFishing();
				break;
			case "BRRRGH POLAR PLACE":
				fishBrrrghPolarPlace();
				numberOfTimesToMeetFisherman -= 1;
				startFishing();
				break;
			case "BRRRGH WALRUS WAY":
				fishBrrrghWalrusWay();
				numberOfTimesToMeetFisherman -= 1;
				startFishing();
				break;
			case "BRRRGH SLEET STREET":
				fishBrrrghSleetSt();
				numberOfTimesToMeetFisherman -= 1;
				startFishing();
				break;
			case "MINNIE'S MELODYLAND TENOR TERRACE":
				fishMMTenorTerrace();
				numberOfTimesToMeetFisherman -= 1;
				startFishing();
				break;
			case "DONALD DOCK LIGHTHOUSE LANE":
				fishDDLighthouseLane();
				numberOfTimesToMeetFisherman -= 1;
				startFishing();
				break;
			case "DAISY'S GARDEN ELM STREET":
				fishDaisyGardenElmSt();
				numberOfTimesToMeetFisherman -= 1;
				startFishing();
				break;
			case "FISH ANYWHERE":
				BotFunctions.showMessageBox("Done!");
				break;
			}
		}
	}

	private static void fishTTCPunchlinePlace()
	{
		//Go to fisherman
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(2000);
		robot.keyRelease(KeyEvent.VK_DOWN);
		robot.keyPress(KeyEvent.VK_RIGHT);
		robot.delay(800);
		robot.keyRelease(KeyEvent.VK_RIGHT);
		robot.keyPress(KeyEvent.VK_UP);
		robot.delay(700);
		robot.keyRelease(KeyEvent.VK_UP);
		robot.delay(2000);
		sellFish();//sell fish
		//Go back to dock
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(700);
		robot.keyRelease(KeyEvent.VK_DOWN);
		robot.keyPress(KeyEvent.VK_LEFT);
		robot.delay(750);
		robot.keyRelease(KeyEvent.VK_LEFT);
		robot.keyPress(KeyEvent.VK_UP);
		robot.delay(2000);
		robot.keyRelease(KeyEvent.VK_UP);
	}

	private static void fishDDLLullabyLane()
	{
		robot.keyPress(KeyEvent.VK_UP);
		robot.delay(4000);
		robot.keyRelease(KeyEvent.VK_UP);
		sellFish();
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(6500);
		robot.keyRelease(KeyEvent.VK_DOWN);
	}

	private static void fishBrrrghPolarPlace()
	{
		robot.keyPress(KeyEvent.VK_RIGHT);
		robot.delay(800);
		robot.keyRelease(KeyEvent.VK_RIGHT);
		robot.keyPress(KeyEvent.VK_UP); ;
		robot.delay(2000);
		robot.keyRelease(KeyEvent.VK_UP);
		sellFish();
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(2000);
		robot.keyRelease(KeyEvent.VK_DOWN);
	}

	private static void fishMMTenorTerrace()
	{
		robot.keyPress(KeyEvent.VK_LEFT);
		robot.delay(1090);
		robot.keyRelease(KeyEvent.VK_LEFT);
		robot.keyPress(KeyEvent.VK_UP); ;
		robot.delay(2200);
		robot.keyRelease(KeyEvent.VK_UP);
		sellFish();
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(3000);
		robot.keyRelease(KeyEvent.VK_DOWN);
	}

	private static void fishBrrrghWalrusWay()
	{
		robot.keyPress(KeyEvent.VK_UP); ;
		robot.delay(100);
		robot.keyRelease(KeyEvent.VK_UP);
		robot.keyPress(KeyEvent.VK_LEFT);
		robot.delay(730);
		robot.keyRelease(KeyEvent.VK_LEFT);
		robot.keyPress(KeyEvent.VK_UP); ;
		robot.delay(2000);
		robot.keyRelease(KeyEvent.VK_UP);
		sellFish();
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(2100);
		robot.keyRelease(KeyEvent.VK_DOWN);
		robot.keyPress(KeyEvent.VK_RIGHT);
		robot.delay(700);
		robot.keyRelease(KeyEvent.VK_RIGHT);
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(1000);
		robot.keyRelease(KeyEvent.VK_DOWN);
	}

	private static void fishBrrrghSleetSt()
	{
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(600);
		robot.keyRelease(KeyEvent.VK_DOWN);
		robot.keyPress(KeyEvent.VK_RIGHT);
		robot.delay(850);
		robot.keyRelease(KeyEvent.VK_RIGHT);
		robot.keyPress(KeyEvent.VK_UP); ;
		robot.delay(1000);
		robot.keyRelease(KeyEvent.VK_UP);
		sellFish();
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(1700);
		robot.keyRelease(KeyEvent.VK_DOWN);
		robot.keyPress(KeyEvent.VK_LEFT);
		robot.delay(850);
		robot.keyRelease(KeyEvent.VK_LEFT);
		robot.keyPress(KeyEvent.VK_UP); ;
		robot.delay(600);
		robot.keyRelease(KeyEvent.VK_UP);
	}

	private static void fishDaisyGardenElmSt()
	{
		robot.keyPress(KeyEvent.VK_LEFT);
		robot.delay(80);
		robot.keyRelease(KeyEvent.VK_LEFT);
		robot.keyPress(KeyEvent.VK_UP); ;
		robot.delay(2000);
		robot.keyRelease(KeyEvent.VK_UP);
		sellFish();
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(4500);
		robot.keyRelease(KeyEvent.VK_DOWN);
	}

	private static void fishDDLighthouseLane()
	{
		robot.keyPress(KeyEvent.VK_RIGHT);
		robot.delay(330);
		robot.keyRelease(KeyEvent.VK_RIGHT);
		robot.keyPress(KeyEvent.VK_UP); ;
		robot.delay(2200);
		robot.keyRelease(KeyEvent.VK_UP);
		sellFish();
		robot.keyPress(KeyEvent.VK_DOWN);
		robot.delay(4500);
		robot.keyRelease(KeyEvent.VK_DOWN);
	}

	private static void startFishing(int numberOfCasts, boolean fishVariance)
	{
		int start = 0;
		displayCastsRemaining.setVisible(true);
		displayCastsRemaining.setText("Number of casts remaining: " + Integer.toString(numberOfCasts));
		while (numberOfCasts != 0)
		{
			castLine(fishVariance);
			start = (int) TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis());//stop watch start
			while (((int) TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis()) - start) < 30 && !checkIfFishCaught())
			{
				checkIfFishCaught();
			}
			numberOfCasts--;
			robot.delay(1000);
			displayCastsRemaining.setText("Number of casts remaining: " + Integer.toString(numberOfCasts));
		}
		exitFishing();
		robot.delay(3000);
	}

	private static void sellFish()
	{
		if (checkCoordinates("17"))//returns true if they are not 0,0
		{
			robot.delay(2100);
			getCoords("17");
			robot.mouseMove(x, y);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
			robot.delay(200);
		}
		else
		{
			CoordinatesManager.updateCoordinates("17");
			sellFish();
		}
		robot.delay(2000);
	}

	private static void exitFishing()
	{
		if (checkCoordinates("16"))//returns true if they are not 0,0
		{
			getCoords("16");
			robot.mouseMove(x, y);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
			robot.delay(200);
		}
		else
		{
			CoordinatesManager.updateCoordinates("16");
			exitFishing();
		}
	}

	private static void castLine(boolean fishVariance)
	{
		getCoords("15");
		int randX = 0;
		int randY = 0;
		if (fishVariance) 
		{ 
			randX = rand.nextInt((VARIANCE*2)+1) - VARIANCE;
			randY = rand.nextInt((VARIANCE*2)+1) - VARIANCE;
		} 
		robot.mouseMove(x,y);//move to red button location
		robot.mousePress(InputEvent.BUTTON1_MASK);//click the cast button
		robot.delay(200);
		robot.mouseMove((x+randX), ((y+150)+randY));//pull it back
		robot.delay(200);
		robot.mouseRelease(InputEvent.BUTTON1_MASK);//release the cast button
	}

	private static boolean checkIfFishCaught()
	{
		boolean result = false;
		getCoords("15");
		String color = BotFunctions.GetColorAt(x, y - 600);
		color = color.toUpperCase();
		if (color.equals("#FFFFBE") || color.equals("#FFFFBF"))
			result = true;//fish caught
		// Check if boot caught (smaller catch window)
		color = BotFunctions.GetColorAt(x, 110);
		color = color.toUpperCase();
		if (color.equals("#FFFFBE") || color.equals("#FFFFBF"))
			result = true;//fish caught
		return result;
	}

	private static void locateRedFishingButton()
	{
		CoordinatesManager.updateCoordinates("15");//update the red fishing button coords
	}

	private static void getCoords(String item)
	{
		int[] coordinates = CoordinatesManager.getCoordinates(item);
		x = coordinates[0];
		y = coordinates[1];
	}

	public void run()//override run func for multithreading
	{
		startFishing();
	}
}
