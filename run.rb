# This script produces: CyrillicWindows1251 -> decode to UTF -> convert to Markdown 'markdown.out'
#
TARGET_HTML_FILE = '1.htm'
#
#
OUTPUT_MD_RESULT = 'output.md'
#
NODE_SCRIPT_FILE = 'node-script.js'
#
#
utf_encoded_html = `iconv -f cp1251 -t UTF-8 #{TARGET_HTML_FILE}`
#
# FIX :1: - Each paragraph starts with new line
utf_encoded_html = utf_encoded_html.gsub('<p', '--BR/--<p').gsub('<P', '--BR/--<P')
#
markdown_content = `nodejs #{NODE_SCRIPT_FILE} "#{utf_encoded_html} " #{OUTPUT_MD_RESULT}`
#
text = File.read(OUTPUT_MD_RESULT) 
updated_text = text.gsub('--BR/--', "\n\n")
File.open(OUTPUT_MD_RESULT, "w") { |file| file << updated_text }