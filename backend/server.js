require('dotenv').config();
const express = require('express');
const cors = require("cors");
const morgan = require('morgan')
const helmet = require('helmet');

const { initializeApp, cert } = require('firebase-admin/app');
const firebaseSA = require('./src/config/sa/SA.json')
// const firebaseSAProd = require('./src/config/sa/prodSA.json')

global.__basedir = __dirname;

const port = process.env.PORT || 3000;

const app = express();

app.use(helmet());
app.use(morgan('combined'))

const serviceAccount = firebaseSA;

initializeApp({
    credential: cert(serviceAccount)
});

app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

const sequelize = require("sequelize")

const db = require("./src/models")
app.use(express.json());

// For Creating New Table if not there
// db.sequelize.sync();

// * disabling x-powered-by shown in response of browser
app.disable('x-powered-by');

app.use(cors());

const allRoutes = require('./src/routes/index');
app.use("/api/", allRoutes);

app.get("/", (req, res) => {
    res.json({ message: "welcome" });
});


app.use((req, res, next) => {
    res.status(404).json({ message: "Does not exists" });
});

db.sequelize.sync().then((req) => {
    console.log(`Database Connected on ${process.env.NODE_ENV} environment`);
    app.listen(port, () => {
        console.log(`server running at port ${port}`)
    })
})
