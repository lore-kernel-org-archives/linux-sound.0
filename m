From: "Nerijus" <nerijus@sat.lt>
Date: Sat, 13 May 2000 11:02:15 +0000
Subject: FW: Announce:  Updated Via 686A audio driver
Message-Id: <marc-linux-sound-95821965608986@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

-----Original Message-----
From: owner-linux-kernel@vger.rutgers.edu
[mailto:owner-linux-kernel@vger.rutgers.edu]On Behalf Of Jeff Garzik
Sent: Wednesday, May 10, 2000 9:26 PM
To: Linux Kernel Mailing List; linux-via@gtf.org
Subject: Announce: Updated Via 686A audio driver


The first development release of the 'native' Via 686A OSS-compatible
audio driver has been posted at

	http://gtf.org/garzik/drivers/

This driver only supports audio playback at present -- recording and
MIDI support[1] are not included at the moment.  Also included is a
diagnostic program which allows developers and hackers to examine the
chip's registers.

Test away, and please report bugs to linux-via mailing list.

Known bugs:  volume may be -very- low on some motherboards, and needs to
be adjusted

	Jeff




[1] Via chips don't include MIDI hardware, so this merely involves
setting up a 'virtual MIDI' interface.

--
Jeff Garzik              | ILOVEYOU, Linux.
Building 1024            |
MandrakeSoft, Inc.       |

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.rutgers.edu
Please read the FAQ at http://www.tux.org/lkml/
