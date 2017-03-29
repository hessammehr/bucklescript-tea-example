import node_resolve from 'rollup-plugin-node-resolve';

export default {
	dest: 'out/main.js',
	moduleName: 'Teaone',
	entry: 'lib/es6/src/main.js',
	plugins: [ node_resolve() ],
	format: 'iife'
};
