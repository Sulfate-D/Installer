
echo -e "Patching Roblox"
mv ./sky.dylib "/Applications/Roblox.app/Contents/MacOS/sky.dylib"
./insert_dylib "/Applications/Roblox.app/Contents/MacOS/sky.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"
rm ./insert_dylib
