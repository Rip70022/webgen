#!/bin/bash

# Color definitions for terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ASCII Art Title
TITLE_ASCII="""
_____________________________________________________________________
               ░██╗░░░░░░░██╗███████╗██████╗░
               ░██║░░██╗░░██║██╔════╝██╔══██╗
               ░╚██╗████╗██╔╝█████╗░░██████╦╝
               ░░████╔═████║░██╔══╝░░██╔══██╗
               ░░╚██╔╝░╚██╔╝░███████╗██████╦╝
               ░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░
                    █████▀███████████████
                    █─▄▄▄▄█▄─▄▄─█▄─▀█▄─▄█
                    █─██▄─██─▄█▀██─█▄▀─██
                    ▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▄▀▀▄▄▀
                             (v1.0)
                      (by Shadow_Sadist💥)
_____________________________________________________________________
"""

# Print Title in Color
echo -e "${CYAN}${TITLE_ASCII}${NC}"

# Prompt for title, content, and filename
echo -e "${BLUE}Enter the title:${NC}"
read title
echo -e "${BLUE}Enter the content:${NC}"
read content
echo -e "${BLUE}Enter the filename (without extension):${NC}"
read filename

# Prompt for theme selection
echo -e "${CYAN}Choose a theme (1-5):${NC}"
echo "1. Light"
echo "2. Dark"
echo "3. Neon"
echo "4. Minimal"
echo "5. Futuristic"
read theme_choice

# Prompt for color scheme selection
echo -e "${CYAN}Choose a color scheme (1-5):${NC}"
echo "1. Blue"
echo "2. Red"
echo "3. Green"
echo "4. Yellow"
echo "5. Purple"
read color_choice

# Prompt for port number
echo -e "${BLUE}Enter the port number (default is 8000):${NC}"
read port
port=${port:-8000}  # Set to 8000 if no input

# Python block to generate HTML based on choices
python3 - <<END
title = "$title"
content = "$content"
filename = "$filename.html"

# Map theme choice to theme name
theme = {
    "1": "light",
    "2": "dark",
    "3": "neon",
    "4": "minimal",
    "5": "futuristic"
}.get("$theme_choice", "light")  # Default to light if invalid choice

# Map color choice to color name
color = {
    "1": "blue",
    "2": "red",
    "3": "green",
    "4": "yellow",
    "5": "purple"
}.get("$color_choice", "blue")  # Default to blue if invalid choice

# Generate HTML with CSS theme and color scheme
html = f'''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
    <link rel="stylesheet" href="styles/{theme}/{color}.css">
</head>
<body>
    <div class="container">
        <h1>{title}</h1>
        <p>{content}</p>
    </div>
</body>
</html>
'''

# Write HTML to file
with open(filename, "w") as f:
    f.write(html)

print(f"File '{filename}' created successfully with theme '{theme}' and color '{color}'.")
END

# Start the server on the specified port and open in browser
python3 -m http.server "$port" & sleep 1
xdg-open "http://localhost:${port}/${filename}.html"