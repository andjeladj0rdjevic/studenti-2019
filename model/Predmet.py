class Predmet:
    def __init__(self, naziv: str):
        self.naziv = naziv

    def get_naziv(self) -> str:
        return self.naziv

    def __lt__(self, other: "Predmet") -> bool:
        if other is None:
            return False 
        return self.naziv.lower() < other.naziv.lower()

    def __eq__(self, other: object) -> bool:
        if isinstance(other, Predmet):
            return self.naziv.lower() == other.naziv.lower()
        return NotImplemented

    def __hash__(self) -> int:
        return hash(self.naziv.lower())
