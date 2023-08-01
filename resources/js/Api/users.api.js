import httpClient from './httpClient';

const getUser = (params) => httpClient.get('/manage-user/get-user', { params });
const simpanUser = (params) => httpClient.post('/manage-user/simpan-user', params);
const hapusUser = (params) => httpClient.post('/manage-user/delete-user', params);

export {
    getUser,
    simpanUser,
    hapusUser
}