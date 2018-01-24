# -*- coding: utf-8 -*-
from view import View


class Controller(object):

    def __init__(self):
        self.view = View(self)

    def mainloop(self):
        self.view.mainloop()
