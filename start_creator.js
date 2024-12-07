const express = require('express');
const fs = require('fs');
const app = express();
const PORT = 4040;

app.use(express.static('./creator'))

app.listen(PORT, () => {
    console.log("ok");
})