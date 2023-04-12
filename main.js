import "./src/style.build.css";

import { Elm } from "./src/Main.elm";

if (process.env.NODE_ENV === "development") {
  const ElmDebugTransform = await import("elm-debug-transformer");

  ElmDebugTransform.register({
    simple_mode: true,
  });
}

const root = document.querySelector("#app div");

const flas = JSON.parse(localStorage.getItem("model")) || {};
const app = Elm.Main.init({ node: root, flags: flas });

console.log("initilizing app with flags: ", flas);
app.ports.storeModel2.subscribe(function (model) {
  console.log("saving model...");
  localStorage.setItem("model", JSON.stringify(model));
});
