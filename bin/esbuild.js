const esbuild = require('esbuild');
const path = require('path');

// Determine if we should watch for changes
const isWatching = process.env.WATCH === 'true';

const buildOptions = {
    entryPoints: [path.resolve(__dirname, '../app/javascript/application.js')],
    bundle: true,
    outdir: path.resolve(__dirname, '../app/assets/builds'),
    sourcemap: process.env.NODE_ENV === 'development',
    minify: process.env.NODE_ENV === 'production',
    loader: {
        '.js': 'jsx',
        '.png': 'file',
        '.jpg': 'file',
        '.svg': 'file',
    },
};

// Configure watching if needed
if (isWatching) {
    buildOptions.watch = {
        onRebuild(error, result) {
            if (error) console.error('watch build failed:', error);
            else console.log('watch build succeeded:', result);
        },
    };
}

// Build and optionally watch files
esbuild.build(buildOptions).catch(() => process.exit(1));
