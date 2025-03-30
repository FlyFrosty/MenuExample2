import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

    var menuSelector;  //The boolean returned by the toggleMenu 

class newTryView extends WatchUi.WatchFace {

    var wWidth=200;
    var wHeight=200;

    function initialize() {
        WatchFace.initialize();
        menuSelector = Application.Storage.getValue("mySelection");
        if(menuSelector==null) {menuSelector=false;}
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        
        wHeight = dc.getHeight(); 
        wWidth = dc.getWidth();
    }


    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        if (menuSelector) {
            System.println("View line 36");
            dc.setColor(Graphics.COLOR_DK_RED, Graphics.COLOR_TRANSPARENT);
        } else {
            System.println("View line 39");
            dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        }
        dc.drawText(wWidth/2,wHeight/2,Graphics.FONT_LARGE,timeString,Graphics.TEXT_JUSTIFY_CENTER);

    }

    function getSettingsView() as [Views] or [Views, InputDelegates] or Null {
        var menu = new newTrySettingsMenu();
        return [menu, new newTrySettingsMenuDelegate(menu)];
    }

}

class newTryDelegate extends WatchUi.WatchFaceDelegate {
	
	function initialize() {
		WatchFaceDelegate.initialize();
    }
}