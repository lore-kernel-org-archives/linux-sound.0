From: Chris Ison <cisos@bigpond.net.au>
Date: Wed, 20 Nov 2002 03:44:51 +0000
Subject: Software Midi Kernel Module
Message-Id: <marc-linux-sound-103776440608180@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

A GPL'd software midi kernel module is currently under development and
is based on another small project on the net (not timidity). Initial
tests have been successful with playmidi and rosegarden.

What I am after is advice and feedback on how things should be done
within a kernel module, also people who have delt with midi hardware
drivers within the kernel and know what the driver is recieving.

Also I am looking for someone who knows how alsa works, as I have only
had oss experience and currently the project the driver is based on only
deals with oss.

I also need to know, if possable, how to get a module to set the major
number on a /dev, or how I can override existing drivers using the same
major number but only on the midi devices.

Anyone interested in getting involved are welcome to email me.
