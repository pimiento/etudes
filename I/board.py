#!/usr/bin/env python3
import sys
import pygame
import logging
from pygame.locals import QUIT

# Logging settings
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger("board")

FPS=15
WINDOWWIDTH = 640
WINDOWHEIGHT = 480
CELLSIZE = 8


assert WINDOWWIDTH % CELLSIZE == 0,\
    "Window width must be a multiple of cell size."
assert WINDOWHEIGHT % CELLSIZE == 0,\
    "Window height must be a multiple of cell size"

CELLWIDTH = int(WINDOWWIDTH // CELLSIZE)
CELLHEIGHT = int(WINDOWHEIGHT // CELLSIZE)

logger.debug("CELLWIDTH = %r", CELLWIDTH)
logger.debug("CELLHEIGHT = %r", CELLHEIGHT)
# colors
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
RED = (255, 0, 0)
GREEN = (0, 255, 0)
DARKGRAY = (40, 40, 40)
BGCOLOR = WHITE
# global objects
DISPLAYSURF = None


def getFont(size=18):
    return pygame.font.Font('freesansbold.ttf', size)


def main():
    global FPSLOCK, DISPLAYSURF

    pygame.init()
    FPSLOCK = pygame.time.Clock()
    DISPLAYSURF = pygame.display.set_mode((WINDOWWIDTH, WINDOWHEIGHT))
    pygame.display.set_caption('Game of Life')

    showStartScreen()


def showStartScreen():
    DISPLAYSURF.fill(BGCOLOR)

    [pygame.draw.line(DISPLAYSURF, DARKGRAY, (x, 0), (x, WINDOWHEIGHT))
     for x in range(0, WINDOWWIDTH, CELLSIZE)]
    [pygame.draw.line(DISPLAYSURF, DARKGRAY, (0, y), (WINDOWWIDTH, y))
     for y in range(0, WINDOWHEIGHT, CELLSIZE)]

    while True:
        for event in pygame.event.get():
            if event.type == QUIT:
                pygame.quit()
                sys.exit()
        pygame.display.update()


if __name__ == "__main__":
    main()
