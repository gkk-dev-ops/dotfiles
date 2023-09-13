import sys
from pyzbar.pyzbar import decode
from PIL import Image

def read_text_from_image(image_path):
    image = Image.open(image_path)
    decoded_data = decode(image)
    
    if decoded_data:
        text = decoded_data[0].data.decode('utf-8')
        print("Decoded text:", text)
    else:
        print("No barcode or QR code found in the image.")

if len(sys.argv) > 1:
    image_path = sys.argv[1]
    read_text_from_image(image_path)
else:
    print("Please provide the path to the image as a command line argument.")
