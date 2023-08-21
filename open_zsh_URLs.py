import requests
import subprocess

with open('./zsh/.zshrc', 'r') as f:
    lines = f.readlines()

# # Extract page names from lines 21 to 36
# start_line = 21
# end_line = 36
# page_names = [line.strip() for line in lines[start_line - 1:end_line]]

# # Extract page names from lines 21 to 36
# #start_line = 21
# #end_line = 36
# #page_names = [line.strip()[1:].strip() for line in lines[start_line - 1:end_line]]

# browser_command = "brave"
# base_url = "https://en.wikipedia.org/wiki/"

# for page_name in page_names:
#     formatted_name = page_name.replace("_", " ")
#     full_command = f'{browser_command} "{base_url}{page_name}"'
#     print(f"Executing: {full_command}")


# for page_name in page_names:
#     full_url = base_url + page_name
#     response = requests.get(full_url)
#     if response.status_code == 200:
#         print(f"Opened: {full_url}")
#     else:
#         print(f"Failed to open: {full_url}")


# Extract page names from lines 21 to 36
start_line = 21
end_line = 36
page_names = [line.strip()[1:].strip() for line in lines[start_line - 1:end_line]]

pattern = r'en\.wikipedia\.org/wiki/([^\s]+)'
matches = re.search(r'(?<={}\n).*?(?=\n\s*})', content, re.DOTALL)
if matches:
    page_names = re.findall(pattern, matches.group(0))
else:
    page_names = []

browser_command = "open -a 'Brave Browser.app'"
base_url = "https://en.wikipedia.org/wiki/"

for page_name in page_names:
    formatted_name = page_name.replace("_", " ")
    full_url = base_url + page_name
    full_command = f'{browser_command} "{full_url}"'
    subprocess.run(full_command, shell=True)
    print(f"Executing: {full_command}")

