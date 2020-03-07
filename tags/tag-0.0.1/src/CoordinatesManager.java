import java.awt.MouseInfo;
import java.awt.Point;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

public class CoordinatesManager extends Toontown_Rewritten_Bot
{
	private static HashMap<String, String> dataFileMap;
	private static String lines[];
	public CoordinatesManager()
	{
		//key, value
		dataFileMap = new HashMap<String, String>();
		//Gardening Coords
        dataFileMap.put("1", "Plant Flower/Remove Button");
        dataFileMap.put("2", "Red Jellybean Button");
        dataFileMap.put("3", "Green Jellybean Button");
        dataFileMap.put("4", "Orange Jellybean Button");
        dataFileMap.put("5", "Purple Jellybean Button");
        dataFileMap.put("6", "Blue Jellybean Button");
        dataFileMap.put("7", "Pink Jellybean Button");
        dataFileMap.put("8", "Yellow Jellybean Button");
        dataFileMap.put("9", "Cyan Jellybean Button");
        dataFileMap.put("10", "Silver Jellybean Button");
        dataFileMap.put("11", "Blue Plant Button");
        dataFileMap.put("12", "Blue Ok Button");
        dataFileMap.put("13", "Watering Can Button");
        dataFileMap.put("14", "Blue Yes Button");
        //Fishing Coords
        dataFileMap.put("15", "Red Fishing Button");
        dataFileMap.put("16", "Exit Fishing Button");
        dataFileMap.put("17", "Blue Sell All Button");
        //Racing Coords
        //enter later when racing is coded in
        //Doodle Training Coords
        dataFileMap.put("18", "Feed Doodle Button");
        dataFileMap.put("19", "Scratch Doodle Button");
        dataFileMap.put("20", "Green SpeedChat Button");
        dataFileMap.put("21", "Pets Tab in SpeedChat");
        dataFileMap.put("22", "Tricks Tab in SpeedChat");
        dataFileMap.put("23", "Jump Trick Option in SpeedChat");
        dataFileMap.put("24", "Beg Trick Option in SpeedChat");
        dataFileMap.put("25", "Play Dead Trick Option in SpeedChat");
        dataFileMap.put("26", "Rollover Trick Option in SpeedChat");
        dataFileMap.put("27", "Backflip Trick Option in SpeedChat");
        dataFileMap.put("28", "Dance Trick Option in SpeedChat");
        dataFileMap.put("29", "Speak Trick Option in SpeedChat");
        createMap();
        determineLines();
	}
	
	private static ArrayList<String> map = new ArrayList<String>();//stores the values of the hashmap
	private void createMap()//this map is only used for comparing the selected item in updateCoordinates method.
	{
		for(int i = 1; i <= dataFileMap.size(); i++)
		{
			map.add(dataFileMap.get(Integer.toString(i)));
		}
	}
	
	//loads the strings into the combobox on dev tab
	public DefaultComboBoxModel<String> loadCoordsIntoResetBox(DefaultComboBoxModel<String> comboBox)
    {
		for(int i = 1; i <= dataFileMap.size(); i++)
		{
			comboBox.addElement(dataFileMap.get(Integer.toString(i)));
		}
		return comboBox;
    }
	
	public static void updateCoordinates(String selectedItem)//first message that appears when updating coords
	{
		if(selectedItem.length() <= 2)
		{
			selectedItem = dataFileMap.get(selectedItem);
		}
		BotFunctions.showMessageBox("This will help you update your coordinates to work with\nwith your screen. Please move your cursor onto the\nlocation that is says it is updating.");
		BotFunctions.showMessageBox("Updating " + selectedItem + " in 6 seconds.\nPress OK to begin.");
		//problem begins around this area.
        JFrame mainFrame = new JFrame("Updating Coordinates");
        UpdateCoordsHelper timerClass = new UpdateCoordsHelper(selectedItem, mainFrame);
		mainFrame.setAlwaysOnTop(true);
		mainFrame.setSize(412, 159);
		mainFrame.setResizable(false);
		mainFrame.add(timerClass);
		mainFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		mainFrame.setVisible(true);
        timerClass.run();//problem
		//timerClass.startTimer();
	}
	
