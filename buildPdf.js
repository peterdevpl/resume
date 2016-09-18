var page = require('webpage').create();
var system = require('system');

var args = system.args;
if (args.length === 1) {
	console.log('Give full file path in the first argument');
	phantom.exit();
}

page.paperSize = {
	format: 'A4',
	orientation: 'portrait',
	margin: '1cm'
}

page.open('file://' + args[1], function(status) {
	console.log('Status: ' + status);
	if (status === 'success') {
		page.render('build/resume.pdf');
	}
	phantom.exit();
});
