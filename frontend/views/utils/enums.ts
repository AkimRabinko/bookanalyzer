import client from 'Frontend/generated/connect-client.default';

function getGenres(): Promise<string[]> {
    return client.call('EnumsController', 'getGenres');
}

function getLanguages() {
    return client.call('EnumsController', 'getLanguages');
}

function formatData(arr: string[]) {
    let formattedData: Object[] = [];
    for (let i = 0; i < arr.length; i++) {
        formattedData[i] = {
            label: arr[i],
            value: arr[i]
        };
    }
    return formattedData;
}

export {
    getGenres as getGenres,
    getLanguages as getLanguages,
    formatData as formatData
}