// read the fileName and parse into an array of objects
const csv = require('csv-parser');
const fs = require('fs');



const startProcess = async (file) => {
    const irisData = await readFile(file);
    // call the function to separate the objects into 3 arrays, one for each class
    const [dataSetosa, dataVersicolor, dataVirginica, dataUnknown] = await separateIrisDataInClasses([...irisData]);

    // call the function to separate the objects in training and test data of each class
    const [trainingSetosa, testSetosa] = await separateTrainingAndTestData(dataSetosa);
    const [trainingVersicolor, testVersicolor] = await separateTrainingAndTestData(dataVersicolor);
    const [trainingVirginica, testVirginica] = await separateTrainingAndTestData(dataVirginica);

    // call the function to calculate the mean of each property of each class
    const meanVersicolor = await calculateMean(trainingVersicolor);
    const meanSetosa = await calculateMean(trainingSetosa);
    const meanVirginica = await calculateMean(trainingVirginica);


    let correct = 0;

    testSetosa.forEach(irisObject => {
        // calculate the euclidean distance of the test object to the mean of each class
        const distanceToSetosa = calculateEuclideanDistance(irisObject, meanSetosa);
        const distanceToVersicolor = calculateEuclideanDistance(irisObject, meanVersicolor);
        const distanceToVirginica = calculateEuclideanDistance(irisObject, meanVirginica);

        // get the class with the minimum distance of all
        const minDistance = Math.min(distanceToSetosa, distanceToVersicolor, distanceToVirginica);

        // check if the class is the same as the test object
        if (minDistance === distanceToSetosa) {
            correct++;
        }
    });

    testVersicolor.forEach(irisObject => {
        // calculate the euclidean distance of the test object to the mean of each class
        const distanceToSetosa = calculateEuclideanDistance(irisObject, meanSetosa);
        const distanceToVersicolor = calculateEuclideanDistance(irisObject, meanVersicolor);
        const distanceToVirginica = calculateEuclideanDistance(irisObject, meanVirginica);

        // get the class with the minimum distance of all
        const minDistance = Math.min(distanceToSetosa, distanceToVersicolor, distanceToVirginica);

        // check if the class is the same as the test object
        if (minDistance === distanceToVersicolor) {
            correct++;
        }
    });

    testVirginica.forEach(irisObject => {
        // calculate the euclidean distance of the test object to the mean of each class
        const distanceToSetosa = calculateEuclideanDistance(irisObject, meanSetosa);
        const distanceToVersicolor = calculateEuclideanDistance(irisObject, meanVersicolor);
        const distanceToVirginica = calculateEuclideanDistance(irisObject, meanVirginica);

        // get the class with the minimum distance of all
        const minDistance = Math.min(distanceToSetosa, distanceToVersicolor, distanceToVirginica);

        // check if the class is the same as the test object
        if (minDistance === distanceToVirginica) {
            correct++;
        }
    });

    console.log({ correct });

    const totalTestRows = testSetosa.length + testVersicolor.length + testVirginica.length;
    console.log({ totalTestRows });
    const accuracy = correct / totalTestRows;
    console.log({ accuracy });

}




// function to read the content of the file and parse it into an array of objects
const readFile = async (fullPath) => {
    const results = [];
    return new Promise((resolve, reject) => {
        fs.createReadStream(fullPath)
            .pipe(csv())
            .on('data', (data) => {
                // define the object structure
                const iris = {
                    class: data.class,
                    sepalLength: data.sepal_length,
                    sepalWidth: data.sepal_width,
                    petalLength: data.petal_length,
                    petalWidth: data.petal_width,
                }
                // push the object into the array
                results.push(iris);

            })
            .on('end', () => {
                // return the Promise with the array of objects
                resolve(results);
            });
    })

}

