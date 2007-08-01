From: "Scott Thompson" <postfail@hushmail.com>
Date: Wed, 01 Aug 2007 05:57:57 +0000
Subject: [PATCH 1/3] sound/oss ioremap/iounmap balancing
Message-Id: <20070801055757.80042DA820@mailserver8.hushmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

This patch, along with previously submitted dmasound_awacs.c patch, 
completes an audit of the 'sound' tree for ioremap/iounmap 
balancing and return code checking on ioremap calls.
  ioremap() must be balanced by an iounmap() (else this causes a 
memory leak).

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
---
diff --git a/sound/oss/i810_audio.c b/sound/oss/i810_audio.c
index f5e31f1..407958c 100644
--- a/sound/oss/i810_audio.c
+++ b/sound/oss/i810_audio.c
@@ -3362,7 +3362,7 @@ static int __devinit i810_probe(struct 
pci_dev *pci_dev, const struct pci_device
 
 	if (card->use_mmio) {
 		if (request_mem_region(card->ac97base_mmio_phys, 512, "ich_audio 
MMBAR")) {
-			if ((card->ac97base_mmio = ioremap(card->ac97base_mmio_phys, 
512))) { /*@FIXME can ioremap fail? don't know (jsaw) */
+			if ((card->ac97base_mmio = ioremap(card->ac97base_mmio_phys, 
512))) { 
 				if (request_mem_region(card->iobase_mmio_phys, 256, "ich_audio 
MBBAR")) {
 					if ((card->iobase_mmio = ioremap(card->iobase_mmio_phys, 
256))) {
 						printk(KERN_INFO "i810: %s mmio at 0x%04lx and 0x%04lx\n",
@@ -3383,6 +3383,10 @@ static int __devinit i810_probe(struct 
pci_dev *pci_dev, const struct pci_device
 					card->use_mmio = 0;
 				}
 			}
+			else {
+				card->use_mmio;
+				release_mem_region(card->ac97base_mmio_phys, 512);
+			}
 		}
 		else {
 			card->use_mmio = 0;
diff --git a/sound/oss/msnd_pinnacle.c b/sound/oss/msnd_pinnacle.c
index f1f49eb..117f79d 100644
--- a/sound/oss/msnd_pinnacle.c
+++ b/sound/oss/msnd_pinnacle.c
@@ -1912,6 +1912,9 @@ static int __init msnd_init(void)
 
 static void __exit msdn_cleanup(void)
 {
+	if (dev.base)
+		iounmap(dev.base);
+
 	unload_multisound();
 	msnd_fifo_free(&dev.DAPF);
 	msnd_fifo_free(&dev.DARF);

--
Click for free info on online degrees and make up to $150K/ year.
http://tagline.hushmail.com/fc/Ioyw6h4eqxfQwlYnfxENxHi266P9jFLejoyBEHTKtJ1SIH45HWWzON/

