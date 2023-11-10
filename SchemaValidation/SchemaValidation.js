db.createCollection("user", { validator: { $jsonSchema: require('./userValidation.json') } })
db.createCollection("grabacion", { validator: { $jsonSchema: require('./grabacionValidation.json') } })
db.createCollection("horario", { validator: { $jsonSchema: require('./horarioValidation.json') } })
db.createCollection("informe", { validator: { $jsonSchema: require('./informeValidation.json') } })
db.createCollection("mensaje", { validator: { $jsonSchema: require('./mensajeValidation.json') } })
db.createCollection("notificacion", { validator: { $jsonSchema: require('./notificacionValidation.json') } })
db.createCollection("proyecto", { validator: { $jsonSchema: require('./proyectoValidation.json') } })
db.createCollection("reunion", { validator: { $jsonSchema: require('./reunionValidation.json') } })
db.createCollection("tarea", { validator: { $jsonSchema: require('./tareaValidation.json') } })
db.createCollection("asitencia", { validator: { $jsonSchema: require('./asitenciaValidation.json') } })


