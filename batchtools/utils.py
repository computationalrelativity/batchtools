from glob import glob

def get_segment_list():
    return [int(x[-4:]) for x in glob("output-????")]

def print_segment_id(x):
    return str(x).zfill(4)
