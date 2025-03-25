// Register methods
m_devmenu();

all_categories_data = ds_map_create();
categories_count = 0;
category_data = [];
category_id = 0;
category_options_count = 0;
option_id = 0;
room_to_load = noone;

// Set Discord data
discord_set_data("In Menus", "", "drp_project_icon", "");

// Add categories and options to the developer menu
m_devmenu_add_category    // ID 0
(
    "ORBINAUT FRAMEWORK 2" + "\n" + "DEVELOPER MENU",
	
    "START GAME",
    "ROOM SELECT",
    "SETTINGS",
    "CLOSE GAME"
);

m_devmenu_add_category    // ID 1
(
    "START GAME" + "\n" + "press action 3 to delete a save file",
	
    "NO SAVE",
    "SAVE 0",
    "SAVE 1",
    "SAVE 2",
    "SAVE 3"
);

m_devmenu_add_category    // ID 2
(
    "ROOM SELECT",
	
   "COLLISION CANVAS",
	"NEVER LAKE 1",
	"NEVER LAKE 2",
	"SKYLINE SQUARE 1",
	"SKYLINE SQUARE 2",
	"BRIDGE LAGOON 1",
	"BRIDGE LAGOON 2",
	"BLOCKSIDE PARK 1",
	"BLOCKSIDE PARK 2",
	"SPRING GARDENS 1",
	"SPRING GARDENS 2",
	"DAWNBREAK DRIVE 1",
	"DAWNBREAK DRIVE 2",
	"AURORA ICEFIELD 1",
	"AURORA ICEFIELD 2",
	"EGGSERVATORY 1",
	"EGGSERVATORY 2",
	"HILLTOP HEIGHTS",
	"AZURE CARNIVAL R1",
	"WAHOO RACEWAY 3 R3",
	"BIG HILL",
	"TECH STADIUM 1",
    "BONUS STAGE",
    "SPECIAL STAGE",
    "CONTINUE"
	
);

m_devmenu_add_category    // ID 3
(
    "SETTINGS",
	
    "GAMEPAD RUMBLE",
    "BGM VOLUME",
    "SFX VOLUME",
    "WINDOW SCALE",
    "FULLSCREEN",
    "VSYNC"
);

m_devmenu_add_category    // ID 4
(
    "PLAYER 1 SELECT",
    "SONIC",
    "TAILS",
    "KNUCKLES",
    "AMY",
	"SETSUKA",
	"KATSURAGI",
	"MILA",
	"EGGMAN",
);

m_devmenu_add_category    // ID 5
(
    "PLAYER 2 SELECT",
	
    "SONIC",
    "TAILS",
    "KNUCKLES",
    "AMY",
	"SETSUKA",
	"KATSURAGI",
	"MILA",
	"EGGMAN",
    "NO PLAYER 2"
);

// Load the first category of the developer menu
m_devmenu_load_category(0);