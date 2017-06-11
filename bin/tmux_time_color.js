#!/usr/bin/env osascript -l JavaScript
ObjC.import('stdio')


function run(argv) {
    var hour = new Date().getHours();
    var color = 'white';
    if (hour < 8 || hour >= 22)
        color = 'red';
    else if (hour >= 20)
        color = 'brightred';
    else if (hour >= 18)
        color = 'yellow';

    $.printf('#[fg=%s]', color);
}
