from sightengine.client import SightengineClient
import requests, json, os

def get_celebs(url):
    client = SightengineClient('1460406796','huUawvG2vTAfE8aqCFvp')
    output = client.check('celebrities').set_url({url})
    # Returns names and probabilities
    results = output["faces"][0]["celebrity"]

    return results

    # for celeb in results:
    #     return ("Name:", celeb["name"], "Probability:", celeb["prob"])