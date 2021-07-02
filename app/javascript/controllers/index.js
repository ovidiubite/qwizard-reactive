// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import StimulusReflex from "stimulus_reflex";
import consumer from "../channels/consumer";
import controller from "../controllers/application_controller";
import Carousel from "stimulus-carousel"

const application = Application.start();
let context = require.context("controllers", true, /_controller(\.js|\.ts)$/);
application.load(definitionsFromContext(context));

context = require.context("../../frontend/components", true, /index(\.js|\.ts)$/)
context.keys().forEach((path) => {
  const mod = context(path);

  // Check whether a module has the Controller export defined
  if (!mod.Controller) return;

  // Convert path into a controller identifier:
  //   example/index.ts -> example
  //   nav/user_info/index.ts -> nav--user-info
  const identifier = path.replace(/^\.\//, '')
    .replace(/\/index(\.js|\.ts)$/, '')
    .replace(/\//, '--');

  application.register(identifier, mod.Controller);
});

StimulusReflex.initialize(application, { consumer, controller, isolate: true });
StimulusReflex.debug = process.env.RAILS_ENV === "development";

application.register("carousel", Carousel)
