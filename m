From: "Noah M. Zigas" <noahz@stny.rr.com>
Date: Sun, 04 Jul 1999 13:12:49 +0000
Subject: no installed driver
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------329AC9DB58D7587921650A61"
Message-Id: <marc-linux-sound-93109408621687@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------329AC9DB58D7587921650A61
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit



--------------329AC9DB58D7587921650A61
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

X-Mozilla-Status2: 00000000
Message-ID: <377F5D00.F9DC2967@stny.rr.com>
Date: Sun, 04 Jul 1999 09:09:20 -0400
From: "Noah M. Zigas" <noahz@stny.rr.com>
X-Mailer: Mozilla 4.51 [en] (X11; I; Linux 2.2.10 i686)
X-Accept-Language: en
MIME-Version: 1.0
To: linux-sound@vgers.rutgers.edu
Subject: no installed driver
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
I've got a strange problem I hope somebody can help me with...

I've followed all the FAQ's and HOWTO's that I can find to set up my
soundcard.  It's an onboard OPL-3SA.  I use isapnp to configure it.
Everything seems to work fine except RealAudio.  I keep getting a write
error when I exit.

All my devices seem to be loaded, and I can cat *.au > /dev/audio just
fine.  The Enlightenment Souud Daemon works and I get sound.

But if I do a cat /dev/sndstat I don't have anything under the
'Installed drivers:' section.  All the device sections have at least one
entry.

Any idea what might be going on here?  I seemed to have the same problem
with the ALSA sound drivers.  All the devices would load, but no
Installed driver.

TIA,
Noah


--------------329AC9DB58D7587921650A61--
