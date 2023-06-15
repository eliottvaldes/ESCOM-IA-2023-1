const fs = require('fs');
const fastcsv = require('fast-csv');
const ObjectsToCsv = require('objects-to-csv');

const stream = fs.createReadStream('./initialFiles/dataset_inegi-ocupantes-vivienda-y-cuarto.csv');

let ocupacionPorDelegacion = [];
let ocupacionVivienda = [];
let ocupacionCuarto = [];


// verify if the folder 'cleanFiles' exists if not create it
if (!fs.existsSync('./cleanFiles')) {
    fs.mkdirSync('./cleanFiles');
}

let csvStream = fastcsv.parse()
    .on('data', (data) => {

        if (data[5] == 'Total del Municipio') {
            ocupacionPorDelegacion.push({
                'delegacion': data[3],
                'por_vivienda': data[6],
                'por_cuarto': data[7]
            });
        }

    })
    .on('end', async () => {

        ocupacionPorDelegacion.forEach(({ delegacion, por_vivienda }) => {
            ocupacionVivienda.push({
                id_delegacion: obtenerIDDelegacion((delegacion.replaceAll(' ', '_').trim().toUpperCase())),
                ocupacion_por_vivienda: por_vivienda
            });
        });

        ocupacionPorDelegacion.forEach(({ delegacion, por_cuarto }) => {
            ocupacionCuarto.push({
                id_delegacion: obtenerIDDelegacion((delegacion.replaceAll(' ', '_').trim().toUpperCase())),
                ocupacion_por_cuarto: por_cuarto,
            });
        });

        // creacion de lso archivos csv

        const csvVivienda = new ObjectsToCsv(ocupacionVivienda);
        await csvVivienda.toDisk('./cleanFiles/t_delegacion_ocupantes_por_vivienda.csv');
        console.log(`Archivo 't_delegacion_ocupantes_por_vivienda.csv' creado con exito`);

        const csvCuarto = new ObjectsToCsv(ocupacionCuarto);
        await csvCuarto.toDisk('./cleanFiles/t_delegacion_ocupantes_por_cuarto.csv');
        console.log(`Archivo 't_delegacion_ocupantes_por_cuarto.csv' creado con exito`);

    });


const obtenerIDDelegacion = (NombreDelegacion) => {

    let id = 0;

    switch (NombreDelegacion) {
        case 'GUSTAVO_A._MADERO':
            id = 1;
            break;

        case 'ÁLVARO_OBREGÓN':
            id = 2;
            break;

        case 'XOCHIMILCO':
            id = 3;
            break;

        case 'TLALPAN':
            id = 4;
            break;

        case 'IZTAPALAPA':
            id = 5;
            break;

        case 'AZCAPOTZALCO':
            id = 6;
            break;

        case 'CUAUHTÉMOC':
            id = 7;
            break;

        case 'MIGUEL_HIDALGO':
            id = 8;
            break;

        case 'VENUSTIANO_CARRANZA':
            id = 9;
            break;

        case 'BENITO_JUÁREZ':
            id = 10;
            break;

        case 'COYOACÁN':
            id = 11;
            break;

        case 'IZTACALCO':
            id = 12;
            break;

        case 'LA_MAGDALENA_CONTRERAS':
            id = 13;
            break;

        case 'TLÁHUAC':
            id = 14;
            break;

        case 'MILPA_ALTA':
            id = 15;
            break;

        case 'CUAJIMALPA_DE_MORELOS':
            id = 16;
            break;



    }

    return id;

}


stream.pipe(csvStream);
