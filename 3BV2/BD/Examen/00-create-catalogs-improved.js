const fs = require('fs');
const fastcsv = require('fast-csv');
const ObjectsToCsv = require('objects-to-csv');
const moment = require('moment');

let delegations = [];
let classifications = [];
let incidents = [];
let entryTypes = [];
let closureCodes = [];
let incidentsTable = [];

const stream = fs.createReadStream('./initialFiles/dataset_incidentes_viales.csv');

// verify if the folder 'cleanFilesImproved' exists if not create it
if (!fs.existsSync('./cleanFilesImproved')) {
    fs.mkdirSync('./cleanFilesImproved');
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

        // sort the arrays alphabetically
        delegations.sort();
        classifications.sort();
        incidents.sort();
        entryTypes.sort();


        let csv1 = new ObjectsToCsv(delegations.map((del, index) => ({ id_delegacion: index + 1, delegacion: del })));
        await csv1.toDisk('./cleanFilesImproved/cat_delegacion.csv');
        console.log(`File cat_delegacion.csv created`);

        let csv2 = new ObjectsToCsv(classifications.map((clas, index) => ({ id_clasificacion: index + 1, clasificacion: clas })));
        await csv2.toDisk('./cleanFilesImproved/cat_clas_con_f_alarma.csv');
        console.log(`File cat_clas_con_f_alarma.csv created`);

        let csv3 = new ObjectsToCsv(incidents.map((inc, index) => ({ id_tipo_incidente_c4: index + 1, tipo_incidente: inc })));
        await csv3.toDisk('./cleanFilesImproved/cat_tipo_incidente_c4.csv');
        console.log(`File cat_tipo_incidente_c4.csv created`);

        let csv4 = new ObjectsToCsv(entryTypes.map((ent, index) => ({ id_tipo_entrada: index + 1, tipo_entrada: ent })));
        await csv4.toDisk('./cleanFilesImproved/cat_tipo_entrada.csv');
        console.log(`File cat_tipo_entrada.csv created`);

        let csv5 = new ObjectsToCsv(closureCodes.map((code, index) => ({ id_codigo_cierre: index + 1, codigo_cierre: code, descripcion: null })));
        await csv5.toDisk('./cleanFilesImproved/cat_incidente_codigo_cierre.csv');
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

        // remove all rows with the column 'delagacion_inicio' with value 17 or delegacion_cierre with value 17
        incidentsTable = incidentsTable.filter((incident) => {
            return incident.delegacion_inicio !== 17 && incident.delegacion_cierre !== 17;
        });

        // clean all the rows that contains ' 00:00:00.0000000' in the column 'fecha_cierre'. 
        incidentsTable = incidentsTable.filter((incident) => {
            if (incident.fecha_cierre.includes(' 00:00:00.0000000')) {
                incident.fecha_cierre = incident.fecha_cierre.replace(' 00:00:00.0000000', '');
                return true;
            }
            return false;
        });

        // parse the values of each 'fecha_cierre' and 'fecha_inicio' to the format 'YYYY-MM-DD'
        incidentsTable.forEach((incident) => {
            incident.fecha_creacion = moment(incident.fecha_creacion, 'DD/MM/YYYY').format('YYYY-MM-DD');
            incident.fecha_cierre = moment(incident.fecha_cierre, 'YYYY-MM-DD').format('YYYY-MM-DD');
        });

        // create 'timestap_creacion' and 'timeatamp_cierre' columns with the format 'YYYY-MM-DD HH:mm:ss'
        incidentsTable.forEach((incident) => {
            incident.timestamp_creacion = `${incident.fecha_creacion} ${incident.hora_creacion}`;
            incident.timestamp_cierre = `${incident.fecha_cierre} ${incident.hora_cierre}`;
        });

        // remove the columns 'fecha_creacion', 'hora_creacion', 'fecha_cierre', 'hora_cierre'
        incidentsTable.forEach((incident) => {
            delete incident.fecha_creacion;
            delete incident.hora_creacion;
            delete incident.fecha_cierre;
            delete incident.hora_cierre;
        });

        // move the 'geopoint' column to the end of the table
        incidentsTable.forEach((incident) => {
            let geopoint = incident.geopoint;
            delete incident.geopoint;
            incident.geopoint = geopoint;
        });


        let csv6 = new ObjectsToCsv(incidentsTable);
        await csv6.toDisk('./cleanFilesImproved/t_incidente.csv');
        console.log(`File incidentes_viales.csv created`);

    });

stream.pipe(csvStream);
