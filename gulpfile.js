var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var xslt = require('gulp-xslt');

var buildDir = './build';

gulp.task('buildSass', function() {
	gulp.src('*.scss')
		.pipe(sourcemaps.init())
		.pipe(sass({
			outputStyle: 'compressed'
		}).on('error', sass.logError))
		.pipe(sourcemaps.write('../maps'))
		.pipe(gulp.dest(buildDir));
});

gulp.task('transformXml', function() {
	gulp.src('*.xml')
		.pipe(xslt('resume.xsl'))
		.pipe(gulp.dest(buildDir));
});

gulp.task('default', ['buildSass', 'transformXml']);

gulp.task('watch', function() {
	gulp.watch('*.scss', ['buildSass']);
});
