From: "Eric B. Mitchell" <emitchell@altaira.com>
Date: Mon, 22 Feb 1999 17:05:20 +0000
Subject: Re: Yamaha OPL3SA2 vs ESD
Message-Id: <marc-linux-sound-91970355629042@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91970084926180@msgid-missing>
In-Reply-To: <marc-linux-sound-91970084926180@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



Eoin OClerigh wrote:
> 
> Greetings!
> 
> Over the past months I've noticed a few questions on the OPL3SA2 chip and, now that I want to use ESD on a Toshiba laptop, I face similar problems. I don't recall seeing comprehensive solutions posted, but perhaps those who have figured out their OPL3SA2/3 problems might care to advise me (bearing in mind that for me, sound is a Black Art):
> 
> Situation:
> - Yamaha OPL3SA2 on Toshiba Satellite 300CDT laptop.
> - Linux 2.0.36 with OSS sound driver for OPL3SA2 as module.
> - sndconfig (from RedHat) run to set irq, dma as for Win 95
> 
> Behavior:
> - can send a .au file to /dev/audio (and hear it! ;->
> - Start Enlightened Sound Daemon (esd) and get message:
> initializing... (and nothing else)
> - any further attempts to send anything to /dev/audio get a 'device busy' message.
>
> Can anyone suggest:
> - where I can get a copy of the current ESD source (I have only a binary on a tools disk from RedHat)
> - where I can get more documentation on ESD and the driver (eg, to answer qn: 'is ESD asking for a service to which the driver provides an unexpected answer?')
> - whether this is a symptom of a misconfiguration of the driver (I have run through a number of dma addresses and irq ports but am always willing to try more!) and if so whether there is a systematic way to find the correct configuration
> - whether this is a symptom of a known bug in the driver

Esd takes over the audio device, so that multiple programs may share 
it amongst themselves.  Programs request that esd play sounds for 
them, and esd mixes all current requests together into a single
audio stream for the sound device.  When it's active, you'll get the 
device busy message if you send anything to /dev/dsp or /dev/audio.

There are a couple of things you can try:

1) Use esd-aware audio apps.

On recent versions of mpg123, you can simply "make linux-esd" and 
have mpg123 direct all output to esd, instead of /dev/dsp.

For playing many simple sound files, "esdplay {filename}" is enough.

2) Use the esddsp wrapper.

For some binary programs, it is possible to reroute the audio stream
from /dev/dsp to esd.  /dev/audio conversion is not supported at 
this time.

3) Temporarily suspend esd

"esdctl suspend ; some-non-esd-program ; esdctl resume"

This will tell esd to release the audio device for use by another 
application.  Note that no esd-aware applications will be heard
while esd is disabled.

4) Run esd with "autosuspend" enabled

Starting esd as "esd -as 2" will have esd release the sound card 
after 2 seconds of inactivity.

5) Got source? Will port!

Any program that has a reasonably abstracted audio device layer can
be ported to use esd natively in about an hour.

> All succor siezed!
> Thanks
> Eoin
> ----------------------------------------------------------------------------------------------
> Eoin O Clerigh, EUMETSAT, Darmstadt, Germany

-- ebm

+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
| Eric B. Mitchell         mailto:ericmit@ix.netcom.com |
+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
