import Joi from "joi";

export type ExtendedJoi = Joi.Root & {
    exampleExtension(): Joi.NumberSchema,
}