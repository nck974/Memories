"""
Resize some images at the maximum size on the longest edge.
"""
from typing import Final
import os

from PIL import Image, ImageOps

INPUT_DIRECTORY: Final[str] = "../assets/images"
OUTPUT_DIRECTORY: Final[str] = "../assets/images_resized"
MAX_SIZE: Final[int] = 1920


def _resize_image(max_size: tuple[int, int], input_path: str, output_path: str) -> None:
    """
    Convert the image taking into account the size of the orientation of the image
    """
    img = Image.open(input_path)

    # Check orientation
    img = ImageOps.exif_transpose(img)

    img.thumbnail(max_size)
    img.save(output_path)


def main() -> None:
    """
    Main code
    """
    max_size = (MAX_SIZE, MAX_SIZE)

    # Loop through each file in the input directory
    for sub_folder in os.listdir(INPUT_DIRECTORY):
        # Create folder in output path
        output_subfolder_path = os.path.join(OUTPUT_DIRECTORY, sub_folder)
        os.makedirs(output_subfolder_path, exist_ok=True)

        for filename in os.listdir(os.path.join(INPUT_DIRECTORY, sub_folder)):
            print(f" {sub_folder} --> {filename}")

            if filename.endswith((".jpg", ".jpeg", ".png")):
                input_path = os.path.join(INPUT_DIRECTORY, sub_folder, filename)
                output_path = os.path.join(OUTPUT_DIRECTORY, sub_folder, filename)

                _resize_image(max_size, input_path, output_path)

                print(f"Resized:\n\tINPUT: {input_path}\n\tOUTPUT: {output_path}")


if __name__ == "__main__":
    main()
