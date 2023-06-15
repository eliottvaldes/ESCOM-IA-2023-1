const obtenerIDDelegacion = (NombreDelegacion) => {

    let id = 0;

    switch (NombreDelegacion) {
        case 'GUSTAVO_A._MADERO':
            id = 1;
            break;

        case 'ÁLVARO_OBREGÓN':
            id = 2;
            break;

        case 'XOCHIMILCO':
            id = 3;
            break;

        case 'TLALPAN':
            id = 4;
            break;

        case 'IZTAPALAPA':
            id = 5;
            break;

        case 'AZCAPOTZALCO':
            id = 6;
            break;

        case 'CUAUHTÉMOC':
            id = 7;
            break;

        case 'MIGUEL_HIDALGO':
            id = 8;
            break;

        case 'VENUSTIANO_CARRANZA':
            id = 9;
            break;

        case 'BENITO_JUÁREZ':
            id = 10;
            break;

        case 'COYOACÁN':
            id = 11;
            break;

        case 'IZTACALCO':
            id = 12;
            break;

        case 'LA_MAGDALENA_CONTRERAS':
            id = 13;
            break;

        case 'TLÁHUAC':
            id = 14;
            break;

        case 'MILPA_ALTA':
            id = 15;
            break;

        case 'CUAJIMALPA_DE_MORELOS':
            id = 16;
            break;



    }

    return id;

}

module.exports = {
    obtenerIDDelegacion
}