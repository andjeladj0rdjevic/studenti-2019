class CyrTransilterator:
    cyr2lat = {
        'а': "a", 'б': "b", 'в': "v", 'г': "g", 'д': "d", 'ђ': "dj",  # "đ"
        'е': "e", 'ж': "z",  # "ž"
        'з': "z", 'и': "i", 'ј': "j", 'к': "k", 'л': "l", 'љ': "lj",
        'м': "m", 'н': "n", 'њ': "nj", 'о': "o", 'п': "p", 'р': "r",
        'с': "s", 'т': "t", 'ћ': "c",  # "ć"
        'у': "u", 'ф': "f", 'х': "h", 'ц': "c", 'ч': "c",  # "č"
        'џ': "dz",  # "dž"
        'ш': "s",  # "š"
        'А': "A", 'Б': "B", 'В': "V", 'Г': "G", 'Д': "D", 'Ђ': "Dj",  # "Đ"
        'Е': "E", 'Ж': "Z",  # "Ž"
        'З': "Z", 'И': "I", 'Ј': "J", 'К': "K", 'Л': "L", 'Љ': "Lj",
        'М': "M", 'Н': "N", 'Њ': "Nj", 'О': "O", 'П': "P", 'Р': "R",
        'С': "S", 'Т': "T", 'Ћ': "C",  # "Ć"
        'У': "U", 'Ф': "F", 'Х': "H", 'Ц': "C", 'Ч': "C",  # "Č"
        'Џ': "Dz",  # "Dž"
        'Ш': "S",  # "Š"
    }
    lat2cyr = {v: k for k, v in cyr2lat.items()}  # Reverse mapping

    @classmethod
    def to_latin(cls, text: str) -> str:
        return "".join(cls.cyr2lat.get(char, char) for char in text)

    @classmethod
    def to_cyrillic(cls, text: str) -> str:
        result = ""
        i = 0
        while i < len(text):
            sub = text[i : i + 2]
            if sub in cls.lat2cyr:
                result += cls.lat2cyr[sub]
                i += 2
            else:
                result += cls.lat2cyr.get(text[i], text[i])
                i += 1
        return result
