From: Jeff Garzik <jgarzik@mandrakesoft.com>
Date: Sat, 27 May 2000 17:31:45 +0000
Subject: Request for testing - nm256 and maestro audio updates
Message-Id: <marc-linux-sound-95944908801596@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

At the following URL are updates to nm256 and maestro sound drivers,
against Alan Cox's 2.4.0-test1-ac2 patch set.  Would it be possible for
nm256 and maestro owners (nm256 especially) to give the following patch
a test, and an 'ok/not ok' ?

http://gtf.org/garzik/kernel/files/patches/2.4/2.4.0-test1-ac2/nm256-and-maestro-2.4.0.1.ac2.patch.gz

The main changes in both cases are changes in mixer code, so be sure to
play with your mixer settings using "xmixer" or similar to make sure
everything is working.

Kudos to Zabbo for his continued support and Eric for his continued
testing.

Thanks,

	Jeff



-- 
Jeff Garzik              | Liberty is always dangerous, but
Building 1024            | it is the safest thing we have.
MandrakeSoft, Inc.       |      -- Harry Emerson Fosdick
