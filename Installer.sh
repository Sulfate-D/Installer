#!/bin/bash

main() {
    echo -e "Welcome to the Installer Script!"
    echo -e "Please choose an option:"
    echo -e "1. Join our Discord server and proceed"
    echo -e "2. Just proceed"
    read -p "Enter your choice (1 or 2): " choice

    case $choice in
        1)
            echo -e "Please join our Discord server at: https://discord.gg/xrf33AvS"
            echo -e "Press any key to continue..."
            read -n 1 -s
            proceed
            ;;
        2)
            proceed
            ;;
        *)
            echo -e "Invalid choice. Exiting..."
            exit 1
            ;;
    esac
}

proceed() {
    echo -e "Proceeding with the (dummy) installation process..."
    echo -e "Step 1: (Dummy) Downloading Latest Application"
    sleep 2  # Simulate download time

    echo -e "Step 2: (Dummy) Installing Latest Application"
    sleep 2  # Simulate installation time

    echo -e "Step 3: (Dummy) Downloading YourPatch"
    sleep 2  # Simulate download time

    echo -e "Step 4: (Dummy) Installing YourPatch"
    sleep 2  # Simulate installation time

    echo -e "Step 5: (Dummy) Patching Application"
    sleep 2  # Simulate patching time

    echo -e "Step 6: (Dummy) Installing YourPatch App"
    sleep 2  # Simulate installation time

    echo -e "Install Complete! Developed by The Leper!"
}

main
