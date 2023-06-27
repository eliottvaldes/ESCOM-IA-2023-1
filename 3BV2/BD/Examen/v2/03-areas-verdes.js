const fs = require('fs');
const fastcsv = require('fast-csv');
const ObjectsToCsv = require('objects-to-csv');

const { obtenerIDDelegacion } = require('./helpers/obtenerIdDelegaciones');

const stream = fs.createReadStream('./archivos/datasets/areas/cdmx_areas_verdes_2017.csv');


const mainPath = './archivos/exports';
if (!fs.existsSync(`${mainPath}`)) {
    fs.mkdirSync(`${mainPath}`);
}


let categorias = [];
let subcategorias = [];
let areas = [];

let csvStream = fastcsv.parse()
    .on('data', (data) => {

        /* 
        COLUMNA -VALOR
        0 - id
        1 - geo_point_2d
        2 - geo_shape
        3 - muerdago
        4 - p_sp_her_d
        5 - zonifica
        6 - subcat_sed
        7 - subcve_sed
        8 - p_manejo
        9 - tipo
        10 - p_sp_abs_d
        11 - f_decreto
        12 - direccion
        13 - gid
        14 - cve_delg
        15 - p_arbustiv
        16 - ubicacion
        17 - nombre
        18 - delegacion
        19 - p_sp_arb_d
        20 - p_herbaceo
        21 - p_sp_do_mu
        22 - p_arboreo
        23 - categoria
        24 - superficie
        25 - e_urbano
        26 - perimetro	cve_sedema	responsabl        
         */

        if (!categorias.includes(data[23])) categorias.push(data[23]);
        if (data[6] != '') {
            if (!subcategorias.includes(data[6])) subcategorias.push(data[6]);
        }




        areas.push({
            id: data[0],
            subcat_sed: data[6],
            direccion: data[12],
            cve_delg: data[14],
            ubicacion: data[16],
            nombre: data[17],
            delegacion: data[18],
            superficie: data[24],
            perimetro: data[26],
            categoria: data[23],
        });


    })
    .on('end', async () => {
        categorias.shift();
        subcategorias.shift();

        areas.forEach((incident) => {
            incident.subcat_sed = subcategorias.indexOf(incident.subcat_sed) + 1;
            incident.categoria = categorias.indexOf(incident.categoria) + 1;
        });

        let csv1 = new ObjectsToCsv(categorias.map((clas, index) => ({ id_categoria: index + 1, categoria: clas })));
        await csv1.toDisk(`${mainPath}/csv/cat009_categoria_area_verde.csv`);
        console.log(`File cat009_categoria_area_verde.csv created`);

        let csv2 = new ObjectsToCsv(subcategorias.map((clas, index) => ({ id_subcategoria: index + 1, subcategoria: clas })));
        await csv2.toDisk(`${mainPath}/csv/cat010_csubcategoria_area_verde.csv`);
        console.log(`File cat010_csubcategoria_area_verde.csv created`);

        let csv3 = new ObjectsToCsv(areas);
        await csv3.toDisk(`${mainPath}/csv/tbl004_areas.csv`);
        console.log(`File tbl004_areas.csv created`);

    });


stream.pipe(csvStream);
