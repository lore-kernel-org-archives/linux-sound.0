From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 15 Jan 2008 21:25:29 +0000
Subject: [PATCH 4/5] sound: fix rme9652 section mismatch
Message-Id: <20080115132529.937171b7.randy.dunlap@oracle.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkml <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Cc: perex@perex.cz, akpm <akpm@linux-foundation.org>, samr <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix section mismatch in hdsp:  snd_hdsp_proc_init() can be called from
an ioctl at any time.

WARNING: vmlinux.o(.text+0x1089bc2): Section mismatch: reference to .init.text: (between 'snd_hdsp_create_alsa_devices' and 'snd_hdsp_free')

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 sound/pci/rme9652/hdsp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.24-rc7-git7.orig/sound/pci/rme9652/hdsp.c
+++ linux-2.6.24-rc7-git7/sound/pci/rme9652/hdsp.c
@@ -3558,7 +3558,7 @@ snd_hdsp_proc_read(struct snd_info_entry
 
 }
 
-static void __devinit snd_hdsp_proc_init(struct hdsp *hdsp)
+static void snd_hdsp_proc_init(struct hdsp *hdsp)
 {
 	struct snd_info_entry *entry;
 
