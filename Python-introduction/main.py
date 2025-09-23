import pandas as pd
import re


def process_line(words):
    """
    Process a line of assembly code and extract LABEL, CODOP, and OPERAND.
    :param words: List of words from a line of assembly code.
    :return: Dictionary with keys 'LABEL', 'CODOP', and 'OPERAND'.
    """
    var_dict = {
        'LABEL': None,
        'CODOP': None,
        'OPERAND': None
    }
    # Case 1: LABEL CODOP OPERAND
    if words[0] != '':
        if re.match(r'^[A-Za-z][A-Za-z0-9]*$', words[0]):
            var_dict['LABEL'] = words[0]
        # Accept CODOPs with dot (e.g., op.Code)
        if re.match(r'^[A-Za-z][A-Za-z0-9\.]*$', words[1]):
            var_dict['CODOP'] = words[1]
        if len(words) > 2:
            var_dict['OPERAND'] = words[2]
        return var_dict

    # Case 2: CODOP OPERAND
    if words[0] == '':
        if re.match(r'^[A-Za-z][A-Za-z0-9\.]*$', words[1]):
            var_dict['CODOP'] = words[1]
        if len(words) > 2:
            var_dict['OPERAND'] = words[2]
        return var_dict


def main():
    """Main function to read a text file and process each line."""
    # Read the content of the text file
    with open('input.txt', 'r', encoding='utf-8') as file:
        text = file.read()
        # Iterate over each line in the file
        lines = text.splitlines()
        df = pd.DataFrame()  # Initialize an empty DataFrame
        for index, line in enumerate(lines):
            # Check if the line is empty or contains only whitespace
            if line.isspace() or line == '':
                print(f"[{index}] Line is empty or whitespace")
            elif line.startswith(';'):  # Check if the line is a comment
                print(f"[{index}] Line is a comment: {line}")
            else:
                # Split the line using spaces as delimiters
                words = re.split(r'\s+', line)
                # Print the resulting list of words
                print(f"[{index}] {words}")
                word_dict = process_line(words)
                print(f"[{index}] Processed line: {word_dict}")
                df = pd.concat([df, pd.DataFrame([word_dict])], ignore_index=True)
        
        # Save the DataFrame to a CSV file
        df.to_csv('output.csv', index=False)
        print("DataFrame saved to output.csv")
        print(df)

if __name__ == "__main__":
    main()
