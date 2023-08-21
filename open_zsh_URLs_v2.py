import subprocess
import re


with open('./zsh/.zshrc', 'r') as f:
    lines = f.readlines()

# Extract page names from lines 21 to 36
start_line = 21
end_line = 32
page_names = [line.strip()[1:].strip() for line in lines[start_line - 1:end_line]]

browser_command = "open -a 'Brave Browser.app'"
base_url = "https://en.wikipedia.org/wiki/"

for page_name in page_names:
    formatted_name = page_name.replace("_", " ")
    full_url = base_url + page_name
    full_command = f'{browser_command} "{full_url}"'
    
    subprocess.run(full_command, shell=True)
    print(f"Executed: {full_command}")
