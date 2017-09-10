build/resume.pdf: resume.xml resume.xsl resume.scss
	yarn
	./node_modules/.bin/gulp
