From: Miles Lane <miles@amazon.com>
Date: Sun, 24 Jan 1999 23:44:14 +0000
Subject: Problem with cs4232.o
Message-Id: <marc-linux-sound-91722163016425@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hi,

I have a Crystal Audio CS4232 sound card in my Quantex H-1331 laptop.
I have built my own kernel using 2.2.0-pre7ac and the rest of the
OS is installed from the RPMs on rawhide.redhat.com.  I also have
Gnome installed from the 0.99.2 files.

The problem is that when I start up X, if I try to use the sound card
a get a popping sound from the speakers and STDERR shows a messages
stating that the program couldn't access /dev/dsp.  If I then run
"rmmod cs4232 ; probemod cs4232", the sound card works fine.

This leads me to think that my soundcard driver settings are fine.
However, I don't know why the driver needs to be unloaded and reloaded
before the driver can be accessed successfully.  Perhaps it's a side
effect of loading Gnome, but I don't think so.

Let me know if you have suggestions.

Thanks!

	Miles
