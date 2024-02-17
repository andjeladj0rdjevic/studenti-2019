from collections import OrderedDict

class OcenePoRoku:
    class Key:
        ROK2NUM = {
            "ЈАН": 1, "ФЕБ": 2, "МАР": 3, "АПР": 4,
            "ЈУН": 6, "ЈУЛ": 7, "АВГ": 8, "СЕП": 9,
            "ОКТ": 10, "ОКД": 10, "ОК3": 10, "НОВ": 11
        }

        def __init__(self, student: int, rok: str):
            self.student = student
            self.rok = rok

        def __hash__(self):
            return hash((self.rok, self.student))

        def __eq__(self, other):
            if isinstance(other, Key):
                return self.rok == other.rok and self.student == other.student
            return NotImplemented

        @classmethod
        def rok_to_numeric(cls, rok: str) -> int:
            rok = rok.upper()
            month = rok[:3]
            year = rok[3:]
            return int(f"{cls.ROK2NUM[month]}{year}")

    def __init__(self, kljuc: Key, predmeti: "Predmeti"):
        self.kljuc = kljuc
        self.ocene = OrderedDict()  # Preserve insertion order
        for predmet in predmeti.get_all():
            self.ocene[predmet] = 0

        if len(self.ocene) != predmeti.get_nr_of_predmeti():
            raise ValueError(f"Unexpected number of predmeti: expected {predmeti.get_nr_of_predmeti()}, got {len(self.ocene)}")

    def get_kljuc(self) -> Key:
        return self.kljuc

    def get_ocene(self) -> list[int]:
        return list(self.ocene.values())

    def dodaj_ocenu(self, predmet: "Predmet", ocena: int):
        cur_ocena = self.ocene.get(predmet)
        if cur_ocena is not None and ocena > cur_ocena:
            self.ocene[predmet] = ocena
