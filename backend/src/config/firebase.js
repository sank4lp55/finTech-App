const { initializeApp } = require("firebase/app")
const { getAuth } = require("firebase/auth")

const firebaseConfig = {
  apiKey: "AIzaSyD8wTdyMXj4Eu9MovRTHhqzupkRF32ppfw",
  authDomain: "fin-tech-1089a.firebaseapp.com",
  projectId: "fin-tech-1089a",
  storageBucket: "fin-tech-1089a.appspot.com",
  messagingSenderId: "1045020000366",
  appId: "1:1045020000366:web:4f10f380140eb1c0f0667f",
  measurementId: "G-Y7WRM7PQBZ"
};

const app = initializeApp(firebaseConfig);
const auth = getAuth(app)

module.exports = auth