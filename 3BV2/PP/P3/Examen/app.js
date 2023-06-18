const { readFile } = require('./controller/readCSV.controller');


const fileName = '/iris.data';
const fullPath = __dirname + fileName;


readFile(fullPath);