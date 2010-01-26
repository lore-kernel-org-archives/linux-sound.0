From: <debian@bercot.org>
Date: Tue, 26 Jan 2010 16:05:26 +0000
Subject: Sound through HDMI with ATI Radeon HD 4550
Message-Id: <cc038cf54be64f952a0fb7ef9775a505@localhost>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hello,

I'm not sure I'm at the right place (please, if not, tell me where I can
find a solution...) but I have a problem with multimedia hardware.
So, I've changed my graphic card and I've bought an ATI Radeon HD 4550. My
goal is to use only an HDMI cable between my computer and my AV amplifier.
I've installed Debian Sid but I can't have any sound... Everything seems
OK with Alsa (and PulseAudio), but no sound !!!

With google, I've found this :
http://www.phoronix.com/scan.php?page=news_item&px=NzgxMA
[I should need a 2.6.33 kernel to have HDMI support with ATI cards]
So, I've compiled the 2.6.33RC5 kernel, but no difference !!!

The card seems to be OK :
# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: HDMI [HDA ATI HDMI], device 3: ATI HDMI [ATI HDMI]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

Do you have any idea ?

Thank you.

David.
