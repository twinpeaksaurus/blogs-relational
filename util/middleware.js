const jwt = require('jsonwebtoken');
const { SECRET } = require('../util/config');


const tokenExtractor = (req, res, next) => {
    //what does req.get do below???
    const authorization = req.get('authorization');
    if (authorization && authorization.toLowerCase().startsWith('bearer ')) {
        try {
            req.decodedToken = jwt.verify(authorization.substring(7), SECRET);
        } catch {
            return res.status(401).json({ error: 'token invalid' });
        }
    } else {
        console.log(authorization);

        return res.status(401).json({ error: 'token missing' });
    }
    next();
}

module.exports = { tokenExtractor }