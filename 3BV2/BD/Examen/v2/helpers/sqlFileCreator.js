const fs = require('fs');

// create a file that will be imported to the database this file will be created in the same folder as this script jsut to import the data
const createSqlFileInsertionImport = async (path, tableName, fileName, content) => {

    // the path of file will be ./cleanFiles2022/sql/tableName.sql
    // delete the file if it exists
    const filePath = `${path}/${fileName}.sql`;
    if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
    }

    // define the content of the file. just use INSERT INTO tableName VALUES (content)
    // remember that the content is an array of objects
    let sqlContent = `INSERT INTO ${tableName} VALUES`;
    sqlContent += content.map((obj) => `(${Object.values(obj).map((val) => `'${val}'`).join(',')})`).join(',');
    sqlContent += ';';

    // create the file and write the content
    await fs.writeFile(filePath, sqlContent, (err) => {
        // throws an error, you could also catch it here
        if (err) {
            console.log(err);
            return;
        } else {
            console.log(`File ${fileName}.sql created`);
        }
    });
}

module.exports = {
    createSqlFileInsertionImport
}