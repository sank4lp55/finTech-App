const e = {
    0: "ADMIN",
    1: "USER"
}

const getFromKey = (key) => {
    return e[key];
}
const getFromValue = (value) => {
    for (let [obKey, obValue] of Object.entries(e)) {
        if(obValue == value) return obKey;
    }
    return null;
}

module.exports = {
    ...e,
    getFromKey, 
    getFromValue
}