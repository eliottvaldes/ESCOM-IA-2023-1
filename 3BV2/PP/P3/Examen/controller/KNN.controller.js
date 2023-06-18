// read the fileName and parse into an array of objects
const { ChildProcess } = require('child_process');
const csv = require('csv-parser');
const fs = require('fs');



const startProcess = async (file) => {
    const irisData = await readFile(file);

    // call the function that gives the uniques classes of the all data
    const uniqueClasses = getUniqueClasses(irisData);

    // call the function to separate the irisData in arrays: training and test data
    const { trainingData, testData } = separateData(irisData, uniqueClasses);

    // define the number of neighbors
    const kNeighbors = 1;

    // call the function to calculate distances        
    const testResults = calculateDistances(trainingData, testData, kNeighbors);

    // call the function to calculate the accuracy
    const accuracy = calculateAccuracy(testResults);
    console.log('Accuracy: ', accuracy);

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


// function to get the unique classes of the all data
const getUniqueClasses = (irisData) => [...new Set(irisData.map(item => item.class))];


// function to separate the irisData in arrays: training and test data
// the training data is 67% of the irisData and the test data is 33% of the irisData
// the training data must be separated by class in the same proportion
// the separation is done randomly
const separateData = (irisData, uniqueClasses) => {
    // define the arrays to store the training and test data
    const trainingData = [];
    const testData = [];

    // loop through the unique classes
    uniqueClasses.forEach((uniqueClass) => {
        // filter the irisData by class
        const irisDataByClass = irisData.filter(item => item.class === uniqueClass);
        // calculate the 67% of the irisDataByClass
        const trainingDataByClassLength = Math.round(irisDataByClass.length * 0.67);

        // loop through the irisDataByClass
        irisDataByClass.forEach((item, index) => {
            // if the index is less than the trainingDataByClassLength
            if (index < trainingDataByClassLength) {
                // push the item into the trainingData array
                trainingData.push(item);
            } else {
                // push the item into the testData array
                testData.push(item);
            }
        })
    })

    // return the training and test data
    return { trainingData, testData };
}


// funcion to calculate distances of each test object to the each training object
const calculateDistances = (trainingData, testData, kNeighbors) => {

    const dataDistances = [];

    // calculate the euclidean distance of the test object to each training object
    testData.forEach(irisTest => {

        // define the array to store the distances
        const distances = [];

        // loop through the trainingData
        trainingData.forEach(irisTraining => {
            // call the function to calculate the euclidean distance and save it in a variable
            const distance = calculateEuclideanDistance(irisTest, irisTraining);

            // push the distance into the distances array
            distances.push({
                class: irisTraining.class,
                distance: distance
            });
        })

        // sort the distances by distance
        const sortedDistances = distances.sort((a, b) => a.distance - b.distance);

        // push the save object into the dataDistances array
        // return the kNeighbors first elements of the sortedDistances array
        dataDistances.push({
            class: irisTest.class,
            neighbors: sortedDistances.slice(0, kNeighbors)
        });


    });

    // return the dataDistances array
    return dataDistances;
}


// function to calculate the euclidean distance of the test object to the trainingObj of each class
const calculateEuclideanDistance = (testObject, trainingObj) => {
    // calculate the euclidean distance of the test object to the trainingObj of each class
    const distance = Math.sqrt(
        Math.pow((parseFloat(testObject.sepalLength) - trainingObj.sepalLength), 2) +
        Math.pow((parseFloat(testObject.sepalWidth) - trainingObj.sepalWidth), 2) +
        Math.pow((parseFloat(testObject.petalLength) - trainingObj.petalLength), 2) +
        Math.pow((parseFloat(testObject.petalWidth) - trainingObj.petalWidth), 2)
    );

    return distance;

}


// function to calculate the accuracy
const calculateAccuracy = (testResults) => {
    // define the variable to store the correct predictions
    let correctPredictions = 0;

    // loop through the testResults
    testResults.forEach(result => {
        const { class: classExpected, neighbors } = result;
        // verify if the classExpected is equal to the class of the first neighbor
        if (classExpected === neighbors[0].class) {
            // increment the correctPredictions
            correctPredictions++;
        }
    });

    // calculate the accuracy
    const accuracy = (correctPredictions / testResults.length);

    // return the accuracy
    return accuracy;
}



/* 
TEST FUNCTIONS
*/

let fileName = '';
fileName = '/../iris-test.data';
fileName = '/../iris.data';
const fullPath = __dirname + fileName;

startProcess(fullPath);
