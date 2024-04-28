Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5B054F96
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297048; cv=none; b=ZXDCOYIlW0vmKywaJaRuYshK8sAo4F6x9tQiaeqLBaJeN1E7jeqCfFISQ3hkKOyYZvvYkRaDWlJV3A8j5wdbvYcX8oKVGcKrMIMMh3KagaflqYdZdm28Ni1HWC4t+CemYr8ZKwtqQtqSx+CHXRrX7/8kldzIF6EoRD7bEGVlSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297048; c=relaxed/simple;
	bh=m/NnbNKzr6mqiumaZe68IAVng0yB5sa9bXPbvI5QMNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTRdGmsXf5HLJdCEZTzrtr5DaAvNDEFS2v5BBEy12iL0nqhWQ8SMU2Iw+gtxYDafoGpla+tP6/d9RdrwVR9fO6nIAb8Ox29Vg9Bf/P9ljZh6pMNg2102WssJ7HtqtqQ622G3T884q6dju+oQW3oOI/BJg10Bb/QEhM7CcQDXZq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=Azqxjyom; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="Azqxjyom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297037; x=1714901837;
	i=oswald.buddenhagen@gmx.de;
	bh=CZ4Ww9XzCqPHyzemBB+Spep8HrJD6dF6Bu9QTOJ8vO4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AzqxjyomUk9f7Lzd9iqxJw6ldt+5B2ykX7mKsJnBrT5UFsI5zA6ZWiFmgQEms38I
	 HGKqvY438xohDD93F0xxp2rQmNCHWJsR0ABp0ui6BmgNp+k6I8LDPtx5kFMtWHj0z
	 B26mx+pfnCYSrzwiZhhvZ/EjwX4+52wWrshL9l3TawkGExceOn+e7ayX+NdyMBUOc
	 qJdhp3Db4MtYJsgzEBrhixR1e0A6aDWlSlw2tGqXowOTe/xEIX+x4M+H5Co8flOtn
	 aZIRVRpZ4TSeuyfA7JwFcm6sjRl5CeUBxGqOpByymC/O4S4WbAfWfA0zHNb5t24QD
	 8ssVDH4mmFvRLJWCiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU0q-1sZFn712xw-00a15z; Sun, 28
 Apr 2024 11:37:17 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yC-Q7s-00; Sun, 28 Apr 2024 11:37:16 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 3/6] ALSA: emu10k1: move the whole GPIO event handling to the workqueue
Date: Sun, 28 Apr 2024 11:37:13 +0200
Message-ID: <20240428093716.3198666-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
References: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MXRbo0RuMbDkwX0dXpQ0/9UVPVFryPsAi4PATI++ATHsNJByaVW
 UZvvzgcsVBkQHMu6JZ2X3TfBAVfv4zJnVcNyYK9ypZXpsG9WOMBl23+wYBNosCusXYlmPuk
 CZvcgUWA5g+L4tFMUpNrVdHdU5zHLFZ8cIpKzoaNJwcf2aep9vHCf2E5pprvTNORYotowlj
 Bc97TOO3HEDLOjscWU3kg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Si6uIeMi7ZE=;p9AqzMfPtuRyO107aZdvU5SLsXD
 zE4aefIs70G1zwox0M8nzclgb3ozzHr9Udysck10HBkDunqqP30kmWeAh2ZzG+1ab/rgJ4cnM
 hIWweMAFkVng1aFq6sNy8B2rnDnnkRDc4IZo77wVrWbBfbEPQftKhd0G5sR4F7M0JX/FeIpXC
 tMuKS5MDwaJ4z5ahcfol2/rV1gmub7YAgZMK6NbiYF3TGx1Zr0RiYwh3QYWai/1Ar8qj/IZLC
 WEqAcEmJm+X8ogv3UAiBjZKwSolqbGO0Yc8G+WR0XCHOpubGxM9NeIxYUAf3xw9gw464uEKXq
 JSdvJDd91Eb0b/cnk4DeeOzVRYH9YBKcFp741wK6/QDcs7c1VirY86e7aLzQIyZaTek9Ml87r
 OIsf30wIvZ0cJ7Een4aJtUfwgcP0iDmKmYLAAovSY1u7lCCRAh5ur0ZLcIGqu2Gq2UYwS5Q6f
 D6EA7+1F85EqgbCqXtvSaLElZd5zkiVM8TwMRiqezpm9LrVPTuGKYD2wOSFmC1brFp+DxTkZF
 uwL0oTlvCrRQPNYGWq0sPg37QFjvcG5N698Kk28W2fbfoBwIKXGE35uNOYqdkFnjH5M1z913v
 H/Is8HiimZP0AS1y+G69NoXicekkYok8qhkjoNVxAuEYdHNI+vUtHnG2i9xY5nK4KC4TkWIjl
 apIAgt3rNvwWorp+4yxz0vh3T/V8g016flolV4phljdepDDjEmSw+H/OkCN85jJrxC1CMy4WA
 uks1WSomIygCxXuo+U5onm+f/YhhgquEOQJwIwE7Ky7t5/aN7ZcUuKbg5kGyl7ygdCzbYViJw
 Dx+iCcb+pRTurJGZorposNGte7oxronWitjgsmr7dFcVs=

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

Fixes: fbb64eedf5a3 ("ALSA: emu10k1: make E-MU dock monitoring interrupt-dr=
iven")
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

