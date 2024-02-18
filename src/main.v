module main

import jp
import rb
import os

fn main() {
	args := unsafe { os.args }
	Arguments{}.new()

	if args.len > 3 {
		mut json_parser := jp.JsonParser{ path: args[1] }
		json_parser.set(args[2], args[3])
		rb.Event{name: 'set'}
			.println("${args[2]}: ${args[3]}")
	}
	else {
		rb.Event{name: 'error'}
			.println('Add an 3 arguments (file, key, value)!')
	}
}
