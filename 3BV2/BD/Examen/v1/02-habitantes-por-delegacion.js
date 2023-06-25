const fs = require('fs');
const fastcsv = require('fast-csv');
const ObjectsToCsv = require('objects-to-csv');
const { obtenerIDDelegacion } = require('./helper-delegaciones');

const stream = fs.createReadStream('./initialFiles/dataset_inegi-poblacion.csv');

let habitantesPorDelegacion = [];
let habitantes = [];


// verify if the folder 'cleanFiles2022' exists if not create it
if (!fs.existsSync('./cleanFiles2022')) {
    fs.mkdirSync('./cleanFiles2022');
}

let csvStream = fastcsv.parse()
    .on('data', (data) => {

        /* 
        COLUMNA - VALOR
        0 - "ENTIDAD"
        1 - "NOM_ENT"
        2 - "MUN"
        3 - "NOM_MUN"
        4 - "LOC"
        5 - "NOM_LOC"
        6 - "P_15A19_F"
        7 - "P_15A19_M"
        8 - "P_20A24_F"
        9 - "P_20A24_M"
        10 - "P_25A29_F"
        11 - "P_25A29_M"

        */

        if (data[5] == 'Total del Municipio') {
            habitantesPorDelegacion.push({
                'delegacion': data[3].trim().replaceAll(' ', '_').toUpperCase(),
                '15A19_F': data[6],
                '15A19_M': data[7],
                '20A24_F': data[8],
                '20A24_M': data[9],
                '25A29_F': data[10],
                '25A29_M': data[11]
            })
        }


    })
    .on('end', async () => {


        habitantesPorDelegacion.forEach(element => {

            let id_delegacion = obtenerIDDelegacion(element.delegacion);

            habitantes.push({
                id_delegacion,
                id_sexo: 1,
                id_rango_edad: 1,
                poblacion: element['15A19_F']
            });
            habitantes.push({
                id_delegacion,
                id_sexo: 2,
                id_rango_edad: 1,
                poblacion: element['15A19_M']
            });

            habitantes.push({
                id_delegacion,
                id_sexo: 1,
                id_rango_edad: 2,
                poblacion: element['20A24_F']
            });
            habitantes.push({
                id_delegacion,
                id_sexo: 2,
                id_rango_edad: 2,
                poblacion: element['20A24_M']
            });            


        });

        let csv6 = new ObjectsToCsv(habitantes);
        await csv6.toDisk('./cleanFiles2022/t_delegacion_poblacion.csv');
        console.log(`File t_delegacion_poblacion.csv created`);

    });


const obtenerIDRandoEdad = (rango) => {
    let id = 0;

    switch (rango) {
        case '15A19':
            id = 1;
            break;
        case '20A24':
            id = 2;
            break;
        case '25A29':
            id = 3;
            break;
    }

    return id;

}


const obtenerIDSexo = (sexo) => {
    let id = 0;

    switch (sexo) {
        case 'F':
            id = 1;
            break;

        case 'M':
            id = 2;
            break;
    }

    return id;

}

stream.pipe(csvStream);
