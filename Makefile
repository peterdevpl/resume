build/resume.pdf: resume.xml resume.xsl resume.scss
	npm install
	gulp
	mv build/resume.xml build/resume.html
	cp resume.jpg build/
	phantomjs buildPdf.js `readlink -f build/resume.html`
