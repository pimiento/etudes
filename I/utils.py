# -*- coding: utf-8 -*-
import configurations as conf


def get_x_y_coordinate(row, col):
    return (
        (col * conf.DIMENSION_OF_EACH_SQUARE),
        ((conf.NUMBER_OF_ROWS - (row + 1)) * conf.DIMENSION_OF_EACH_SQUARE)
    )
