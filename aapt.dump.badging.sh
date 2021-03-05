apk="${1:-chrome.apk}"
fname=$(fname $(basename "$apk"))
aapt dump badging "$apk"
