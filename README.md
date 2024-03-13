# Pharmacy Management System

This is a final project for a semester course at the International University - Vietnam National University, Hanoi. It is an assembly language program written for the 16-bit x86 architecture that simulates a simple pharmacy management system. The code was collected from various sources and has been compiled and modified by cdphuc.

## Features

- Password-protected access
- Menu-driven interface
- Buy medicines (Panadol, Paracetamol, Cleritek, Aspirin, Brufen, Surbex Z, Arinac, Sinopharm Vaccine, Pfizer Vaccine)
- View sales statistics for each medicine
- Calculate and display the total amount earned

## Requirements

- DOS or a compatible operating system
- An x86 assembly language compiler (e.g., MASM, NASM)

## Usage

1. Navigate to the `src/` directory.
2. Compile the `pharmacy.asm` file using your preferred compiler.
3. Run the compiled executable.
4. Enter the password (default: `group5$`) when prompted.
5. Follow the on-screen menu instructions to perform various actions.

## Code Structure

The code is divided into several sections:

- `.data` section: Defines all the data elements, such as strings, variables, and constants.
- `.code` section: Contains the main program logic and subroutines.

The main subroutines include:

- `security`: Handles password verification.
- `menu`: Displays the main menu and handles user input.
- `buyMedicines`: Allows the user to buy medicines and calculates the total amount earned.
- `statsMedicines`: Displays the sales statistics for each medicine.
- `showAmount`: Displays the total amount earned.
- `output`: A utility procedure for printing decimal numbers.

## Customization

You can customize the program by modifying the `.data` section in the `pharmacy.asm` file. For example, you can change the password, medicine names, prices, or any other string or variable values.

## Source

The code for this program was collected from various sources and has been compiled and modified by cdphuc as a final project for a semester course at the International University - Vietnam National University, Hanoi.
