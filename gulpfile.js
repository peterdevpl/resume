var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');

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

gulp.task('default', ['buildSass']);

gulp.task('watch', function() {
	gulp.watch('*.scss', ['buildSass']);
});
