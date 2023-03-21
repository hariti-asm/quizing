import "./style.css";
import { Elm } from "./src/Main.elm";

if (process.env.NODE_ENV === "development") {
  const ElmDebugTransform = await import("elm-debug-transformer");

  ElmDebugTransform.register({
    simple_mode: true,
  });
}

const root = document.querySelector("#app div");
// const flags = Json.parse(localStorage.getItem("questions")) || {};
// console.log("initilizing app with flags: ", flags);
const app = Elm.Main.init({ node: root });
// app.ports.saveModel.subscribe(function (model) {
//   console.log("saving model...");
//   localStorage.setItem("questions", JSON.stringify(model));
// });
