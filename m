From: Daniel Kobras <daniel.kobras@student.uni-tuebingen.de>
Date: Sun, 12 Mar 2000 14:52:31 +0000
Subject: __NO_VERSION__ in nm256_audio - why?
Message-Id: <marc-linux-sound-95287361202193@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[There's no maintainer given for the nm256 so I try you folks...]

Hi!

I wonder what's the reasoning with defining __NO_VERSION__ in
nm256_audio.c? Using 2.3.51 with MODVERSIONS and modutils 2.3.6, this will
cause insmod&friends to complain about being unable to find kernel version
the module was compiled for and refuse to load the module. Simply
discarding the define works for me. Is anyone really fond of it? 

Regards,

Daniel.

--- drivers/sound/nm256_audio.c.orig	Sun Mar 12 15:22:31 2000
+++ drivers/sound/nm256_audio.c	Sun Mar 12 15:22:47 2000
@@ -13,7 +13,6 @@
  * off of it; go on, I dare you.  
  */
 
-#define __NO_VERSION__
 #include <linux/pci.h>
 #include <linux/init.h>
 #include <linux/module.h>
