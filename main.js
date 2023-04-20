import "./src/style.build.css";

import { Elm } from "./src/Main.elm";

if (process.env.NODE_ENV === "development") {
  const ElmDebugTransform = await import("elm-debug-transformer");

  ElmDebugTransform.register({
    simple_mode: true,
  });
}

const root = document.querySelector("#app div");

const flags = JSON.parse(localStorage.getItem("model")) || {};

const evaluate = JSON.parse(localStorage.getItem("evaluate")) || {};
const app = Elm.Main.init({ node: root, evaluate: evaluate, flags: flags });

console.log("initilizing app with flags: ", evaluate);
app.ports.storeModel.subscribe(function (model) {
  console.log("saving model...");
  localStorage.setItem("model", JSON.stringify(model));
});
app.ports.storeModel2.subscribe(function (evaluate) {
  console.log("bringin questions from LS");
  localStorage.setItem("evaluate", JSON.stringify(evaluate));
});
