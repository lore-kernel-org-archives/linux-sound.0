From: "Eoin OClerigh" <OClerigh@eumetsat.de>
Date: Mon, 22 Feb 1999 16:20:25 +0000
Subject: Yamaha OPL3SA2 vs ESD
Message-Id: <marc-linux-sound-91970084926180@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Greetings!

Over the past months I've noticed a few questions on the OPL3SA2 chip and, now that I want to use ESD on a Toshiba laptop, I face similar problems. I don't recall seeing comprehensive solutions posted, but perhaps those who have figured out their OPL3SA2/3 problems might care to advise me (bearing in mind that for me, sound is a Black Art):

Situation:
- Yamaha OPL3SA2 on Toshiba Satellite 300CDT laptop. 
- Linux 2.0.36 with OSS sound driver for OPL3SA2 as module.
- sndconfig (from RedHat) run to set irq, dma as for Win 95

Behavior:
- can send a .au file to /dev/audio (and hear it! ;->
- Start Enlightened Sound Daemon (esd) and get message:
initializing... (and nothing else) 
- any further attempts to send anything to /dev/audio get a 'device busy' message.

Can anyone suggest:
- where I can get a copy of the current ESD source (I have only a binary on a tools disk from RedHat)
- where I can get more documentation on ESD and the driver (eg, to answer qn: 'is ESD asking for a service to which the driver provides an unexpected answer?')
- whether this is a symptom of a misconfiguration of the driver (I have run through a number of dma addresses and irq ports but am always willing to try more!) and if so whether there is a systematic way to find the correct configuration
- whether this is a symptom of a known bug in the driver


All succor siezed!
Thanks
Eoin
----------------------------------------------------------------------------------------------
Eoin O Clerigh, EUMETSAT, Darmstadt, Germany
