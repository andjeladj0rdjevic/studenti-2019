from collections import OrderedDict

class Predmeti:
    def __init__(self, predmeti):
        if not predmeti:
            raise ValueError("Predmeti cannot be null or empty")

        self.predmet_per_name = OrderedDict()
        for p in predmeti:
            self.predmet_per_name[p.naziv.lower()] = p

    def get_nr_of_predmeti(self):
        return len(self.predmet_per_name)

    def get_by_name(self, name):
        return self.predmet_per_name.get(name.lower())

    def get_names(self):
        return list(self.predmet_per_name.keys())

    def get_names_enclosed(self, enclose_with):
        return [enclose_with + name + enclose_with for name in self.get_names()]

    def get_all(self):
        return self.predmet_per_name.values()
