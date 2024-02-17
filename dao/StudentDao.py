from typing import List

from .model import OcenePoRoku, OcenePoStudentu, Predmeti

class StudentDao:
    def get_sve_predmete(self, tip: int, tip_studija: int) -> Predmeti:
        raise NotImplementedError

    def get_sve_poznate_predmete(self, tip: int, tip_studija: int) -> Predmeti:
        raise NotImplementedError

    def get_ocene_po_roku(self, predmeti: Predmeti, od_godine: int, do_godine: int) -> List[OcenePoRoku]:
        raise NotImplementedError

    def get_ocene_po_studentu(self, predmeti: Predmeti, od_godine: int, do_godine: int) -> List[OcenePoStudentu]:
        raise NotImplementedError
