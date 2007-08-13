From: joe@perches.com
Date: Mon, 13 Aug 2007 06:33:38 +0000
Subject: [PATCH] [369/2many] MAINTAINERS - PCI SOUND DRIVERS (ES1370,
Message-Id: <46bffb42.66N9BeQ36i0N7cgE%joe@perches.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@linux-foundation.org, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 93f385f..59ba494 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3552,6 +3552,9 @@ M:	sailer@ife.ee.ethz.ch
 L:	linux-sound@vger.kernel.org
 W:	http://www.ife.ee.ethz.ch/~sailer/linux/pciaudio.html
 S:	Maintained
+F:	sound/pci/ens1370.c
+F:	sound/pci/ens1371.c
+F:	sound/pci/sonicvibes.c
 
 PCI SUBSYSTEM
 P:	Greg Kroah-Hartman
