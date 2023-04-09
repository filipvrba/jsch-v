module main

import src.jp
import src.rb
import os

fn main() {
	args := unsafe { os.args }
	app_name := os.file_name(args[0]).replace_once('\.$', '')

	if args.len > 3 {
		mut json_parser := jp.JsonParser{ path: args[1] }
		json_parser.set(args[2], args[3])
		rb.Event{'set', app_name}
			.println("${args[2]}: ${args[3]}")
	}
	else {
		rb.Event{'error', app_name}
			.println('Add an 3 arguments (file, key, value)!')
	}
}
