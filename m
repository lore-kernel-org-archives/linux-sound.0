From: "Nerijus" <nerijus@sat.lt>
Date: Sun, 11 Jun 2000 14:12:49 +0000
Subject: FW: Announce: Via 686 driver version 1.1.8 released
Message-Id: <marc-linux-sound-96073704225517@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


-----Original Message-----
From: owner-linux-kernel@vger.rutgers.edu
[mailto:owner-linux-kernel@vger.rutgers.edu]On Behalf Of Jeff Garzik
Sent: Sunday, June 11, 2000 8:12 AM
To: linux-via@havoc.gtf.org; Linux Kernel Mailing List
Subject: Announce: Via 686 driver version 1.1.8 released


The latest Linux kernel driver for Via 686-based audio chips,
development version 1.1.8, was just posted at

	http://gtf.org/garzik/drivers/via82cxxx/

It is also available in kernel version 2.4.0-test1-ac11 or later.

Version 1.1.8 should round out playback support quite well, fixing a
couple bugs as well as introducing spiffy new DocBook-based PDF
documentation.  Let me know if any problems with playback persist.

Specific changes are:

* Fix K7M/K7V problems related to touching the SB legacy settings
register.
* Fix "unhandled interrupt" messages.
* Make interrupt routine a bit smaller.
* PDF and inline docs

As usual, since this is a development version, the usual disclaimers
apply -- don't use it on a production system, don't assume its stable,
don't feed it to your cat, etc.

--
Jeff Garzik              | Liberty is always dangerous, but
Building 1024            | it is the safest thing we have.
MandrakeSoft, Inc.       |      -- Harry Emerson Fosdick

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.rutgers.edu
Please read the FAQ at http://www.tux.org/lkml/
