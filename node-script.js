/*
  Converts html 2 markdown format (c)
  Execute it in such way:
     nodejs [script.js] ["<html>..</html>"]
  InterLink nodejs script
*/
function to_markdown(html) {
  var exec = require("child_process").exec;
  var html2markdown = require('html2markdown');
  return html2markdown(html);
}

var INPUT_STREAM_INDEX = 2
var OUTPUT_FILE_INDEX = 3

input_stream = process.argv[INPUT_STREAM_INDEX]
output_file = process.argv[OUTPUT_FILE_INDEX]

var fs = require('fs');
fs.writeFile(output_file, to_markdown(input_stream));
