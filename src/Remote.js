export default class Remote {
  static remoteTemplate = document.getElementById("remote-template");
  static remoteCount = 0;

  id;
  node;
  conn;

  staticIP;
  gatewayIP;
  subnetIP;
  port;

  controlCodes = new Map();

  constructor(ip) {
    // Give unique ID.
    this.id = Remote.remoteCount;
    Remote.remoteCount++;

    // Add Node to DOM.
    this.node = Remote.remoteTemplate.content.cloneNode(true);
    this.node.querySelector("h3").textContent = "Remote " + this.id;
    this.node.querySelector("p").textContent = "IP: " + ip;

    const editIPButton = this.node.querySelector("#edit-ip-button");
    editIPButton.id = "remote" + this.id + "-edit-ip-button";
    editIPButton.addEventListener("click", (e) => {
      e.preventDefault();
      console.log("Edited IP address!");
    });

    const buttons = this.node.getElementById("remote-control").querySelectorAll("button");
    for (const button of buttons) {
      button.addEventListener("click", () => {
        console.log("Controlling TV", button.textContent);
      })
    }

    // Create websocket.
    // this.conn = new WebSocket(ip);
  }

  openConnection() {

  }

  closeConnection() {

  }

  fire() {

  }

  scan() {

  }

  addButton(name, code) {

  }

  editButtonName(name, newName) {

  }

  editButtonCode(name, newCode) {

  }

  removeButton(name) {

  }
};