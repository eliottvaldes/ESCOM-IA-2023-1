// read the fileName and parse into an array of objects
const csv = require('csv-parser');
const fs = require('fs');



const startProcess = async (file) => {
    const irisData = await readFile(file);

    // call the function that gives the uniques classes of the all data
    const uniqueClasses = getUniqueClasses(irisData);

    // call the function to separate the irisData in arrays: training and test data
    const { trainingData, testData } = separateData(irisData, uniqueClasses);

    // define the total of testing data
    const totalTesting = testData.length;

    // calculate the mean of the training data by class
    const meanByClass = calculateMeanByClass(uniqueClasses, trainingData);

    const testModel = holdOutMatch(testData, meanByClass);

    // call the function to calculate the accuracy
    const correctPredictions = calculateCorrectPredictions(testModel);

    // call the function to calculate the accuracy
    const accuracy = calculateAccuracy(correctPredictions, totalTesting);


    // show the results
    console.log({ totalTesting, correctPredictions, accuracy });

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


// function to calculate the mean of the training data by class
const calculateMeanByClass = (uniqueClasses, trainingData) => {
    // define the array to store the mean by class
    const meanByClass = [];

    // loop through the unique classes
    uniqueClasses.forEach((uniqueClass) => {
        // filter the trainingData by class
        const trainingDataByClass = trainingData.filter(item => item.class === uniqueClass);

        // define the object to store the mean by class
        const meanByClassObj = {
            class: uniqueClass,
            sepalLength: 0,
            sepalWidth: 0,
            petalLength: 0,
            petalWidth: 0,
        }

        // loop through the trainingDataByClass
        trainingDataByClass.forEach((item) => {
            // sum the values of each property
            meanByClassObj.sepalLength += parseFloat(item.sepalLength);
            meanByClassObj.sepalWidth += parseFloat(item.sepalWidth);
            meanByClassObj.petalLength += parseFloat(item.petalLength);
            meanByClassObj.petalWidth += parseFloat(item.petalWidth);
        })

        // calculate the mean of each property
        meanByClassObj.sepalLength = meanByClassObj.sepalLength / trainingDataByClass.length;
        meanByClassObj.sepalWidth = meanByClassObj.sepalWidth / trainingDataByClass.length;
        meanByClassObj.petalLength = meanByClassObj.petalLength / trainingDataByClass.length;
        meanByClassObj.petalWidth = meanByClassObj.petalWidth / trainingDataByClass.length;

        // push the meanByClassObj into the meanByClass array
        meanByClass.push(meanByClassObj);

    })

    // return the meanByClass array
    return meanByClass;
}



// holdOutMatch function
const holdOutMatch = (testData, meanByClass) => {
    // define the array to store the test model
    const testModel = [];

    // loop through the testData
    testData.forEach(iristTest => {
        const distances = [];
        meanByClass.forEach(item => {
            // calculate the euclidean distance of the test object to the trainingObj of each class
            const distance = calculateEuclideanDistance(iristTest, item);
            // push the distance into the distances array
            distances.push({
                class: item.class,
                distance
            });
        });

        // sort the distances array
        distances.sort((a, b) => a.distance - b.distance);


        // define the prediction object with the class and the distance. use the first element of the distances array
        const prediction = [{
            class: distances[0].class,
            distance: distances[0].distance
        }]

        // push the testModelObj into the testModel array
        testModel.push({
            class: iristTest.class,
            prediction
        });

    });

    // return the testModel array
    return testModel;
}


// function to count the amount of correct predictions
const calculateCorrectPredictions = (testResults) => {
    // define the variable to store the correct predictions
    let correctPredictions = 0;

    // loop through the testResults
    testResults.forEach(result => {
        const { class: classExpected, prediction } = result;
        // verify if the classExpected is equal to the class of the first neighbor
        if (classExpected === prediction[0].class) {
            // increment the correctPredictions
            correctPredictions++;
        }
    });

    // return the correctPredictions
    return correctPredictions;
}

// function to calculate the accuracy
const calculateAccuracy = (correctPredictions, testDataLength) => {
    // calculate the accuracy
    return (correctPredictions / testDataLength);
}


/* 
TEST FUNCTIONS
*/

let fileName = '';
fileName = '/../iris-test.data';
fileName = '/../iris.data';
const fullPath = __dirname + fileName;

startProcess(fullPath);
