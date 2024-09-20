from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
import warnings

class Inventory:

    @keyword
    def get_product_list(self):
        """Fetch product details and return as a list of dictionaries."""
        from Browser import ElementHandle
        from robot.libraries.BuiltIn import BuiltIn

        # Get the Browser instance from Robot Framework
        browser = BuiltIn().get_library_instance('Browser')

        # Locator for product elements
        product_contents_locator = ".inventory_item"

        # Get all product elements
        product_elements = browser.get_elements(product_contents_locator)

        # Create an empty list to hold product information
        product_list = []

        # Iterate through each product element
        for index, product in enumerate(product_elements):
            product_obj = {
                'name': product.locator('.inventory_item_name').text_content(),
                'description': product.locator('.inventory_item_desc').text_content(),
                'price': product.locator('.inventory_item_price').text_content()
            }
            product_list.append(product_obj)

        return product_list