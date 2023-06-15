const obtenerIDDelegacion = (NombreDelegacion) => {

    let id = 0;

    switch (NombreDelegacion) {
        case 'ÁLVARO_OBREGÓN':
            id = 1;
            break;
        case 'AZCAPOTZALCO':
            id = 2;
            break;
        case 'BENITO_JUÁREZ':
            id = 3;
            break;
        case 'COYOACÁN':
            id = 4;
            break;
        case 'CUAJIMALPA_DE_MORELOS':
            id = 5;
            break;
        case 'CUAUHTÉMOC':
            id = 6;
            break;
        case 'GUSTAVO_A._MADERO':
            id = 7;
            break;
        case 'IZTACALCO':
            id = 8;
            break;
        case 'IZTAPALAPA':
            id = 9;
            break;
        case 'LA_MAGDALENA_CONTRERAS':
            id = 10;
            break;
        case 'MIGUEL_HIDALGO':
            id = 11;
            break;
        case 'MILPA_ALTA':
            id = 12;
            break;
        case 'TLÁHUAC':
            id = 13;
            break;
        case 'TLALPAN':
            id = 14;
            break;
        case 'VENUSTIANO_CARRANZA':
            id = 15;
            break;
        case 'XOCHIMILCO':
            id = 16;
            break;
    }

    return id;

}

module.exports = {
    obtenerIDDelegacion
}