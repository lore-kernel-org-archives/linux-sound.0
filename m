From: Chris Ison <cisos@bigpond.net.au>
Date: Sat, 16 Nov 2002 08:40:35 +0000
Subject: how do I get around kernel default behaviour
Message-Id: <marc-linux-sound-103743627326681@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

ok, using a sound card driver as a template, I am slowly trying to put a
software only midi driver together. the only hassle is when I insmod it
and try to run a midi program, I get the following errors ... 

Nov 16 18:05:37 debian modprobe: modprobe: Can't locate module
sound-slot-0
Nov 16 18:05:37 debian modprobe: modprobe: Can't locate module
sound-service-0-1

Is there any way to work around this? there is no midi hardware which is
why I'm trying to do a software driver. (can't afford a new soundcard)

Thanx in advance
Chris Ison
