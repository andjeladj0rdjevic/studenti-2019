from typing import List

class PredmetDao:
    def get_predmet_id_by_naziv(self, naziv: str) -> List[int]:
        raise NotImplementedError

    def prepare_poznate_predmete(self):
        raise NotImplementedError
