def transform_data(data):
    """
    This function takes in a dictionary of data and transforms it by converting all keys to uppercase and
    adding a "new_" prefix to each key. It then validates that all values in the dictionary are integers,
    and raises a ValueError if any value is not an integer.
    
    Args:
    data (dict): A dictionary of data with string keys and integer values.
    
    Returns:
    transformed_data (dict): A dictionary of transformed data with uppercase string keys and integer values.
    
    Raises:
    ValueError: If any value in the input data is not an integer.
    """
    
    transformed_data = {}
    
    for key, value in data.items():
        transformed_key = "new_" + key.upper()
        transformed_data[transformed_key] = value
        
        if not isinstance(value, int):
            raise ValueError("All values in the data must be integers.")
    
    return transformed_data
"""
calling the function
"""

data = {"apple": 5, "banana": 7, "orange": "not an integer"}
transformed_data = transform_data(data)
