build/resume.pdf: resume.xml resume.xsl resume.scss
	yarn
	gulp
	mv build/resume.xml build/resume.html
	phantomjs buildPdf.js `readlink -f build/resume.html`
