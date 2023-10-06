import cv2
import matplotlib.pyplot as plt

# Load the image
image = cv2.imread('dog-1.jpeg')

# Check if the image loaded successfully
if image is None:
    print("Error: Unable to load the image.")
else:
    # Determine the Grid Size (n x n)
    n = int(input("Enter Grid size (nxn): ")) # Example: 3x3 grid
    rows, cols, _ = image.shape
    cell_size = rows // n  # square cells

    # Specify the block you want to extract (row and column indices)
    # row_index = int(input("Enter row index: "))  # Example: Row index of the cell to extract
    # col_index = int(input("Enter column index: "))  # Example: Column index of the cell to extract
    
    # Calculate the starting and ending coordinates of the cell
    # start_row = row_index * cell_size
    # end_row = (row_index + 1) * cell_size
    # start_col = col_index * cell_size
    # end_col = (col_index + 1) * cell_size
    
    # Extract the specified cell
    # cell = image[start_row:end_row, start_col:end_col]  
    
    # Display the extracted cell
    # for i in range(len(grid_cells)):
    #     plt.imshow(cv2.cvtColor(grid_cells[i], cv2.COLOR_BGR2RGB))
    #     plt.axis('off')
    #     plt.show()  
    
    # Forming grid cells
    grid_cells = []
    for i in range(n):
        for j in range(n):
            cell = image[i * cell_size: (i + 1) * cell_size, j * cell_size: (j + 1) * cell_size]
            grid_cells.append(cell)
    # print(grid_cells) #List of grid cells,to access a particular cell use grid_cells[index]
    
    #Display the image and plot all the grid cells,also save the grid cells 
    for i, cell in enumerate(grid_cells):
        plt.subplot(n, n, i + 1)
        plt.imshow(cv2.cvtColor(cell, cv2.COLOR_BGR2RGB))
        cv2.imwrite(f'cell_{i}.jpg', cell)
        plt.axis('off')
    plt.show()
