From: Keith Duthie <psycho@albatross.co.nz>
Date: Mon, 22 Feb 1999 21:20:26 +0000
Subject: Re: AWE64
Message-Id: <marc-linux-sound-91965384430901@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91965172830159@msgid-missing>
In-Reply-To: <marc-linux-sound-91965172830159@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 21 Feb 1999, Conde Martinez Rodolfo wrote:

> 	With my SB AWE64, i haven't been able to make the
> Awe wave table work, awe_wave says it doesn't dettect it and i tried
> uncommenting the lines in awe_config.h about the base io address and the
> DRAM size, it prints <SoundBlaster EMU..blabla> then i load a font with
> sfxload and try drvmidi but there isn't any sound, playmidi says something
> like no playback device found aborting.....What can it be ??...the other
What is the exact error?

One thing you could try is to make sure all sound related devices exist in
/dev. A list of sound related devices can be found in
/usr/src/linux/Documentation/devices.txt under "14 char".
Unlikely to be the problem, but unfortunately you haven't exactly given
much detailed information about the problem.

Have you tested the card as described in 4.1 of the Soundblaster-AWE
mini-HOWTO?
-- 
.sig under deconstruction. Please watch out for falling stars.
                          O-        +++ATH0
