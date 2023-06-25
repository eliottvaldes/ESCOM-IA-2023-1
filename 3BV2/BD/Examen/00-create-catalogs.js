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

const stream = fs.createReadStream('./initialFiles/inViales_2022_2023.csv');

// verify if the folder 'cleanFiles2022' exists if not create it
if (!fs.existsSync('./cleanFiles2022')) {
    fs.mkdirSync('./cleanFiles2022');
}

let csvStream = fastcsv.parse()
    .on('data', (data) => {
        /**
        COLUMNA - CAMPO
            0 - folio
            1 - fecha_creacion
            2 - hora_creacion
            3 - dia_semana
            4 - fecha_cierre
            5 - hora_cierre
            6 - tipo_incidente_c4
            7 - incidente_c4
            8 - alcaldia_inicio
            9 - latitud
            10 - longitud
            11 - codigo_cierre
            12 - clas_con_f_alarma
            13 - tipo_entrada
            14 - alcaldia_cierre
            15 - colonia
         */


        // delegacion
        // verificar que no sea NA        
        if (data[8] != 'NA') {
            // verificar que no este en el arreglo
            if (!delegations.includes(data[8])) delegations.push(data[8]);
        }


        if (data[13] != 'NA') {
            // tipo entrada
            if (!entryTypes.includes(data[13])) entryTypes.push(data[13]);
        }

        // clas con f alarma
        if (!classifications.includes(data[12])) classifications.push(data[12]);
        // incidente c4
        if (!incidents.includes(data[7])) incidents.push(data[7]);

        // codigo cierre
        if (!closureCodes.includes(data[11])) closureCodes.push(data[11]);

        if (data[8] != 'NA' && data[13] != 'NA') {
            // define the structure of the table 't_incidentes'
            incidentsTable.push({
                folio: data[0],
                delegacion_inicio: data[8],
                delegacion_cierre: data[14],
                incidente_c4: data[7],
                tipo_entrada: data[13],
                clas_con_f_alarma: data[12],
                codigo_cierre: data[11],
                fecha_creacion: data[1],
                hora_creacion: data[2],
                fecha_cierre: data[4],
                hora_cierre: data[5],
                latitud: data[9],
                longitud: data[10],
                geopoint: `${data[9]},${data[10]}`
            });
        }


    })
    .on('end', async () => {
        delegations.shift();
        classifications.shift();
        incidents.shift();
        entryTypes.shift();
        closureCodes.shift();
        incidentsTable.shift();

        // replace the values of the columns with the id of the catalog
        incidentsTable.forEach((incident) => {
            incident.delegacion_inicio = delegations.indexOf(incident.delegacion_inicio) + 1;
            incident.delegacion_cierre = delegations.indexOf(incident.delegacion_cierre) + 1;
            incident.incidente_c4 = incidents.indexOf(incident.incidente_c4) + 1;
            incident.tipo_entrada = entryTypes.indexOf(incident.tipo_entrada) + 1;
            incident.clas_con_f_alarma = classifications.indexOf(incident.clas_con_f_alarma) + 1;
            incident.codigo_cierre = closureCodes.indexOf(incident.codigo_cierre) + 1;

            // parse the dates to YYYY-MM-DD
            incident.fecha_creacion = moment(incident.fecha_creacion, 'YYYY-MM-DD').format('YYYY-MM-DD');
            incident.fecha_cierre = moment(incident.fecha_cierre, 'YYYY-MM-DD').format('YYYY-MM-DD');

            // show if the fecha is invalid
            if (!moment(incident.fecha_creacion, 'YYYY-MM-DD').isValid()) console.log(`Invalid date: ${incident.fecha_creacion}`);
            if (!moment(incident.fecha_cierre, 'YYYY-MM-DD').isValid()) console.log(`Invalid date: ${incident.fecha_cierre}`);

            // show if the hora is invalid
            if (!moment(incident.hora_creacion, 'HH:mm:ss').isValid()) console.log(`Invalid time: ${incident.hora_creacion}`);
            if (!moment(incident.hora_cierre, 'HH:mm:ss').isValid()) console.log(`Invalid time: ${incident.hora_cierre}`);

        });

        let csv1 = new ObjectsToCsv(delegations.map((del, index) => ({ id_delegacion: index + 1, delegacion: del })));
        await csv1.toDisk('./cleanFiles2022/cat_delegacion.csv');
        console.log(`File cat_delegacion.csv created`);

        let csv2 = new ObjectsToCsv(classifications.map((clas, index) => ({ id_clasificacion: index + 1, clasificacion: clas })));
        await csv2.toDisk('./cleanFiles2022/cat_clas_con_f_alarma.csv');
        console.log(`File cat_clas_con_f_alarma.csv created`);

        let csv3 = new ObjectsToCsv(incidents.map((inc, index) => ({ id_tipo_incidente_c4: index + 1, tipo_incidente: inc })));
        await csv3.toDisk('./cleanFiles2022/cat_tipo_incidente_c4.csv');
        console.log(`File cat_tipo_incidente_c4.csv created`);

        let csv4 = new ObjectsToCsv(entryTypes.map((ent, index) => ({ id_tipo_entrada: index + 1, tipo_entrada: ent })));
        await csv4.toDisk('./cleanFiles2022/cat_tipo_entrada.csv');
        console.log(`File cat_tipo_entrada.csv created`);

        let csv5 = new ObjectsToCsv(closureCodes.map((code, index) => ({ id_codigo_cierre: index + 1, codigo_cierre: code })));
        await csv5.toDisk('./cleanFiles2022/cat_incidente_codigo_cierre.csv');
        console.log(`File cat_incidente_codigo_cierre.csv created`);


        console.log(`Total incidents: ${incidentsTable.length} `);

        let csvIncidentesParte1 = new ObjectsToCsv(incidentsTable.slice(0, 30000));
        await csvIncidentesParte1.toDisk('./cleanFiles2022/t_incidente_parte1.csv');
        console.log(`File t_incidente_parte1.csv created`);

        let csvIncidentesParte2 = new ObjectsToCsv(incidentsTable.slice(30000, 60000));
        await csvIncidentesParte2.toDisk('./cleanFiles2022/t_incidente_parte2.csv');
        console.log(`File t_incidente_parte2.csv created`);

        let csvIncidentesParte3 = new ObjectsToCsv(incidentsTable.slice(60000, 90000));
        await csvIncidentesParte3.toDisk('./cleanFiles2022/t_incidente_parte3.csv');
        console.log(`File t_incidente_parte3.csv created`);

        let csvIncidentesParte4 = new ObjectsToCsv(incidentsTable.slice(90000, 120000));
        await csvIncidentesParte4.toDisk('./cleanFiles2022/t_incidente_parte4.csv');
        console.log(`File t_incidente_parte4.csv created`);

        let csvIncidentesParte5 = new ObjectsToCsv(incidentsTable.slice(120000, 150000));
        await csvIncidentesParte5.toDisk('./cleanFiles2022/t_incidente_parte5.csv');
        console.log(`File t_incidente_parte5.csv created`);

        let csvIncidentesParte6 = new ObjectsToCsv(incidentsTable.slice(150000, 180000));
        await csvIncidentesParte6.toDisk('./cleanFiles2022/t_incidente_parte6.csv');
        console.log(`File t_incidente_parte6.csv created`);

        let csvIncidentesParte7 = new ObjectsToCsv(incidentsTable.slice(180000, 210000));
        await csvIncidentesParte7.toDisk('./cleanFiles2022/t_incidente_parte7.csv');
        console.log(`File t_incidente_parte7.csv created`);

        let csvIncidentesParte8 = new ObjectsToCsv(incidentsTable.slice(210000, 240000));
        await csvIncidentesParte8.toDisk('./cleanFiles2022/t_incidente_parte8.csv');
        console.log(`File t_incidente_parte8.csv created`);

        let csvIncidentesParte9 = new ObjectsToCsv(incidentsTable.slice(240000, 270000));
        await csvIncidentesParte9.toDisk('./cleanFiles2022/t_incidente_parte9.csv');
        console.log(`File t_incidente_parte9.csv created`);

        let csvIncidentesParte10 = new ObjectsToCsv(incidentsTable.slice(270000, 300000));
        await csvIncidentesParte10.toDisk('./cleanFiles2022/t_incidente_parte10.csv');
        console.log(`File t_incidente_parte10.csv created`);

        let csvIncidentesParte11 = new ObjectsToCsv(incidentsTable.slice(300000, 330000));
        await csvIncidentesParte11.toDisk('./cleanFiles2022/t_incidente_parte11.csv');
        console.log(`File t_incidente_parte11.csv created`);


        /*         let csv6 = new ObjectsToCsv(incidentsTable);
                await csv6.toDisk('./cleanFiles2022/t_incidente.csv');
                console.log(`File incidentes_viales.csv created`); */

    });

stream.pipe(csvStream);
