#!/usr/bin/python
# -*- coding: utf-8 -*-

import tornado.httpserver
import tornado.ioloop
import tornado.options
import tornado.web
from tornado.options import define, options
import hashlib
import random
import time
import subprocess
import os

define("port", default=9999, help="run on the given port", type=int)

class TextHandler(tornado.web.RequestHandler):
	def get(self):
		self.handle_text()

	def post(self):
		self.handle_text()

	def handle_text(self):
		text = self.get_argument('text').encode('ISO-8859-1').lower(); # do not use UTF-8
		unique_filename = hashlib.sha224(text + str(random.randint(1, 9999999999)) + str(time.time())).hexdigest()

		synthesis_dir = "/vagrant/speech/synthesis/server/synthesis"
		f = open(synthesis_dir + "/" + unique_filename, "w+")
		f.write(text);
		f.close()
		
		cmd = ["/vagrant/speech/synthesis/server/speech-synthesis.sh", synthesis_dir + "/" + unique_filename]
		subprocess.Popen(cmd).wait()

		self.set_header("Content-Type", 'audio/x-wav')

		f = open(synthesis_dir + "/" + unique_filename + ".wav", "r")
		self.write(f.read())
		f.close()
		
		os.remove(synthesis_dir + "/" + unique_filename)
		os.remove(synthesis_dir + "/" + unique_filename + ".wav")


def main():
	tornado.options.parse_command_line()
	application = tornado.web.Application([
		(r"/", TextHandler),
	])
	http_server = tornado.httpserver.HTTPServer(application)
	http_server.listen(options.port)
	tornado.ioloop.IOLoop.instance().start()


if __name__ == "__main__":
	main()