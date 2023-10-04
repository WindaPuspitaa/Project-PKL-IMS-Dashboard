import httpClient from './httpClient';

const getData = (params) => httpClient.get('/report2', { params });

export {
    getData
}