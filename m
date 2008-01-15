From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 15 Jan 2008 21:25:13 +0000
Subject: [PATCH 3/5] sound: fix atiixp section mismatch
Message-Id: <20080115132513.8aecc399.randy.dunlap@oracle.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkml <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Cc: perex@perex.cz, akpm <akpm@linux-foundation.org>, samr <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix section mismatch in atiixp by making some functions __devinit.

WARNING: vmlinux.o(.text+0xfd9304): Section mismatch: reference to .init.data:atiixp_quirks (between 'ac97_probing_bugs' and 'snd_atiixp_codec_detect')

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 sound/pci/atiixp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.24-rc7-git7.orig/sound/pci/atiixp.c
+++ linux-2.6.24-rc7-git7/sound/pci/atiixp.c
@@ -560,7 +560,7 @@ static int snd_atiixp_aclink_down(struct
 	     ATI_REG_ISR_CODEC2_NOT_READY)
 #define CODEC_CHECK_BITS (ALL_CODEC_NOT_READY|ATI_REG_ISR_NEW_FRAME)
 
-static int ac97_probing_bugs(struct pci_dev *pci)
+static int __devinit ac97_probing_bugs(struct pci_dev *pci)
 {
 	const struct snd_pci_quirk *q;
 
@@ -574,7 +574,7 @@ static int ac97_probing_bugs(struct pci_
 	return -1;
 }
 
-static int snd_atiixp_codec_detect(struct atiixp *chip)
+static int __devinit snd_atiixp_codec_detect(struct atiixp *chip)
 {
 	int timeout;
 
