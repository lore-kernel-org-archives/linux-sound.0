From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 15 Jul 2007 11:06:10 +0000
Subject: dead(?) CONFIG variables in SOUND PCI code?
Message-Id: <Pine.LNX.4.64.0707150703550.11552@localhost.localdomain>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


  any thoughts on how much of the following is dead content and can be
removed?

===== SND_CS46XX_DEBUG_GPIO =====
include/sound/cs46xx.h:1711:#ifdef CONFIG_SND_CS46XX_DEBUG_GPIO
sound/pci/cs46xx/cs46xx_lib.c:2095:#ifdef CONFIG_SND_CS46XX_DEBUG_GPIO
sound/pci/cs46xx/cs46xx_lib.c:2158:#endif /* CONFIG_SND_CS46XX_DEBUG_GPIO */
sound/pci/cs46xx/cs46xx_lib.c:2252:#ifdef CONFIG_SND_CS46XX_DEBUG_GPIO
===== TOUCHSCREEN_WM9705 =====
sound/pci/ac97/ac97_patch.c:484:#ifdef CONFIG_TOUCHSCREEN_WM9705
===== USE_MIXARTLOADER =====
sound/pci/mixart/mixart_hwdep.c:535:#if !defined(CONFIG_USE_MIXARTLOADER) && !defined(CONFIG_SND_MIXART) /* built-in kernel */
===== USE_PCXHRLOADER =====
sound/pci/pcxhr/pcxhr_hwdep.c:38:#if !defined(CONFIG_USE_PCXHRLOADER) && !defined(CONFIG_SND_PCXHR) /* built-in kernel */

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
