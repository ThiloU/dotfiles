import subprocess

appBlacklist = ["polybar-right_DP-0"]
# get all open windows
output = subprocess.run(['wmctrl', '-l'], capture_output=True).stdout.splitlines()
desktopInfo = subprocess.run(['wmctrl', '-d'], capture_output=True).stdout.splitlines()
for i in desktopInfo:
    wordList = str(i).split()
    if(wordList[1] == '*'):
        currentDesktopNumber = int(wordList[0][2:])         # extract desktop number

# filter the output by current desktop and the application name
appInfo = []
for i in output:
    wordList = str(i).split()                               # split entry by words
    desktopNumber = int(wordList[1])
    # print(wordList)
    if desktopNumber == currentDesktopNumber:               # filter for windows only on current workspace
        appInfo.append([wordList[-1], wordList[0]])                       # extract program name (last word) and id (first word)
        appInfo[-1][0] = appInfo[-1][0][:len(appInfo[-1][0])-1]   # delete last char which is always a > ' <
        appInfo[-1][1] = appInfo[-1][1][2:]                       # delete first 2 chars from id which are always > b' <

# print(appInfo)
result = ""
for i in appInfo:
    if(i[0] not in appBlacklist):
        result = result + " %{A1:wmctrl -ia " + i[1] + ":}" + i[0] + "%{A} "
print(result)


# %{A1:alacritty&:}%{A}
