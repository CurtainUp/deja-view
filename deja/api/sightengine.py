from sightengine.client import SightengineClient
import requests, json, os
import deja.local_settings as local_settings

def get_celebs(url):
    client = SightengineClient(local_settings.SIGHTENGINE_USER, local_settings.SIGHTENGINE_KEY)
    output = client.check('celebrities').set_url({url})
    # Returns names and probabilities
    results = output["faces"][0]["celebrity"]

    return results

    # for celeb in results:
    #     return ("Name:", celeb["name"], "Probability:", celeb["prob"])