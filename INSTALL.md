# WebGen Installation Instructions

**WebGen** is a simple Bash script that allows users to create a basic HTML page by entering a title and content through terminal prompts.

## Installation Instructions

### For Linux

1. **Open Terminal**: Launch your terminal application.

2. **Install Python**: Ensure that Python 3 is installed on your system. Check with:

   ```bash
   python3 --version

If not installed, use:

```bash
sudo apt update
sudo apt install python3

3. Clone the Repository:

```bash
git clone https://github.com/Rip70022/webgen.git


4. Navigate to the Directory:

```bash
cd webgen


5. Make the Script Executable:

```bash
chmod +x webgen.sh


6. Run the Script:

```bash
./webgen.sh


7. Follow the Prompts: Enter the title and content when prompted, confirming each entry by typing yes.


8. View the Generated Page: The script will create an HTML file named generated_page.html, start a local server at http://localhost:8000, and open the page in your default web browser.



For Termux

1. Open Termux.


2. Update Packages:

```bash
pkg update && pkg upgrade


3. Install Python:

```bash
pkg install python -y

4. Clone the Repository:

```bash
git clone https://github.com/Rip70022/webgen.git


5. Navigate to the Directory:

```bash
cd webgen


6. Make the Script Executable:

```bash
chmod +x webgen.sh


7. Run the Script:

```bash
./webgen.sh


8. Follow the Prompts: Enter the title and content when prompted.


9. View the Generated Page: The script will create an HTML file named generated_page.html, start a local server at http://localhost:8000, and open the page in your default browser. 