def DNA_strand(dna):
    result = ''

    for i in dna:
        match i:
            case 'A':
                result += 'T'
            case 'T':
                result += 'A'
            case 'C':
                result += 'G'
            case 'G':
                result += 'C'

    return result
