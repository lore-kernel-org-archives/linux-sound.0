From: Conde Martinez Rodolfo <rconde@ada.fciencias.unam.mx>
Date: Mon, 22 Feb 1999 02:37:15 +0000
Subject: AWE64
Message-Id: <marc-linux-sound-91965172830159@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


	Hi all, i'm new here, heard about the list and here i'm with a
problem with SB AWE64 PnP (i guess i'm not the first one to ask about it) 

	With my SB AWE64, i haven't been able to make the
Awe wave table work, awe_wave says it doesn't dettect it and i tried
uncommenting the lines in awe_config.h about the base io address and the
DRAM size, it prints <SoundBlaster EMU..blabla> then i load a font with
sfxload and try drvmidi but there isn't any sound, playmidi says something
like no playback device found aborting.....What can it be ??...the other
modules load well and detect the card, Could it be that the card has
enabled the mpu-401 uart, i read in the manuall that it's disabled setting
a jumpper ??? Acording to OSS/Comercial my card is a Creative SB AWE64 PnP
type 4


	About the PnP think i have used first the bios to configure
devices, it works ok with the modem know, and with the Sb it configures it
too....supposed because everythink works but the wave table, and then i
tried isapnptools with the three io's required for the table but didn't
work :( Any ideas would be apreciated.....

 

	Thanks for your answers !!!!!



-------------------------------------------------------------------------------
| Rodolfo Conde Mtz                   Universidad Nacional Autonoma de Mexico |
| ICQ      14757500                   Facultad de Ciencias                    |
| e-mails:                            Ciencias de la Computacion              |
| rconde@ada.fciencias.unam.mx                                                |
| conderodolfo@usa.net                                                        |
-------------------------------------------------------------------------------
