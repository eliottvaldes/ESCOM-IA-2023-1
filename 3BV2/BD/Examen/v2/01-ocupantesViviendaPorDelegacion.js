const fs = require('fs');
const fastcsv = require('fast-csv');
const ObjectsToCsv = require('objects-to-csv');

const { obtenerIDDelegacion } = require('./helpers/obtenerIdDelegaciones');

const stream = fs.createReadStream('./archivos/datasets/inegi/ocupantes-vivienda-y-cuarto-por-delegacion.csv');

let ocupacionPorDelegacion = [];
let ocupacionVivienda = [];
let ocupacionCuarto = [];


const mainPath = './archivos/exports/csv/';
if (!fs.existsSync(`${mainPath}`)) {
    fs.mkdirSync(`${mainPath}`);
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
        await csvVivienda.toDisk(`${mainPath}tbl003_ocupantes_por_vivienda.csv`);
        console.log(`Archivo 'tbl003_ocupantes_por_vivienda.csv' creado con exito`);
        

        const csvCuarto = new ObjectsToCsv(ocupacionCuarto);
        await csvCuarto.toDisk(`${mainPath}tbl004_ocupantes_por_cuarto.csv`);
        console.log(`Archivo 'tbl004_ocupantes_por_cuarto.csv' creado con exito`);
        

    });



stream.pipe(csvStream);
