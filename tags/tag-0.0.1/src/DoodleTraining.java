import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;

public class DoodleTraining extends CoordinatesManager
{
	private static Robot robot;
	public static int numberOfFeeds, numberOfScratches;
    private static String selectedTrick;
    private static boolean infiniteTimeCheckBox, justFeedCheckBox, justScratchCheckBox;
    
	public DoodleTraining()
	{
		try {
			robot = new Robot();
		} catch (AWTException e) {
			e.printStackTrace();
		}
	}
	
	public DoodleTraining(int feeds, int scratches, boolean unlimitedCheckBox, String trick, boolean justFeed, boolean justScratch)
	{
		numberOfFeeds = feeds;
        numberOfScratches = scratches;
        selectedTrick = trick;
        infiniteTimeCheckBox = unlimitedCheckBox;
        justFeedCheckBox = justFeed;
        justScratchCheckBox = justScratch;
	}
	
    public static void startTrainingDoodle()
    {
    	makeBotSleep(2);
        feedAndScratch();
    }

    public static void feedAndScratch()
    {
        if (!infiniteTimeCheckBox)//infinite checkbox is not checked
        {
            //code here is required so it doesn't get stuck in infinite loop below
            if (justFeedCheckBox)
                numberOfScratches = 0;
            else if (justScratchCheckBox)
                numberOfFeeds = 0;
            while (numberOfFeeds > 0 || numberOfScratches > 0)
            {
                makeBotSleep(5);
                if (numberOfFeeds > 0)//feed doodle
                {
                    feedDoodle();
                    numberOfFeeds--;
                }
                if (numberOfScratches > 0)//scratch doodle
                {
                    scratchDoodle();
                    numberOfScratches--; 
                }
                determineTrick();//perform trick
            }
        }
        else //infinite checkbox is checked, so loop until stopped
        {
            while(true)
            {
                if (justFeedCheckBox)//just feed is checked
                {
                    feedDoodle();
                }
                else if (justScratchCheckBox)//just scratch is checked
                {
                    scratchDoodle();
                }
                else if(!justFeedCheckBox && !justScratchCheckBox)//neither are checked, so do both
                {
                    feedDoodle();
                    scratchDoodle();
                }
                determineTrick();
                makeBotSleep(5);
            }
        }
        showMessageBox("Done Training!");
    }
    
    private static void determineTrick()
    {
    	makeBotSleep(1);
        switch (selectedTrick)
        {
            case "Jump (5 - 10 laff)":
            	//System.out.println("Found Trick!");
                for(int i = 0; i < 2; i++)//attempt trick 2 times incase doodle gets confused
                {
                    openSpeedChat();
                    trainJump();
                }
                break;
            case "Beg (6 - 12 laff)":
                for (int i = 0; i < 2; i++)//attempt trick 2 times incase doodle gets confused
                {
                    openSpeedChat();
                    trainBeg();
                }
                break;
            case "Play Dead (7 - 14 laff)":
                for (int i = 0; i < 2; i++)//attempt trick 2 times incase doodle gets confused
                {
                    openSpeedChat();
                    trainPlayDead();
                }
                break;
            case "Rollover (8 - 16 laff)":
                for (int i = 0; i < 2; i++)//attempt trick 2 times incase doodle gets confused
                {
                    openSpeedChat();
                    trainRollover();
                }
                break;
            case "Backflip (9 - 18 laff)":
                for (int i = 0; i < 2; i++)//attempt trick 2 times incase doodle gets confused
                {
                    openSpeedChat();
                    trainBackflip();
                }
                break;
            case "Dance (10 - 20 laff)":
                for (int i = 0; i < 2; i++)//attempt trick 2 times incase doodle gets confused
                {
                    openSpeedChat();
                    trainDance();
                }
                break;
            case "Speak (11 - 22 laff)":
                for (int i = 0; i < 2; i++)//attempt trick 2 times incase doodle gets confused
                {
                    openSpeedChat();
                    trainSpeak();
                }
                break;
            default:
                showMessageBox("Error!");
                break;
        }
    }

