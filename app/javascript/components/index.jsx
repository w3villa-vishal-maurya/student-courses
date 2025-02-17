import React from "react";
import ReactDOM from "react-dom";
import { RouterProvider } from "react-router-dom";
import router from "./Routes";

const App = () => {
    console.log("hello vishal");
  return <h1>Hello from React in Rails!</h1>;
};

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<RouterProvider router={router} />, document.getElementById("root"));
});
