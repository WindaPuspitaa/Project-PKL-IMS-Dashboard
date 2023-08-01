import httpClient from './httpClient';

const getUser = (params) => httpClient.get('/data-master/get-user', { params });
const simpanUser = (params) => httpClient.post('/data-master/simpan-user', params);
const hapusUser = (params) => httpClient.post('/data-master/delete-user', params);

const simpanProyek = (params) => httpClient.post('/data-master/simpan-proyek', params);
const getProyek = (params) => httpClient.get('/data-master/get-proyek', { params });
const hapusProyek = (params) => httpClient.post('/data-master/delete-proyek', params);

export {
    getUser,
    simpanUser,
    hapusUser,
    simpanProyek,
    getProyek,
    hapusProyek
}