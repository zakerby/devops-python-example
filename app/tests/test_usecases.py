from django.test import TestCase as DjangoTestCase


class StubTest(DjangoTestCase):
    def test_stub(self):
        self.assertEqual(True, True)