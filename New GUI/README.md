### New GUI
# !Now works only with "Big" interface size!
# !Otherwise you'll get too big or too little images!
Installation:
* Copy "addons" folder to root of your mission
* If you do not have "RscTitles" class in your description.ext, add at the bottom:
```
// T-Max Gui
#include "addons\tmax_gui\gui_config.hpp"
```
* If you have "RscTitles" class in your description.ext, add inside "RscTitles" class:
```
// T-Max Gui
#include "addons\tmax_gui\gui_config_noRscTitles.hpp"
```
That's all.
GLHF