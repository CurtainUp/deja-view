from sightengine.client import SightengineClient
import requests, json, os

def get_celebs(url):

    client = SightengineClient('1460406796','huUawvG2vTAfE8aqCFvp')
    output = client.check('celebrities').set_url({url})

    print("Output:" output)

    # Returns names and probabilities
    results = output["faces"][0]["celebrity"]

    for celeb in results:
        print("Name:", celeb["name"], "Probability:", celeb["prob"])