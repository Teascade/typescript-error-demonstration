import Joi from "joi";

export { Joi };

export const exampleExtension = {
    type: 'test',
    messages: {
        'test.invalid': '{{#label}} must be number',
    },
    validate(value, helpers) {
        if (typeof value !== 'number' && typeof value !== 'string')
            return { value, errors: helpers.error('numberTime.invalid') };
        return { value };
    },
};

/** @type {import('./types').ExtendedJoi} */
export const extended = Joi.extend(exampleExtension);