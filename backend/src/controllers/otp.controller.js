
const accountSid = "ACdfddef41a99eb8b715d249f55d09006c";
const authToken = process.env.AUTH_TOKEN;
const client = require("twilio")(accountSid, authToken);
client.messages
    .create({ body: "Hello from Twilio", from: "+15674093701", to: "+919636696170" })
    .then(message => console.log(message.sid));0
