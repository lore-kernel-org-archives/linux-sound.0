Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170F41C71
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732444; cv=none; b=tM1AH3wPN4iXla0Mhrzno5KTunTBsyjmqL0xDG/rNEtlp4byQACucJEDOdel6/721CT0htbJ8TVW0WXgAXbiwySiEQ44/wJ+LHej6TWw4w1d1LkLWDNDRHunRYVT7MBkCht2HJWkONFNHWEhG83ewM5WAWPdW6ltLtEvtUukOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732444; c=relaxed/simple;
	bh=AJTRBnj3SHqkEJM909LJx+7ebLtPffFbRjhPQyu5UTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPn72BnoKe8H9RwajSGDSqp1lWTEsimXiJv0xby51NaN9qB+aCc2R5BV5tdMYgeDUKZAjgoKgI9Q8pzbTP4QYk1SFOC21vOGglmlqfuQq6utu7san5bF9rraC3NDeAvZy4hV2RP6AzoAyEy6DohF32uLiVih4EzTJM3k/k21RfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=TIdiypPK; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="TIdiypPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=/bcfFFddJNUxyIxBNr8PNsUUSGoTthii7Kiyh2IDbHI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TIdiypPK+sLdcGpWYkKPxEi89A0ylET+XNd2ne5eMQ2j8K4JBqAXBPShafAHCtC9
	 sNMqSmNcI7B1DGgRi/WTetgPqZZI9Tt/PixYSVnpQj6gxCrcrEFQbbOH60ssNMyzH
	 0JbNd14CjP/Pah4ZlmQQlrTk72bfBfKgADZrCRs7f7iIWurBiMChfiWigtXfTAm7/
	 v8rB+VCLSRelDpLIwMvUbZqQwQs8EDGKHi8G3jjkxJfMDiC8t5cWBUe6dXF9Ludqn
	 +vgUywUbxi3I+P+oBq3aH6XWUPUnBGgZrSXGlojRgvthWuYKYDkLtlWHAIYXhkCPw
	 xeEPNdx4ZGz353jDMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAOJV-1rsH6l1iV1-00Bpyi; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RAW-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 03/10] ALSA: emu10k1: move the whole GPIO event handling to the workqueue
Date: Sun, 21 Apr 2024 22:47:00 +0200
Message-ID: <20240421204707.2487686-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
References: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C4566ARuBKDdwHjrJk9H25/VTw9oK8PONuoJ7nC2rq31ruX7Mh4
 NKFoaCFgYL9yrYcfEAhtmY9JfybXuURO9M1QNvFfo8CmG1D+Dg6tepmoW4xW6an4bWsVBE/
 REr8DjwllIz0rCx0MiDmZLnGWRbUt2D7FhKn4TtyFfqedoct8ZZmNG3ZXRo/N1bdF8dtdPp
 4VP4q+b+oEegE7dCU9Oww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nkgtoaj8rr0=;MfWBB5EY4laMYatkiNXaY9ZZvae
 AqiGt1xlCde2kHgeJQS+EN/USK1EMhb++j5ZCso73BvS30BB9ECI62Wa2ZLV1i/qVPx78Czns
 8jSKIu/WdSTEuMx1BZ/UlPbBILXipTGnlkE7XTF04j6q9TWseoyEndeUKjd+8E9W9tvNInY7f
 aG8E1dXUjOH5SqCFWwuj1Cdnwo8HozxiLWq264npbQVHv0zo2OFsu8sJzLF1DroE6MrSaQ729
 6Q9aT68DX7BTCVRYZ3ektxz1L8IrjDy+yPnXrFf3K0ysdRWT92mDlMqQMAdcSrVS+s9EUmFrm
 OOpp9bHZZRaJ1dB7M6yW7CIH7w8OA7OYWdxyKWmW+jPswbfDqlW+ZNfh5qgr2+xoLZxXTuAuU
 sqqoFXqUxLqR7T3P3Y5A5Ackj7F8jOO8zqzo/E4rIi/J7seq/i34iKaKgGc4PbgahwFgebJEg
 nDUXYHVbE0ADqV+h4FlpVxCWeiYtPARFv8LDXNiGGugAy5wxScFNyQvjl61qB3p60s04GcEPl
 fLxJkxalRaBSPP/2lS9dOcwRczQGJZius6+AlQdoJHTtD+DcCP9XkEFRvBFu+WddXJuspsCgq
 LiRFPA4C18O6GtzfgRTV12TJy4XK1LSNDkadIyEqO3SZAYOWY9QrrJ1msCi6xrcV+BnGgBLTh
 M5+ymFkmT9OCHi10eS40u/T7A+lmnqxcCT933w/5Es0hO5Y8VBgn2zL8n2WxWwD4A7/FEWJyl
 /Qb9tJO2aZzSi+3DIsnGSoybuW/wIzuyEo9QLMoX+rbANqb1d9rZUyMhW7+PsG23qHCig3YcL
 dhdRIrUT+rhgBW4rUSP9fGXgG1aHIsCdK+9NfvzOIKlVo=

