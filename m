From: Alexis DOMJAN <disco@igaia.ch>
Date: Tue, 15 Sep 1998 10:32:24 +0000
Subject: gmod and xmp, cannot open /dev/sequencer !
Message-Id: <marc-linux-sound-90586345324981@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I have an AWE32 properly configured. I can play the midi files using 
the wavetable without any problem. However if I try to use gmod or xmp
modules players they cannot open /dev/sequencer. However the device
can be opened with drvmidi to play the midi files. Exactly it says:

/dev/sequencer: no such device or address

But if I do something like echo test > /dev/sequencer I got no error!

Can someone help with this please ?


Thanks in advance
---
Alexis Domjan <adomjan@igaia.ch>
