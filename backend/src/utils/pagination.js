const getPagination = (page, size) => {
    const limit = size ? +size : 10;
    const offset = page ? page * limit : 0;
    return { limit, offset };
};

const getPagingData = (response, page, limit) => {
    const { count: totalItems, rows: data } = response;
    const currentPage = page ? +page : 1;
    const totalPages = Math.ceil(totalItems / limit);
    return { totalItems, data, totalPages, currentPage };
};

module.exports = {
    getPagination,
    getPagingData
}