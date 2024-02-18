module main

import op
import rb

pub struct Arguments {
}

pub fn (a Arguments)new() Arguments {
	mut option_parser := op.OptionParser{}
	mut ref_op := &option_parser

	option_parser.banner('Json Change modifies or creates a container\n' +
	'in a json file. Just specify the path to the json file\n' +
	'and then the key to be modified or created with the value.\n\n' +
	'Usage: ${rb.get_app_name()} [file] [key] [value] [options]' +
	'\n\nOptions:')

	l_helper := fn [mut ref_op] (_ string) {
		print(ref_op.help_str())
		exit(0)
	}
	option_parser.on("-h", "--help", "Show help", l_helper)
	option_parser.on("-v", "--version", "Show version", fn (_ string) {
		rb.Event{name: 'version'}.println(version)
		exit(0)
	})
	option_parser.init()

	return a
}
