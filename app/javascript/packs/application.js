// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
const importAll = (r) => r.keys().map(r);
importAll(require.context("../../frontend/components", true, /[_\/]component\.js$/));
import "../../frontend/components/index";

importAll(require.context('../src/images', true));
importAll(require.context('../src/fonts', true));
importAll(require.context('../src/svg', true));

import '../src/stylesheets/application'

import "controllers";
