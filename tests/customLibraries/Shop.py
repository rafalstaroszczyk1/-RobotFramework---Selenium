from robot.api.deco import library, keyword


@library
class Shop:

    # def __init__(self):
    #     pass

    @keyword
    def hello_world(self):
        print('hello')
