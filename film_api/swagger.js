/*
 * @Date: 2024-05-27 19:50:57
 * @LastEditTime: 2024-05-27 19:51:04
 */
const swaggerJSDoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

// Swagger definition
const swaggerDefinition = {
    openapi: '3.0.0',
    info: {
        title: 'Express API Documentation',
        version: '1.0.0',
        description: 'API documentation for the Express project',
    },
};

// Options for the swagger docs
const options = {
    swaggerDefinition,
    apis: ['./routes/*.js'], // Path to the API docs
};

// Initialize swagger-jsdoc
const swaggerSpec = swaggerJSDoc(options);

module.exports = (app) => {
    app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
};
