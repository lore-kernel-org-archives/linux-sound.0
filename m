From: Bertrik Sikken <bertrik@zonnet.nl>
Date: Sat, 03 Aug 2002 20:53:51 +0000
Subject: looking for PCI soundcard analysis tool
Message-Id: <marc-linux-sound-102840794830958@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,

I have a PCI sound card based on a Cmedia 8738 chip, which has
windows drivers that can do various 3d effects (A3D, EAX 1.0
and 2.0) with very little impact on CPU usage.
So I assume these effects are done on the cmedia chip, not in
software.

The Linux drivers can only do the standard stuff, although the
sources indicate that there are some extended registers, possibly
used for the 3d processing. I'd like to figure out how the 3d
processing works by monitoring the data sent by the windows driver
to those registers and then try to resend that data under Linux.

For figuring out my HP3300c scanner I used a tool called USB snoopy
that helps monitor the traffic between driver and scanner over the
USB bus.

Is there a similar tool for PCI?

Kind regards,
Bertrik Sikken

