From: Conde Martinez Rodolfo <rconde@ada.fciencias.unam.mx>
Date: Mon, 22 Feb 1999 04:24:35 +0000
Subject: Re: AWE64
Message-Id: <marc-linux-sound-91965813932396@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91965172830159@msgid-missing>
In-Reply-To: <marc-linux-sound-91965172830159@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 22 Feb 1999, Keith Duthie wrote:

# On Sun, 21 Feb 1999, Conde Martinez Rodolfo wrote:
# 
# > 	With my SB AWE64, i haven't been able to make the
# > Awe wave table work, awe_wave says it doesn't dettect it and i tried
# > uncommenting the lines in awe_config.h about the base io address and the
# > DRAM size, it prints <SoundBlaster EMU..blabla> then i load a font with
# > sfxload and try drvmidi but there isn't any sound, playmidi says something
# > like no playback device found aborting.....What can it be ??...the other
# What is the exact error?
# 
# One thing you could try is to make sure all sound related devices exist in
# /dev. A list of sound related devices can be found in
# /usr/src/linux/Documentation/devices.txt under "14 char".
# Unlikely to be the problem, but unfortunately you haven't exactly given
# much detailed information about the problem.

	

	I went to find out and in the part of 14 char i'm only missing the
following:


		 17 = /dev/patmgr0	Sequencer patch manager
		 33 = /dev/patmgr1	Sequencer patch manager
		  0 = /dev/dos_hda	First BIOS harddrive whole disk
		 64 = /dev/dos_hdb	Second BIOS harddrive whole disk
		128 = /dev/dos_hdc	Third BIOS harddrive whole disk
		192 = /dev/dos_hdd	Fourth BIOS harddrive whole disk



	and /dev/sequencer1 too.....


# 
# Have you tested the card as described in 4.1 of the Soundblaster-AWE
# mini-HOWTO?
# -- 

	Right know i can't do but i will try it and see what happens.....



	Thanks for answering !!!!!!



# .sig under deconstruction. Please watch out for falling stars.
#                           O-        +++ATH0
# 
# 

-------------------------------------------------------------------------------
| Rodolfo Conde Mtz                   Universidad Nacional Autonoma de Mexico |
| ICQ      14757500                   Facultad de Ciencias                    |
| e-mails:                            Ciencias de la Computacion              |
| rconde@ada.fciencias.unam.mx                                                |
| conderodolfo@usa.net                                                        |
-------------------------------------------------------------------------------
