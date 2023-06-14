const fs = require('fs');
const fastcsv = require('fast-csv');
const ObjectsToCsv = require('objects-to-csv');

let delegations = [];
let classifications = [];
let incidents = [];
let entryTypes = [];
let closureCodes = [];

const stream = fs.createReadStream('./initialFiles/dataset_incidentes_viales.csv');

// verify if the folder 'cleanFiles' exists if not create it
if (!fs.existsSync('./cleanFiles')) {
    fs.mkdirSync('./cleanFiles');
}

let csvStream = fastcsv.parse()
    .on('data', (data) => {
        if (!delegations.includes(data[9])) delegations.push(data[9]);
        if (!classifications.includes(data[13])) classifications.push(data[13]);
        if (!incidents.includes(data[10])) incidents.push(data[10]);
        if (!entryTypes.includes(data[14])) entryTypes.push(data[14]);
        if (!closureCodes.includes(data[4])) closureCodes.push(data[4]);
    })
    .on('end', async () => {        
        delegations.shift();
        classifications.shift();
        incidents.shift();
        entryTypes.shift();
        closureCodes.shift();
        
        let csv1 = new ObjectsToCsv(delegations.map((del, index) => ({ id_delegacion: index + 1, delegacion: del })));
        await csv1.toDisk('./cleanFiles/cat_delegacion.csv');

        let csv2 = new ObjectsToCsv(classifications.map((clas, index) => ({ id_clasificacion: index + 1, clasificacion: clas })));
        await csv2.toDisk('./cleanFiles/cat_clas_con_f_alarma.csv');

        let csv3 = new ObjectsToCsv(incidents.map((inc, index) => ({ id_tipo_incidente_c4: index + 1, tipo_incidente: inc })));
        await csv3.toDisk('./cleanFiles/cat_tipo_incidente_c4.csv');

        let csv4 = new ObjectsToCsv(entryTypes.map((ent, index) => ({ id_tipo_entrada: index + 1, tipo_entrada: ent })));
        await csv4.toDisk('./cleanFiles/cat_tipo_entrada.csv');

        let csv5 = new ObjectsToCsv(closureCodes.map((code, index) => ({ id_codigo_cierre: index + 1, codigo_cierre: code, descripcion: null })));
        await csv5.toDisk('./cleanFiles/cat_incidente_codigo_cierre.csv');
    });

stream.pipe(csvStream);
