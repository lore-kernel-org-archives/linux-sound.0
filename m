From: Samuel Thibault <Samuel.Thibault@ens-lyon.fr>
Date: Sun, 30 Jun 2002 20:33:43 +0000
Subject: [PATCH] 2.4.18 drivers/sound/maestro.c
Message-Id: <marc-linux-sound-102546924217499@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hi !

maestro.c:3537 takes care about volume button pressing when requesting irq
(maestro_probe) :

	if((ret=request_irq(card->irq, ess_interrupt, SA_SHIRQ, card_names[card_type], card)))
	{
		<snipped>
	}

	/* Turn on hardware volume control interrupt.
	   This has to come after we grab the IRQ above,
	   or a crash will result on installation if a button has been pressed,
	   because in that case we'll get an immediate interrupt. */
	n = inw(iobase+0x18);
	n|=(1<<6);
	outw(n, iobase+0x18);

but not when unloading module : in fact, this bit is never cleared.
Indeed, loading the module, unloading it, and pressing a volume button
immediately crashes.

This cures the problem :

diff -urN linux-2.4.18/drivers/sound/maestro.c linux-2.4.18-cor/drivers/sound/maestro.c
--- linux-2.4.18/drivers/sound/maestro.c	Sun Jun 30 22:00:22 2002
+++ linux-2.4.18-cor/drivers/sound/maestro.c	Sun Jun 30 22:02:11 2002
@@ -3569,9 +3569,18 @@
 static void maestro_remove(struct pci_dev *pcidev) {
 	struct ess_card *card = pci_get_drvdata(pcidev);
 	int i;
+	u32 n;

 	/* XXX maybe should force stop bob, but should be all
 		stopped by _release by now */
+
+	/* Turn off hardware volume control interrupt.
+	   This has to come before we leave the IRQ below,
+	   or a crash results if a button is pressed ! */
+	n = inw(card->iobase+0x18);
+	n&=~(1<<6);
+	outw(n, card->iobase+0x18);
+
 	free_irq(card->irq, card);
 	unregister_sound_mixer(card->dev_mixer);
 	for(i=0;i<NR_DSPS;i++)

This patch also apply to 2.5 series (tested on 2.5.24) in linux/sound/oss
by using -p3.

Best regards,

Samuel Thibault

