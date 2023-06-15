const fs = require('fs');
const fastcsv = require('fast-csv');
const ObjectsToCsv = require('objects-to-csv');
const createCsvWriter = require('fast-csv').write;

let delegations = [];
let classifications = [];
let incidents = [];
let entryTypes = [];
let closureCodes = [];
let incidentsTable = [];

const stream = fs.createReadStream('./initialFiles/dataset_incidentes_viales.csv');

// verify if the folder 'cleanFiles' exists if not create it
if (!fs.existsSync('./cleanFiles')) {
    fs.mkdirSync('./cleanFiles');
}

let csvStream = fastcsv.parse()
    .on('data', (data) => {
        /*
        COLUMNA - CAMPO
        0 - "folio"
        1 - "fecha_creacion"
        2 - "hora_creacion"
        3 - "dia_semana"
        4 - "codigo_cierre"
        5 - "fecha_cierre"
        6 - "año_cierre"
        7 - "mes_cierre"
        8 - "hora_cierre"
        9 - "delegacion_inicio"
        10 - "incidente_c4"
        11 - "latitud"
        12 - "longitud"
        13 - "clas_con_f_alarma"
        14 - "tipo_entrada"
        15 - "delegacion_cierre"
        16 - "geopoint"
        17 - "mes"
        */
        if (!delegations.includes(data[9])) delegations.push(data[9]);
        if (!classifications.includes(data[13])) classifications.push(data[13]);
        if (!incidents.includes(data[10])) incidents.push(data[10]);
        if (!entryTypes.includes(data[14])) entryTypes.push(data[14]);
        if (!closureCodes.includes(data[4])) closureCodes.push(data[4]);

        incidentsTable.push({
            folio: data[0],
            delegacion_inicio: data[9],
            delegacion_cierre: data[15],
            incidente_c4: data[10],
            tipo_entrada: data[14],
            clas_con_f_alarma: data[13],
            codigo_cierre: data[4],
            fecha_creacion: data[1],
            hora_creacion: data[2],
            fecha_cierre: data[5],
            hora_cierre: data[8],
            latitud: data[11],
            longitud: data[12],
            geopoint: data[16]
        });

    })
    .on('end', async () => {
        delegations.shift();
        classifications.shift();
        incidents.shift();
        entryTypes.shift();
        closureCodes.shift();
        incidentsTable.shift();

        let csv1 = new ObjectsToCsv(delegations.map((del, index) => ({ id_delegacion: index + 1, delegacion: del })));
        await csv1.toDisk('./cleanFiles/cat_delegacion.csv');
        console.log(`File cat_delegacion.csv created`);

        let csv2 = new ObjectsToCsv(classifications.map((clas, index) => ({ id_clasificacion: index + 1, clasificacion: clas })));
        await csv2.toDisk('./cleanFiles/cat_clas_con_f_alarma.csv');
        console.log(`File cat_clas_con_f_alarma.csv created`);

        let csv3 = new ObjectsToCsv(incidents.map((inc, index) => ({ id_tipo_incidente_c4: index + 1, tipo_incidente: inc })));
        await csv3.toDisk('./cleanFiles/cat_tipo_incidente_c4.csv');
        console.log(`File cat_tipo_incidente_c4.csv created`);

        let csv4 = new ObjectsToCsv(entryTypes.map((ent, index) => ({ id_tipo_entrada: index + 1, tipo_entrada: ent })));
        await csv4.toDisk('./cleanFiles/cat_tipo_entrada.csv');
        console.log(`File cat_tipo_entrada.csv created`);

        let csv5 = new ObjectsToCsv(closureCodes.map((code, index) => ({ id_codigo_cierre: index + 1, codigo_cierre: code, descripcion: null })));
        await csv5.toDisk('./cleanFiles/cat_incidente_codigo_cierre.csv');
        console.log(`File cat_incidente_codigo_cierre.csv created`);

        // replace the values of the columns with the id of the catalog
        incidentsTable.forEach((incident) => {
            incident.delegacion_inicio = delegations.indexOf(incident.delegacion_inicio) + 1;
            incident.delegacion_cierre = delegations.indexOf(incident.delegacion_cierre) + 1;
            incident.incidente_c4 = incidents.indexOf(incident.incidente_c4) + 1;
            incident.tipo_entrada = entryTypes.indexOf(incident.tipo_entrada) + 1;
            incident.clas_con_f_alarma = classifications.indexOf(incident.clas_con_f_alarma) + 1;
            incident.codigo_cierre = closureCodes.indexOf(incident.codigo_cierre) + 1;
        });

        let csv6 = new ObjectsToCsv(incidentsTable);
        await csv6.toDisk('./cleanFiles/incidentes_viales.csv');
        console.log(`File incidentes_viales.csv created`);

    });

stream.pipe(csvStream);