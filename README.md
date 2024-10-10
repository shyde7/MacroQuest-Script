# EverQuest MacroQuest Healing Script

This repository contains two scripts for healing and managing tank buffs during combat in EverQuest using **MacroQuest**. The first script is written in the original `.mac` format, and the second is a Lua version of the same script with improvements to functions and overall readability.

## Files

- `healy.mac`: 
  - Purpose: A MacroQuest script used to keep the tank alive during combat with a healing party member.
  - Authors: Sean Hyde
  - Date: 02/15/2024
  - This script checks the tank's HP, casts healing spells if their HP falls below 60%, and buffs the tank when necessary.

- `healy.lua`: 
  - Purpose: Lua conversion of the original `.mac` script for better flexibility and function improvements.
  - Authors: Sean Hyde
  - Date: 02/15/2024
  - This Lua script follows the same structure as the `.mac` version but uses the Lua scripting capabilities of MacroQuest for better control and extensibility.

## Features

1. **Automatic Healing**: 
   - Continuously monitors the tank's HP and casts healing spells if the HP drops below 60%.
   
2. **Buff Management**:
   - Ensures that essential buffs, such as "Strengthen", are active on the tank.
   
3. **Healer Mana and Health Management**:
   - Automatically rests the healer if health or mana drops below 20%, and continues until both are fully restored.

## How to Use

1. **For the `.mac` file**:
   - Load the script into MacroQuest using the following command in-game:
     ```
     /mac healy.mac
     ```

2. **For the Lua file**:
   - Make sure Lua scripting is enabled in your MacroQuest setup.
   - Load the script using:
     ```
     /lua run healy.lua
     ```

## Requirements

- **MacroQuest**: Ensure you have the latest version of MacroQuest installed to support both `.mac` and Lua scripts.
- **EverQuest**: These scripts are specifically designed for in-game healing management during combat situations.