    private static void openSpeedChat()
    {
        makeBotSleep(1);
        //Below is the location for the SpeedChat button location
        //check if coordinates for the button is (0,0). True means they're not (0,0).
        if (checkCoordinates("20"))
        {
            getCoords("20");
            robot.mouseMove(x, y);
			robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(1);

            //Below is the location for pets tab
            //check if coordinates for the button is (0,0). True means they're not (0,0).
            if (checkCoordinates("21"))
            {
                getCoords("21");
                robot.mouseMove(x, y);
                robot.delay(200);
    			robot.mousePress(InputEvent.BUTTON1_MASK);
    			robot.delay(200);
    			robot.mouseRelease(InputEvent.BUTTON1_MASK);
                makeBotSleep(1);

                //Below is the location for tricks tab
                //check if coordinates for the button is (0,0). True means they're not (0,0).
                if (checkCoordinates("22"))
                {
                    getCoords("22");
                    robot.mouseMove(x, y);
                    robot.delay(200);
        			robot.mousePress(InputEvent.BUTTON1_MASK);
        			robot.delay(200);
        			robot.mouseRelease(InputEvent.BUTTON1_MASK);
                    makeBotSleep(1);
                }
                else
                {
                    updateCoordinates("22");
                    makeBotSleep(2);
                    openSpeedChat();
                }
            }
            else
            {
                updateCoordinates("21");
                makeBotSleep(2);
                openSpeedChat();
            }
        }
        else//means it was (0,0) and needs updated
        {
            updateCoordinates("20");
            makeBotSleep(2);
            openSpeedChat();
        }
    }

    private static void trainBeg()
    {
        //check if coordinates for the button is (0,0). True means they're not (0,0).
        if (checkCoordinates("24"))
        {
            getCoords("24");
            robot.mouseMove(x, y);
            robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(2);
        }
        else//means it was (0,0) and needs updated
        {
            updateCoordinates("24");
            makeBotSleep(2);
            trainBeg();
        }
    }

    private static void trainPlayDead()
    {
        //check if coordinates for the button is (0,0). True means they're not (0,0).
        if (checkCoordinates("25"))
        {
            getCoords("25");
            robot.mouseMove(x, y);
            robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(2);
        }
        else//means it was (0,0) and needs updated
        {
            updateCoordinates("25");
            makeBotSleep(2);
            trainPlayDead();
        }
    }

    private static void trainRollover()
    {
        //check if coordinates for the button is (0,0). True means they're not (0,0).
        if (checkCoordinates("26"))
        {
            getCoords("26");
            robot.mouseMove(x, y);
            robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(2);
        }
        else//means it was (0,0) and needs updated
        {
            updateCoordinates("26");
            makeBotSleep(2);
            trainRollover();
        }
    }

    private static void trainBackflip()
    {
        //check if coordinates for the button is (0,0). True means they're not (0,0).
        if (checkCoordinates("27"))
        {
            getCoords("27");
            robot.mouseMove(x, y);
            robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(2);
        }
        else//means it was (0,0) and needs updated
        {
            updateCoordinates("27");
            makeBotSleep(2);
            trainBackflip();
        }
    }

    private static void trainDance()
    {
        //check if coordinates for the button is (0,0). True means they're not (0,0).
        if (checkCoordinates("28"))
        {
            getCoords("28");
            robot.mouseMove(x, y);
            robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(2);
        }
        else//means it was (0,0) and needs updated
        {
            updateCoordinates("28");
            makeBotSleep(2);
            trainDance();
        }
    }

    private static void trainSpeak()
    {
        //check if coordinates for the button is (0,0). True means they're not (0,0).
        if (checkCoordinates("29"))
        {
            getCoords("29");
            robot.mouseMove(x, y);
            robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(2);
        }
        else//means it was (0,0) and needs updated
        {
            updateCoordinates("29");
            makeBotSleep(2);
            trainSpeak();
        }
    }

    private static void trainJump()
    {
        //check if coordinates for the button is (0,0). True means they're not (0,0).
        if (checkCoordinates("23"))
        {
            getCoords("23");
            robot.mouseMove(x, y);
            robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(2);
        }
        else//means it was (0,0) and needs updated
        {
            updateCoordinates("23");
            makeBotSleep(2);
            trainJump();
        }
    }

    private static void feedDoodle()
    {
        //check if coordinates for the button is (0,0). True means they're not (0,0).
        if (checkCoordinates("18"))
        {
            getCoords("18");
            robot.mouseMove(x, y);
            robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep("11500");
        }
        else//means it was (0,0) and needs updated
        {
            updateCoordinates("18");
            makeBotSleep(2);
            feedDoodle();
        }
    }

    private static void scratchDoodle()
    {
        if (checkCoordinates("19"))
        {
            getCoords("19");
            robot.mouseMove(x, y);
            robot.delay(200);
			robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(10);
        }
        else
        {
            updateCoordinates("19");
            makeBotSleep(2);
            scratchDoodle();
        }
    }

    private static int x, y;
    private static void getCoords(String item)
    {
        int[] coordinates = getCoordinates(item);
        x = coordinates[0];
        y = coordinates[1];
    }
	
	public void run()
	{
		startTrainingDoodle();
	}
}
