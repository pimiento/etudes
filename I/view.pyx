# -*- coding: utf-8 -*-
import utils
import heapq
import exceptions
import configurations as conf
from tkinter import (
    Tk, Menu, Canvas, Frame, Label
)


class View(object):

    all_squares_to_be_colored = []

    def __init__(self, controller):
        self.controller = controller
        self.parent = Tk()
        self.parent.title(conf.TITLE)
        self.create_life()
        self.canvas.bind("<Button-1>", self.on_square_clicked)

    def mainloop(self):
        self.parent.mainloop()

    def create_life(self):
        self.create_top_menu()
        self.create_canvas()
        self.draw_board()
        self.create_bottom_frame()

    def create_top_menu(self):
        self.menu_bar = Menu(self.parent)
        self.create_game_menu()
        self.create_about_menu()

    def __add_menu(self, label, cascade=None):
        menu = Menu(self.menu_bar, tearoff=0)
        if cascade is None:
            cascade = []
        for entry in cascade:
            if entry is None:
                menu.add_separator()
            else:
                menu.add_command(
                    label=entry[0], command=entry[1]
                )
        self.menu_bar.add_cascade(label=label, menu=menu)
        self.parent.config(menu=self.menu_bar)

    def create_game_menu(self):
        self.__add_menu(
            "Game", [
                ("New Game", self.on_new_game_menu_clicked),
                None,           # separator
                ("Run Game", self.on_run_game_menu_clicked),
                ("Step Forward", self.on_step_fwd_menu_clicked),
                ("Step Backward", self.on_step_bkw_menu_clicked)
            ]
        )

    def create_about_menu(self):
        self.__add_menu(
            "About", [("Rules", self.on_rules_menu_clicked)]
        )

    def on_new_game_menu_clicked(self):
        pass

    def on_run_game_menu_clicked(self):
        pass

    def on_step_fwd_menu_clicked(self):
        pass

    def on_step_bkw_menu_clicked(self):
        pass

    def on_rules_menu_clicked(self):
        pass

    def create_canvas(self):
        canvas_width = conf.NUMBER_OF_ROWS * conf.DIMENSION_OF_EACH_SQUARE
        canvas_height = conf.NUMBER_OF_COLUMNS * conf.DIMENSION_OF_EACH_SQUARE
        self.canvas = Canvas(
            self.parent, width=canvas_width, height=canvas_height
        )
        self.canvas.pack(padx=8, pady=8)

    def draw_board(self):
        for row in range(conf.NUMBER_OF_ROWS):
            for col in range(conf.NUMBER_OF_COLUMNS):
                x1, y1 = utils.get_x_y_coordinate(row, col)
                x2 = x1 + conf.DIMENSION_OF_EACH_SQUARE
                y2 = y1 + conf.DIMENSION_OF_EACH_SQUARE
                if len(self.all_squares_to_be_colored) > 0 and \
                   (row, col) in self.all_squares_to_be_colored:
                    self.canvas.create_rectangle(
                        x1, y1, x2, y2, fill=conf.BOARD_COLOR_2,
                        outline=conf.BORDER_COLOR
                    )
                else:
                    self.canvas.create_rectangle(
                        x1, y1, x2, y2, fill=conf.BOARD_COLOR_1,
                        outline=conf.BORDER_COLOR
                    )

    def create_bottom_frame(self):
        self.bottom_frame = Frame(self.parent, height=64)
        self.info_label = Label(
            self.bottom_frame, text=" Select cells to start game ",
            fg=conf.BOARD_COLOR_2
        )
        self.info_label.pack(side="right", padx=8, pady=5)
        self.bottom_frame.pack(fill="x", side="bottom")

    def on_square_clicked(self, event):
        clicked_column = event.x // conf.DIMENSION_OF_EACH_SQUARE
        clicked_row = (
            (conf.NUMBER_OF_ROWS) - (event.y // conf.DIMENSION_OF_EACH_SQUARE + 1)
        )
