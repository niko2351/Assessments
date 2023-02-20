def is_date_format_correct(date:str)->bool:
	"""
	This function takes in a date in string format
	and returns true if the date matches the format
	YYYY-MM-DD and false if it doesn't
	"""
	arr = date.split("-")
	return len(arr)==3 and len(arr[0])==4 and arr[0].isdecimal()==True and len(arr[1])==2 and arr[1].isdecimal()==True and len(arr[2])==2 and arr[2].isdecimal()==True
