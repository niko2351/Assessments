import datetime

def compute_prev_date(dates_list:list):
	"""
	"""

	return [ (datetime.datetime(int(x.split("-")[0]),int(x.split("-")[1]),int(x.split("-")[2])) - datetime.timedelta(1)).strftime("%d %b %Y")  for x in dates_list]