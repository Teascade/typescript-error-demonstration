import Joi from "joi";

export { Joi };


export type ExtendedJoi = Joi.Root & {
    exampleExtension(): Joi.NumberSchema,
}


export const exampleExtension: Joi.Extension = {
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

export const extended: ExtendedJoi = Joi.extend(exampleExtension);