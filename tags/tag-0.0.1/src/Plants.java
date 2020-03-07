import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.util.HashMap;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class Plants extends CoordinatesManager
{
	private static HashMap<String, String> flowerMap = new HashMap<String, String>();
	private static String flowers[];
	private final static JFrame parent = new JFrame();
	private static int x, y;
	private static Robot robot;
	
	public Plants()
	{
		try {
			robot = new Robot();
		} catch (AWTException e) {
			e.printStackTrace();
		}
		createMap();
		parent.setAlwaysOnTop(true);
	}
	
	public static void createPlantsWindow(String selectedItem)
	{
		loadFlowers(selectedItem);
		plantFlower((String) JOptionPane.showInputDialog(parent, "Choose a flower to plant...", "Flower Manager", JOptionPane.PLAIN_MESSAGE, null, flowers, flowers[0]));
	}
	
	private static void createMap()
    {
        //1 bean
        flowerMap.put("Laff-o-dil", "g");
        flowerMap.put("Dandy Pansy", "o");
        flowerMap.put("What-in Carnation", "i");
        flowerMap.put("School Daisy", "y");
        flowerMap.put("Lily-of-the-Alley", "c");
        //2 bean
        flowerMap.put("Daffy Dill", "gc");
        flowerMap.put("Chim Pansy", "oc");
        flowerMap.put("Instant Carnation", "iy");
        flowerMap.put("Lazy Daisy", "yr");
        flowerMap.put("Lily Pad", "cg");
        //3 bean
        flowerMap.put("Summer's Last Rose", "rrr");
        flowerMap.put("Potsen Pansy", "orr");
        flowerMap.put("Hybrid Carnation", "irr");
        flowerMap.put("Midsummer Daisy", "yrg");
        flowerMap.put("Tiger Lily", "coo");
        //4 bean
        flowerMap.put("Corn Rose", "ryoy");
        flowerMap.put("Giraff-o-dil", "giyy");
        flowerMap.put("Marzi Pansy", "oyyr");
        flowerMap.put("Freshasa Daisy", "yrco");
        flowerMap.put("Livered Lily", "cooi");
        //5 bean
        flowerMap.put("Time and a half-o-dil", "gibii");
        flowerMap.put("Onelip", "urbuu");
        flowerMap.put("Side Carnation", "irgbr");
        flowerMap.put("Whoopsie Daisy", "yrooo");
        flowerMap.put("Chili Lily", "crrrr");
        //6 bean
        flowerMap.put("Tinted Rose", "rioroi");
        flowerMap.put("Smarty Pansy", "oiiobi");
        flowerMap.put("Twolip", "urrruu");
        flowerMap.put("Upsy Daisy", "ybcubb");
        flowerMap.put("Silly Lily", "cruuuu");
        //7 bean
        flowerMap.put("Stinking Rose", "rcoiucc");
        flowerMap.put("Car Petunia", "bubucbb");
        flowerMap.put("Model Carnation", "iggggyg");
        flowerMap.put("Crazy Daisy", "ygroggg");
        flowerMap.put("Indubitab Lily", "cucbcbb");
        //8 bean
        flowerMap.put("Istilla Rose", "rbuubbib");
        flowerMap.put("Threelip", "uyyuyouy");
        flowerMap.put("Platoonia", "biibroyy");
        flowerMap.put("Hazy Dazy", "ybucurou");
        flowerMap.put("Dilly Lilly", "cbyycbyy");
    }
	
	public static void loadFlowers(String beans)
    {
        switch (beans)
        {
            case "1 Bean Plant":
            	String[] bean1 = { "Laff-o-dil", "Dandy Pansy", "What-in Carnation", "School Daisy", "Lily-of-the-Alley" };
            	flowers = bean1;
                break;
            case "2 Bean Plant":
            	String[] bean2 = { "Daffy Dill", "Chim Pansy", "Instant Carnation", "Lazy Daisy", "Lily Pad" };
            	flowers = bean2;
            	break;
            case "3 Bean Plant":
            	String[] bean3 = { "Summer's Last Rose", "Potsen Pansy", "Hybrid Carnation", "Midsummer Daisy", "Tiger Lily" };
            	flowers = bean3;
            	break;
            case "4 Bean Plant":
            	String[] bean4 = { "Corn Rose", "Giraff-o-dil", "Marzi Pansy", "Freshasa Daisy", "Livered Lily" };
            	flowers = bean4;
            	break;
            case "5 Bean Plant":
            	String[] bean5 = { "Time and a half-o-dil", "Onelip", "Side Carnation", "Whoopsie Daisy", "Chili Lily" };
            	flowers = bean5;
            	break;
            case "6 Bean Plant":
            	String[] bean6 = { "Tinted Rose", "Smarty Pansy", "Twolip", "Upsy Daisy", "Silly Lily" };
            	flowers = bean6;
            	break;
            case "7 Bean Plant":
            	String[] bean7 = { "Stinking Rose", "Car Petunia", "Model Carnation", "Crazy Daisy", "Indubitab Lily" };
            	flowers = bean7;
            	break;
            case "8 Bean Plant":
            	String[] bean8 = { "Istilla Rose", "Threelip", "Platoonia", "Hazy Dazy", "Dilly Lilly" };
            	flowers = bean8;
            	break;
        }
    }
	
	private static void plantFlower(String flowerToPlant)
	{
		int result = JOptionPane.showConfirmDialog(parent, "Plant " + flowerToPlant + "?");
		if(result == JOptionPane.YES_OPTION)
		{
			if (!checkCoordinates("1"))//if they're 0,0, enter and update the coordiantes
				updateCoordinates("1");//update the red fishing button coords
			else//continue, coords don't need updated
			{
				result = JOptionPane.showConfirmDialog(parent, "Press OK when ready to begin!", "", JOptionPane.OK_CANCEL_OPTION);
				if(result == JOptionPane.OK_OPTION)//continue to plant
				{
					makeBotSleep(2);
					bringTTRScreenToFocus();
					getCoords("1");
					robot.mouseMove(x, y);
					robot.delay(200);
					robot.mousePress(InputEvent.BUTTON1_MASK);
					robot.delay(200);
					robot.mouseRelease(InputEvent.BUTTON1_MASK);
					makeBotSleep(2);
					checkBeans("2");
					char[] beans = flowerMap.get(flowerToPlant).toCharArray();
					selectBeans(beans);
					pressPlantButton();
					makeBotSleep("1500");
					showMessageBox("Done!");
				}
				else
					return;
			}
		}
	}
	
	private static void checkBeans(String location)
    {
        if (Integer.parseInt(location) <= 10)
        {
            if (!checkCoordinates(location))//if they're 0,0
            {
                updateCoordinates(location);
                checkBeans(Integer.toString(Integer.parseInt(location) + 1));
            }
            else
            	checkBeans(Integer.toString(Integer.parseInt(location) + 1));
        }
    }
	
	private static void getCoords(String item)
	{
		int[] coordinates = CoordinatesManager.getCoordinates(item);
		x = coordinates[0];
		y = coordinates[1];
	}
	
	private static void pressPlantButton()
    {
        if (checkCoordinates("11"))
        {
            getCoords("11");
            robot.mouseMove(x, y);
            robot.delay(200);
            robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(8);
            clickOKAfterPlant();
            waterPlant();
        }
        else
        {
            updateCoordinates("11");
            makeBotSleep(2);
            pressPlantButton();
        }
    }
	
	private static void selectBeans(char[] beans)
    {
        for (int i = 0; i < beans.length; i++)
        {
            switch (beans[i])
            {
                case 'r':
                    getCoords("2");
                    break;
                case 'g':
                    getCoords("3");
                    break;
                case 'o':
                    getCoords("4");
                    break;
                case 'u':
                    getCoords("5");
                    break;
                case 'b':
                    getCoords("6");
                    break;
                case 'i':
                    getCoords("7");
                    break;
                case 'y':
                    getCoords("8");
                    break;
                case 'c':
                    getCoords("9");
                    break;
                case 's':
                    getCoords("10");
                    break;
            }
            robot.mouseMove(x, y);
            robot.delay(200);
            robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(2);
        }
    }
	
	private static void clickOKAfterPlant()
    {
        if (checkCoordinates("12"))
        {
            getCoords("12");
            robot.mouseMove(x, y);
            robot.delay(200);
            robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
            makeBotSleep(2);
        }
        else
        {
            updateCoordinates("12");
            makeBotSleep(2);
            clickOKAfterPlant();
        }
    }

    public static void waterPlant()
    {
        if (checkCoordinates("13"))
        {
            getCoords("13");
            robot.mouseMove(x, y);
            robot.delay(200);
            robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
			makeBotSleep(4);
            robot.mouseMove(x, y);
            robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
			makeBotSleep(2);
        }
        else
        {
            updateCoordinates("13");
            makeBotSleep(2);
            waterPlant();
        }
    }

    public static void removePlant()
    {
        if (checkCoordinates("1"))
        {
            getCoords("1");
            showMessageBox("Press OK when ready to begin!");
            makeBotSleep(2);
            robot.mouseMove(x, y);
            robot.delay(200);
            robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
			robot.delay(300);
            selectYESToRemove();
        }
        else
        {
            updateCoordinates("1");//update the plant flower button coords
            removePlant();
            makeBotSleep(2);
        }

    }

    private static void selectYESToRemove()
    {
        if (checkCoordinates("14"))
        {
            getCoords("14");
            robot.mouseMove(x, y);
            robot.delay(200);
            robot.mousePress(InputEvent.BUTTON1_MASK);
			robot.delay(200);
			robot.mouseRelease(InputEvent.BUTTON1_MASK);
        }
        else
        {
            updateCoordinates("14");//update the plant flower button coords
            selectYESToRemove();
            makeBotSleep(2);
        }
    }
}
