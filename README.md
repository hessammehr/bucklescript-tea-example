# Bucklescript-TEA example
Simple demonstration of using the Elm Architecture (TEA) in Bucklescript, taken straight from `OvermindDL1/bucklescript-tea`, and compiling down to a small (18kB) js file using the Google Closure compiler.

## Building
```sh
npm install

# To build
npm build
# To build and optimize using  losure compiler
npm minify # or npm minify:watch to watch for changes in src
```