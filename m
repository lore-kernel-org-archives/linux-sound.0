From: Robert Siemer <Robert.Siemer@gmx.de>
Date: Tue, 12 Jun 2001 00:52:37 +0000
Subject: [PATCH] (2.4.5) aci.c, miropcm20*.[c|h] for miroSOUND cards
Message-Id: <marc-linux-sound-99230719529903@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello!

The patch is for miroSOUND sound cards. Especially the miroSOUND PCM20
radio is benefits from it, because of the updated RDS/RBDS stuff.

The latest is for 2.4.5 and can be found on:
http://www.uni-karlsruhe.de/~Robert.Siemer/Private/
http://www.uni-karlsruhe.de/~Robert.Siemer/Private/aci-2.4.5.patch
(40kB)

Changes:
-I renamed some files. As radio drivers got their own directory, it
 make sense to let my drivers start with miropcm20:

 linux/drivers/media/radio/:
 -rw-rw-r--  1 siemer siemer   6218 Jun 11 02:59 miropcm20-radio.c
 -rw-rw-r--  1 siemer siemer   4082 Jun 11 02:41 miropcm20-rds-core.c
 -rw-rw-r--  1 siemer siemer    529 Jun 11 02:41 miropcm20-rds-core.h
 -rw-rw-r--  1 siemer siemer   3041 Jun 11 02:41 miropcm20-rds.c

 Resulting modules:
 -rw-rw-r--  1 siemer siemer   3300 Jun 11 06:02 miropcm20-rds.o
 -rw-rw-r--  1 siemer siemer   7360 Jun 11 06:02 miropcm20.o

-created miropcm20-rds-core.h (aci.h is not the right place...)
-invented preprocessor macros for better readability
-started with RDS user interface driver; 
 try "cat /dev/v4l/rds/radiotext" to get radiotext...
 This is marked 'experimental' (driver is very basic at the moment)
 and needs devfs.
-adapted video_register_device()-call (changed in kernel)
-some documentation updates/corrections 


Bye,
	Robert
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