The actual event processing was already done by workqueue items. We can
move the event dispatching there as well, rather than doing it already
in the interrupt handler callback.

This change has a rather profound "side effect" on the reliability of
the FPGA programming: once we enter programming mode, we must not issue
any snd_emu1010_fpga_{read,write}() calls until we're done, as these
would badly mess up the programming protocol. But exactly that would
happen when trying to program the dock, as that triggers GPIO interrupts
as a side effect. This is mitigated by deferring the actual interrupt
handling, as workqueue items are not re-entrant.

To avoid scheduling the dispatcher on non-events, we now explicitly
ignore GPIO IRQs triggered by "uninteresting" pins, which happens a lot
as a side effect of calling snd_emu1010_fpga_{read,write}().

Fixes: fbb64eedf5a3 (ALSA: emu10k1: make E-MU dock monitoring interrupt-dri=
ven)
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218584
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |  3 +-
 sound/pci/emu10k1/emu10k1.c      |  3 +-
 sound/pci/emu10k1/emu10k1_main.c | 56 ++++++++++++++++----------------
 3 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 1af9e6819392..9cc10fab01a8 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1684,8 +1684,7 @@ struct snd_emu1010 {
 	unsigned int clock_fallback;
 	unsigned int optical_in; /* 0:SPDIF, 1:ADAT */
 	unsigned int optical_out; /* 0:SPDIF, 1:ADAT */
-	struct work_struct firmware_work;
-	struct work_struct clock_work;
+	struct work_struct work;
 };
=20
 struct snd_emu10k1 {
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index fe72e7d77241..dadeda7758ce 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -189,8 +189,7 @@ static int snd_emu10k1_suspend(struct device *dev)
=20
 	emu->suspend =3D 1;
=20
-	cancel_work_sync(&emu->emu1010.firmware_work);
-	cancel_work_sync(&emu->emu1010.clock_work);
+	cancel_work_sync(&emu->emu1010.work);
=20
 	snd_ac97_suspend(emu->ac97);
=20
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index 6265fc9ae260..86eaf5963502 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -765,19 +765,10 @@ static void snd_emu1010_load_dock_firmware(struct snd=
_emu10k1 *emu)
 	msleep(10);
 }
=20
-static void emu1010_firmware_work(struct work_struct *work)
+static void emu1010_dock_event(struct snd_emu10k1 *emu)
 {
-	struct snd_emu10k1 *emu;
 	u32 reg;
=20
-	emu =3D container_of(work, struct snd_emu10k1,
-			   emu1010.firmware_work);
-	if (emu->card->shutdown)
-		return;
-#ifdef CONFIG_PM_SLEEP
-	if (emu->suspend)
-		return;
-#endif
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg); /* OPTIONS: Whic=
h cards are attached to the EMU */
 	if (reg & EMU_HANA_OPTION_DOCK_OFFLINE) {
 		/* Audio Dock attached */
@@ -792,43 +783,54 @@ static void emu1010_firmware_work(struct work_struct =
*work)
 	}
 }
