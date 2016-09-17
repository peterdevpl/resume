var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('buildSass', function() {
	var buildDir = './build';

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
