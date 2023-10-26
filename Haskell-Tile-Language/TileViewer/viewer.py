import pygame
import sys

# Define the colors for 0s and 1s
black = (0, 0, 0)
white = (255, 255, 255)

# Load the grid from a text file
filename = sys.argv[1]
grid = []
with open(filename) as f:
    for line in f:
        row = [int(x) for x in line.strip()]
        grid.append(row)

# Determine the dimensions of the grid
num_rows = len(grid)
num_cols = len(grid[0])

# Calculate an appropriate square size based on the screen's resolution
def calculate_square_size(screen_width, screen_height, num_rows, num_cols):
    return min(screen_width // num_cols, screen_height // num_rows)

# Set screen resolution
screen_width = 800
screen_height = 600

# Calculate square size
square_size = calculate_square_size(
    screen_width, screen_height, num_rows, num_cols)

# Initialize Pygame
pygame.init()

# Set up the window
window_name = "Viewing " + filename
screen = pygame.display.set_mode(
    (num_cols * square_size, num_rows * square_size))
pygame.display.set_caption(window_name)

# Draw the grid
for row in range(num_rows):
    for col in range(num_cols):
        # Determine the color for this square
        color = black if grid[row][col] == 1 else white
        # Draw the square
        pygame.draw.rect(screen, color, (col * square_size,
                         row * square_size, square_size, square_size))

# Display the window
pygame.display.flip()

# Wait for the user to close the window
done = False
while not done:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            done = True


# Clean up
pygame.quit()
