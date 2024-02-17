from collections import OrderedDict

class OcenePoStudentu:
    def __init__(self, student: int, predmeti: "Predmeti"):
        self.student = student
        self.ocene = OrderedDict()  # Preserve insertion order
        for predmet in predmeti.get_all():
            self.ocene[predmet] = 0

        if len(self.ocene) != predmeti.get_nr_of_predmeti():
            raise ValueError(f"Unexpected number of predmeti: expected {predmeti.get_nr_of_predmeti()}, got {len(self.ocene)}")

    def __hash__(self):
        return hash(self.student)

    def __eq__(self, other):
        if isinstance(other, OcenePoStudentu):
            return self.student == other.student
        return NotImplemented

    def get_student(self) -> int:
        return self.student

    def get_ocene(self) -> list[int]:
        return list(self.ocene.values())

    def dodaj_ocenu(self, predmet: "Predmet", ocena: int):
        cur_ocena = self.ocene.get(predmet)
        if cur_ocena is not None and ocena > cur_ocena:
            self.ocene[predmet] = ocena
