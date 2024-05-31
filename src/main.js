import Remote from "./Remote.js";

const addRemote = document.getElementById("add-remote");
const remoteList = document.getElementById("remote-list");

addRemote.addEventListener("click", () => {
  const r = new Remote("127.0.0.1");
  remoteList.appendChild(r.node);
});

console.log(location.host)