// function to separate the objects into 3 arrays, one for each class
const separateIrisDataInClasses = async (irisData) => {
    // define the array of objects of each class
    const setosa = [];
    const versicolor = [];
    const virginica = [];
    const unknown = [];

    // filter the objects into the corresponding array
    irisData.forEach(iris => {
        switch (iris.class) {
            case 'Iris-setosa':
                // add to the array of objects
                setosa.push(iris);
                break;
            case 'Iris-versicolor':
                versicolor.push(iris);
                break;
            case 'Iris-virginica':
                virginica.push(iris);
                break;
            default:
                unknown.push(iris);
                break;
        }
    });

    return [setosa, versicolor, virginica, unknown];
}


// function to separate the objects in training and test data of each class
// the separation id 66% training and 33% test
// the separation is done randomly
const separateTrainingAndTestData = async (irisData) => {
    // define the array of objects of each class
    const trainingData = [];
    const testData = [];

    // calculate the number of objects for each array
    const trainingDataLength = Math.round(irisData.length * 0.66);
    const testDataLength = irisData.length - trainingDataLength;

    // create an array with the indexes of the objects
    const indexes = [];
    for (let i = 0; i < irisData.length; i++) {
        indexes.push(i);
    }

    // create an array with the indexes of the objects for the training data
    const trainingDataIndexes = [];
    for (let i = 0; i < trainingDataLength; i++) {
        // get a random index
        const randomIndex = Math.floor(Math.random() * indexes.length);
        // remove the index from the array
        const index = indexes.splice(randomIndex, 1);
        // add the index to the array of indexes for the training data
        trainingDataIndexes.push(index[0]);
    }

    // create an array with the indexes of the objects for the test data
    const testDataIndexes = [];
    for (let i = 0; i < testDataLength; i++) {
        // get a random index
        const randomIndex = Math.floor(Math.random() * indexes.length);
        // remove the index from the array
        const index = indexes.splice(randomIndex, 1);
        // add the index to the array of indexes for the test data
        testDataIndexes.push(index[0]);
    }

    // add the objects to the corresponding array
    irisData.forEach((iris, index) => {
        if (trainingDataIndexes.includes(index)) {
            trainingData.push(iris);
        } else {
            testData.push(iris);
        }
    }
    );

    return [trainingData, testData];

}


// function to calculate the mean of each property of each class
const calculateMean = async (irisData) => {
    // define the object to store the mean of each property
    const mean = {
        sepalLength: 0,
        sepalWidth: 0,
        petalLength: 0,
        petalWidth: 0,
    }

    // calculate the mean of each property
    irisData.forEach(iris => {
        mean.sepalLength += parseFloat(iris.sepalLength);
        mean.sepalWidth += parseFloat(iris.sepalWidth);
        mean.petalLength += parseFloat(iris.petalLength);
        mean.petalWidth += parseFloat(iris.petalWidth);
    });

    // divide the sum of each property by the number of objects
    mean.sepalLength = mean.sepalLength / irisData.length;
    mean.sepalWidth = mean.sepalWidth / irisData.length;
    mean.petalLength = mean.petalLength / irisData.length;
    mean.petalWidth = mean.petalWidth / irisData.length;

    return mean;
}

// function to calculate the euclidean distance of the test object to the mean of each class
const calculateEuclideanDistance = (testObject, mean) => {
    // calculate the euclidean distance of the test object to the mean of each class
    const distance = Math.sqrt(
        Math.pow((parseFloat(testObject.sepalLength) - mean.sepalLength), 2) +
        Math.pow((parseFloat(testObject.sepalWidth) - mean.sepalWidth), 2) +
        Math.pow((parseFloat(testObject.petalLength) - mean.petalLength), 2) +
        Math.pow((parseFloat(testObject.petalWidth) - mean.petalWidth), 2)
    );

    return distance;

}


//const fileName = '/../iris-test.data';
const fileName = '/../iris.data';
const fullPath = __dirname + fileName;

startProcess(fullPath);