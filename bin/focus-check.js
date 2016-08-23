#!/usr/bin/env node

var pwd = process.cwd();
var paths = process.argv.splice(2).map(function (p) { return pwd + '/' + p });
var execSync = require('child_process').execSync;

var containedFocus = paths.map(function (path) {
  return checkOnlyCall(path) || checkFocusRocket(path);
});

if (containedFocus.indexOf(true) > -1) {
  console.error('Some of the files contained a focussed test!')
  process.exit(1);
}

function checkOnlyCall (path) {
  var cmd = 'grep ".only(" ' + path + ' -nr';

  return runCheck(cmd);
}

function checkFocusRocket (path) {
  var cmd = 'egrep "\\([\'\\"]\\s*=>" ' + path + ' -nr';

  return runCheck(cmd);
}

function runCheck(cmd) {
  try {
    var error = execSync(cmd).toString()

    console.error(error);

    return true;
  } catch (e) {
    // The file is not containing an .only statement
    return false;
  }
}
