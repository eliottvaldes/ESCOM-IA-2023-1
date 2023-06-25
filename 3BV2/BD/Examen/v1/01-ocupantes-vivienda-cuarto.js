const fs = require('fs');
const fastcsv = require('fast-csv');
const ObjectsToCsv = require('objects-to-csv');

const { obtenerIDDelegacion } = require('./helper-delegaciones');

const stream = fs.createReadStream('./initialFiles/dataset_inegi-ocupantes-vivienda-y-cuarto.csv');

let ocupacionPorDelegacion = [];
let ocupacionVivienda = [];
let ocupacionCuarto = [];


// verify if the folder 'cleanFiles2022' exists if not create it
if (!fs.existsSync('./cleanFiles2022')) {
    fs.mkdirSync('./cleanFiles2022');
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
        await csvVivienda.toDisk('./cleanFiles2022/t_delegacion_ocupantes_por_vivienda.csv');
        console.log(`Archivo 't_delegacion_ocupantes_por_vivienda.csv' creado con exito`);

        const csvCuarto = new ObjectsToCsv(ocupacionCuarto);
        await csvCuarto.toDisk('./cleanFiles2022/t_delegacion_ocupantes_por_cuarto.csv');
        console.log(`Archivo 't_delegacion_ocupantes_por_cuarto.csv' creado con exito`);

    });



stream.pipe(csvStream);
