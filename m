From: Rui Sousa <rsousa@grad.physics.sunysb.edu>
Date: Wed, 11 Aug 1999 10:57:32 +0000
Subject: MAD16 module
Message-Id: <marc-linux-sound-93439761127229@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I have a MAD16 based soundcard (Philips SB70) and I'm running
into troubles when compiling the driver as a module.

When I compile the driver into the kernel sounds works without a glitch.
When I compile the driver as a module all sound sources continue to work
with no problems (cd,audio,mike,etc) but now I have a constant clicking
goint back and forth between left and right speaker...
This only goes away after reseting the computer, unloading the modules
doesn't help.

I have seen this since 2.0.3? (whener sound got modular) but never got
to report
it (instead I just continued to compile the driver into the kernel).

Does someone know what is going on?

-- 
Rui Sousa
