import httpClient from './httpClient';

const getDataPo = (params) => httpClient.get('/dashboard/monitoring', { params });
const getData = (params) => httpClient.get('/dashboard/total-biaya', { params });

export {
    getDataPo,
    getData
}