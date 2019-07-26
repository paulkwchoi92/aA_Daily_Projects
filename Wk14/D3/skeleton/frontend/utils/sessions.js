export const postUser = user => (
    $.ajax({
        url: '/api/users',
        method: 'POST',
        data: { user }
    })
); // creates user

export const postSession = user => (
    $.ajax({
        url: '/api/session',
        method: 'POST',
        datas: { user }
    })
); //logs in user

export const deleteSession = () => {
    $.ajax({
        url: '/api/session',
        method: 'DELETE'
    })
}// signs out user