=20
-static void emu1010_clock_work(struct work_struct *work)
+static void emu1010_clock_event(struct snd_emu10k1 *emu)
 {
-	struct snd_emu10k1 *emu;
 	struct snd_ctl_elem_id id;
=20
-	emu =3D container_of(work, struct snd_emu10k1,
-			   emu1010.clock_work);
-	if (emu->card->shutdown)
-		return;
-#ifdef CONFIG_PM_SLEEP
-	if (emu->suspend)
-		return;
-#endif
-
 	spin_lock_irq(&emu->reg_lock);
 	// This is the only thing that can actually happen.
 	emu->emu1010.clock_source =3D emu->emu1010.clock_fallback;
 	emu->emu1010.wclock =3D 1 - emu->emu1010.clock_source;
 	snd_emu1010_update_clock(emu);
 	spin_unlock_irq(&emu->reg_lock);
 	snd_ctl_build_ioff(&id, emu->ctl_clock_source, 0);
 	snd_ctl_notify(emu->card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
 }
=20
-static void emu1010_interrupt(struct snd_emu10k1 *emu)
+static void emu1010_work(struct work_struct *work)
 {
+	struct snd_emu10k1 *emu;
 	u32 sts;
=20
+	emu =3D container_of(work, struct snd_emu10k1, emu1010.work);
+	if (emu->card->shutdown)
+		return;
+#ifdef CONFIG_PM_SLEEP
+	if (emu->suspend)
+		return;
+#endif
+
 	snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &sts);
=20
 	// The distinction of the IRQ status bits is unreliable,
 	// so we dispatch later based on option card status.
 	if (sts & (EMU_HANA_IRQ_DOCK | EMU_HANA_IRQ_DOCK_LOST))
-		schedule_work(&emu->emu1010.firmware_work);
+		emu1010_dock_event(emu);
=20
 	if (sts & EMU_HANA_IRQ_WCLK_CHANGED)
-		schedule_work(&emu->emu1010.clock_work);
+		emu1010_clock_event(emu);
+}
+
+static void emu1010_interrupt(struct snd_emu10k1 *emu)
+{
+	// We get an interrupt on each GPIO input pin change, but we
+	// care only about the ones triggered by the dedicated pin.
+	u16 sts =3D inw(emu->port + A_GPIO);
+	u16 bit =3D emu->card_capabilities->ca0108_chip ? 0x2000 : 0x8000;
+	if (!(sts & bit))
+		return;
+
+	schedule_work(&emu->emu1010.work);
 }
=20
 /*
@@ -969,8 +971,7 @@ static void snd_emu10k1_free(struct snd_card *card)
 		/* Disable 48Volt power to Audio Dock */
 		snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, 0);
 	}
-	cancel_work_sync(&emu->emu1010.firmware_work);
-	cancel_work_sync(&emu->emu1010.clock_work);
+	cancel_work_sync(&emu->emu1010.work);
 	release_firmware(emu->firmware);
 	release_firmware(emu->dock_fw);
 	snd_util_memhdr_free(emu->memhdr);
@@ -1549,8 +1550,7 @@ int snd_emu10k1_create(struct snd_card *card,
 	emu->irq =3D -1;
 	emu->synth =3D NULL;
 	emu->get_synth_voice =3D NULL;
-	INIT_WORK(&emu->emu1010.firmware_work, emu1010_firmware_work);
-	INIT_WORK(&emu->emu1010.clock_work, emu1010_clock_work);
+	INIT_WORK(&emu->emu1010.work, emu1010_work);
 	/* read revision & serial */
 	emu->revision =3D pci->revision;
 	pci_read_config_dword(pci, PCI_SUBSYSTEM_VENDOR_ID, &emu->serial);
--=20
2.44.0.701.g2cf7baacf3.dirty

