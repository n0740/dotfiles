#!/usr/bin/env osascript -l JavaScript
ObjC.import('stdio')
ObjC.import('stdlib')
ObjC.import('AppKit')


function readJSONFile(file) {
    try {
        var data = ObjC.unwrap($.NSString.stringWithContentsOfFile(file));
        return JSON.parse(data);
    } catch(err) {
    }
}


function readConfig() {
    var configFile = $.getenv('HOME') + '/.tmux_mail_count.json';
    return readJSONFile(configFile);
}


function isApplicationRunning(appBundle) {
    var isRunning = false;

    // Note these never take () unless they have arguments
    var apps = $.NSWorkspace.sharedWorkspace.runningApplications

    // Unwrap the NSArray instance to a normal JS array
    apps = ObjC.unwrap(apps);
    var app;
    for (var i = 0, j = apps.length; i < j; i++) {
        app = apps[i]
        if (ObjC.unwrap(app.bundleIdentifier) === appBundle) {
            isRunning = true;
            break;
        }
    }
    return isRunning;
}


function makeStatusLine(inboxCount, criticalCount) {
    var result = '';
    if (criticalCount > 0) {
        result += `#[fg=brightred]💥 (${criticalCount})`;
    }
    if (inboxCount > 0) {
        if (result.length > 0) {
            result += ' ';
        }
        result += `#[fg=white]📨 (${inboxCount})`;
    }
    return result;
}


function run(argv) {
    if (!isApplicationRunning('com.apple.mail')) {
        return;
    }

    var config = readConfig();
    var Mail = Application('Mail')

    var inboxCount = Mail.inbox.unreadCount();
    var criticalCount = 0;
    if (config != undefined) {
        criticalCount = Mail.accounts
            .byName("work")
            .mailboxes
            .byName("@Monitoring")
            .unreadCount();
    }

    var statusLine = makeStatusLine(inboxCount, criticalCount);
    if (statusLine.length > 0) {
        $.printf('%s', statusLine);
    }
}
