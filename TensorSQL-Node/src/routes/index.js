
const express = require('express');
const router = express.Router();
const text2sqlController = require('../controllers/text2sqlController');

router.post('/generate', text2sqlController.generate);

module.exports = router;