	public static void updateCoordinatesBehindScenes(String selectedItem)
	{
		//Part below here is for getting the cursor's location to update the coordinate
		Point location = MouseInfo.getPointerInfo().getLocation();
		lines = readCoordinateFile();//scan the coord file for later to overwrite with the updated coordinate value
		String locationToUpdate = "";
		for(int i = 0; i < lines.length; i++)
		{
			if(map.get(i).equals(selectedItem))
				locationToUpdate = Integer.toString(i+1);//plus 1 because the arraylist starts at 0, but the coord file doesn't so the location to update would be +1
		}
		
		for(int i = 0; i < lines.length; i++)
		{
			if (lines[i].contains("."))
			{
				if(locationToUpdate.equals(lines[i].substring(0, lines[i].indexOf('.'))))//look for the number it corresponds to (line that the selectedItem belongs to)
				{
					lines[i] = locationToUpdate + "." + "(" + location.x + "," + location.y + ")";
					writeToCoordFile();
				}
			}
		}
		BotFunctions.showMessageBox(selectedItem + " updated!");
		makeBotSleep(1);
	}
	
	public static void resetAllCoordinates()//method to reset all the coordinates in the data file to default 0,0
	{
		lines = readCoordinateFile();
		for(int i = 0; i < lines.length; i++)
		{
			lines[i] = ((i+1) + ".(0,0)");//i+1 because the coord data file starts at 1, not 0
			writeToCoordFile();
		}
		BotFunctions.showMessageBox("All coordinates reset!");
	}
	
	private static FileWriter writeFile;
	private static void writeToCoordFile()
	{
		new File("Coordinates Data File.txt").delete();
		try
		{
			File file = new File("Coordinates Data File.txt");
			writeFile = new FileWriter(file.getAbsoluteFile(), true);
			BufferedWriter bw = new BufferedWriter(writeFile);
			for(int i = 0; i < lines.length; i++)
			{
				bw.write(lines[i] + "\n");
			}
			bw.close();
		}
		catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	private static String[] readCoordinateFile()
	{
		determineLines();//use this method to determine the number of lines the coordinates file has in order to set the array to the correct size
		String lines[] = new String[numberOfLines];
		int counter = 0;
		try 
		{
			Scanner scan = new Scanner(new File("Coordinates Data File.txt"));
			while(scan.hasNext())
			{
				lines[counter++] = scan.next();//reads line by line, storing each line in the appropriate index.
			}
			scan.close();
		} 
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return lines;
	}
	
	private static int numberOfLines;
	private static void determineLines()//determines the number of lines in the coordinates text file. Num of lines is used to set the proper size for the lines array
	{
		numberOfLines = 0;
		try 
		{
			Scanner scan = new Scanner(new File("Coordinates Data File.txt"));
			while(scan.hasNext())
			{
				scan.next();
				numberOfLines++;
			}
			scan.close();
		} 
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static boolean checkCoordinates(String checkCoords)
    {
		lines = readCoordinateFile();
        for (int i = 0; i < lines.length; i++)
        {
            if (lines[i].contains("."))
            {
                if (checkCoords.equals(lines[i].substring(0, lines[i].indexOf('.'))))//look for the number it corresponds to
                {
                    String check = lines[i];
                    String coords = check.substring(check.indexOf('(') + 1);//removes the first (
                    coords = coords.substring(0, coords.length()-1);//removes the second )
                    if ("0,0".equals(coords))
                    {
                        return false;//returns false if they equals 0,0 and need to be updated
                    }
                }
            }
        }
        return true;//return true if they're not 0,0 and dont need updated
    }
	
	public static int[] getCoordinates(String coordsToRetrieve)
    {
		lines = readCoordinateFile();
        for(int i = 0; i < lines.length; i++)
        {
            if (lines[i].contains("."))
            {
                if (coordsToRetrieve.equals(lines[i].substring(0, lines[i].indexOf('.'))))//look for the number it corresponds to
                {
                	String check = lines[i];
                    String coords = check.substring(check.indexOf('(') + 1);//removes the first (
                    coords = coords.substring(0, coords.length()-1);//removes the second )
                    String[] points = coords.split(",");
                    int x = Integer.parseInt(points[0]);
                    int y = Integer.parseInt(points[1]);
                    int[] locations = {x,y};
                    return locations;
                }
            }
        }
        return null;
    }
}