package com.schuetz.waste

import com.fasterxml.jackson.databind.PropertyNamingStrategy

class MyPropertyNamingStrategy : PropertyNamingStrategy() {
    // The idea is to send fields with the same name used for fields. For some reason jackson sends everything lowercase
    // and the solutions here https://stackoverflow.com/questions/26744885/jackson-objectmapper-upper-lower-case-issues
    // don't work. For now modified fields in client to use lowercase.
}
