From: Emil Stephan <ste@esqhen.su.eunet.de>
Date: Wed, 09 Sep 1998 20:27:30 +0000
Subject: SB AWE Cards and external Midi Output, PnP registers too
Message-Id: <marc-linux-sound-90539695202895@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello Sir's,

as i see, there are some people using AWE cards here.
Did anyone get MIDI-output to an external synth or an external
MIDI-keyboard
running with these cards under Linux ?
I'am fiddling around with the mixer maps and the PnP-registers of my
card (AWE64Gold).
Did booting cold and booting warm and booting with loadlin, the only
difference i saw was in the mixer map at mixer map address 0x8e when
booting with loadlin, it had the value 0xc1 instead of 0xc0.
Another thing i found with newest isapnptools (1.15) was that there are
two
vendor reserved PnP registers (0x39 and 0x3D).
Can anyone tell me anything about it or is there a M$oft-Creative lock
on it ?

Any help will be apreciated.
Thanks in advance,
bye, Emil.
 
-- 
--------------------------------------------------
Emil Stephan, Marktplatz 39, 53773 Hennef, Germany
voice: +49-2242-84438

Accelerate Windows: 9.81 m/sec^2 would be adequate
