const context = require.context(".", true, /index(\.js|\.ts)$/);
context.keys().forEach(context);
