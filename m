From: Brian Hall <brihall@bigfoot.com>
Date: Sun, 05 Sep 1999 05:23:30 +0000
Subject: Using two different sound cards simultaneously
Message-Id: <marc-linux-sound-93651557302755@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have two sound cards I'd like to use at the same time, a ISA SB16 and a PCI
Ensoniq 1371. I've made a cable to connect the output of the 1371 to the Line
In of the SB16, and compiled them both as modules. I have the system set to use
the SB16 as the default sound card. I can install the 1371 module, but when I
send sound to /dev/dsp1 I get nothing out. Can this be done, or am I wasting my
time? System is RedHat6 with the 2.2.12 kernel.

BTW, the reason I want to do this is that the SB16 has good tone controls and
hardward MIDI, but the Ensoniq has smoother sound with Xmame.

--
Brian Hall
Linux Consultant
