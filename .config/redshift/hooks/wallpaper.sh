#!/bin/sh

sunsetImg=~/Pictures/Wallpapers/16x9/louis-coyle-Lakeside_Sunset_1920x1080.png
sunriseImg=~/Pictures/Wallpapers/16x9/louis-coyle-Lakeside_SunRise_1920x1080.jpg

function sunset {
    # change to sunset wallpaper
    # echo "sunset"
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDVI-D-0/workspace0/last-image --set $sunsetImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDVI-D-0/workspace1/last-image --set $sunsetImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-0/workspace0/last-image --set $sunsetImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-0/workspace1/last-image --set $sunsetImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-4/workspace0/last-image --set $sunsetImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-4/workspace1/last-image --set $sunsetImg
}

function sunrise {
    # change to sunrise wallpaper
    # echo "sunrise"
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDVI-D-0/workspace0/last-image --set $sunriseImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDVI-D-0/workspace1/last-image --set $sunriseImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-0/workspace0/last-image --set $sunriseImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-0/workspace1/last-image --set $sunriseImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-4/workspace0/last-image --set $sunriseImg
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-4/workspace1/last-image --set $sunriseImg
}

if [ "$1" = "period-changed" ]; then
    case $3 in
        daytime)
            # it is now daytime
            sunrise
            ;;
        night)
            # it is now night
            sunset
            ;;
        transition)
            case $2 in
                # transition from daytime into night
                daytime)
                    sunset
                    ;;
                # transition from night into daytime
                night)
                    sunrise
                    ;;
            esac
            ;;
    esac
fi
