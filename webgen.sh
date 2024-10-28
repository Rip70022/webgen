#!/bin/bash

# Script name
SCRIPT_NAME="webgen.sh"

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt update
    sudo apt install -y python3
fi

# Prompt for title and confirmation
read -p "Enter the title: " title
read -p "Confirm title (yes/no): " confirm_title
if [[ $confirm_title != "yes" ]]; then
    echo "Process canceled."
    exit 1
fi

# Prompt for content and confirmation
read -p "Enter the content: " content
read -p "Confirm content (yes/no): " confirm_content
if [[ $confirm_content != "yes" ]]; then
    echo "Process canceled."
    exit 1
fi

# HTML file name
filename="generated_page.html"

# Create HTML file using embedded Python block
python3 - <<END
title = "$title"
content = "$content"
filename = "$filename"

html = f"""
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{title}</title>
        <style>
            body {{
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                margin: 0;
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }}
            h1 {{
                color: #3498db;
            }}
            .container {{
                max-width: 600px;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                text-align: center;
            }}
        </style>
    </head>
    <body>
        <div class="container">
            <h1>{title}</h1>
            <p>{content}</p>
        </div>
    </body>
</html>
"""

with open(filename, "w") as file:
    file.write(html)

print(f"File '{filename}' created successfully.")
END

# Start the server and open in browser
python3 -m http.server 8000 & sleep 1
xdg-open "http://localhost:8000/${filename}"
