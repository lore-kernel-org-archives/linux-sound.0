From: "Matthias H. Hennig" <hennig@cn.stir.ac.uk>
Date: Mon, 04 Nov 2002 09:54:56 +0000
Subject: i810_audio
Message-Id: <marc-linux-sound-103640373115001@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

teher seems to be a persiting problem with the i810_audio driver for certain 
cards/boards. Here is my exerience...

My setup looks like that:
Host bridge: Intel Corp. 82845 845 (Brookdale) Chipset Host Bridge (rev 3).
PCI bridge: Intel Corp. 82801BA/CA/DB PCI Bridge (rev 18).
Multimedia audio controller: Intel Corp. 82801BA/BAM AC'97 Audio (rev 18).
The sound controller is on board.

As regularly reported here and elsewhere, the kernel modules insalls fine, but 
there is no sound.

I solved the problem by doing the following:
- install the oss modules (no sound)
- rmmod the oss modules
- install the alsa modules (no sound)
- rmmod the alsa modules
- install the oss modules again (SOUND!!!)

I have no idea why, but this works... Any comments?

Matthias

-- 
------------------------------
http://www.cn.stir.ac.uk/~mhh1


