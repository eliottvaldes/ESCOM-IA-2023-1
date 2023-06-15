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
            ocupacionVivienda.push({
                'Nombre Municipio': data[3],
                'Promedio Vivienda': data[6]
            });
            ocupacionCuarto.push({
                'Nombre Municipio': data[3],
                'Promedio Cuarto': data[7]
            });

            ocupacionPorDelegacion.push({
                'delegacion': data[3],
                'por_vivienda': data[6],
                'por_cuarto': data[7]
            });

        }


    })
    .on('end', async () => {


        let csv1 = new ObjectsToCsv(ocupacionPorDelegacion.map(({ delegacion, por_vivienda, por_cuarto }, index) => ({
            id_delegacion: index + 1,
            delegacion: delegacion.replaceAll(' ', '_'),
            ocupacion_por_vivienda: por_vivienda,
            ocupacion_por_cuarto: por_cuarto
        }
        )));

        await csv1.toDisk('./cleanFiles/t_delegacion_ocupantes_por_vivienda_y_cuarto.csv');
        console.log(`File t_delegacion_ocupantes_por_vivienda_y_cuarto.csv created`); 

    });

stream.pipe(csvStream);
