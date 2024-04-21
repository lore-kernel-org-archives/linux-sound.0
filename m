Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAAD3FBA4
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732443; cv=none; b=W2VC2wRuvpaOzvoIn2s/VUHFC2S2KJs/acqZS3KGIWJiaGkqbJXzd8Aw7wOr7/paiK6K+BqVNyMCViIQ8R3HKkVPapCGykvVC/OaCUq1M3r8f/le6M5B2M4HQqQHfy9QRX5VwfK1q/lcmc3+l+wIROAsQSstSpRyptjYWTP371U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732443; c=relaxed/simple;
	bh=6Whqz2ZCi/Ix53tWYVXjN7jsXzfFy3B7urkt8bRKw2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfb50qNB8Gc7jWo2E1LNDzVs7u83GEcb3HlLelMNssdtXaTM7UosP3VhmLkN63UYz3oPwAwBEKwC1BN0tFPoOE9cEvbhtd/yIfJ/xDgl+36CL5w+8z2z8E0qBVkZZry+GVQSYOgrdiq4chYlnr2E9Wd9jiAVKYhpXdf+I8lekIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=djwogqDN; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="djwogqDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=3uuDPCjnGjcfwNPYols0Uc2AljpaqiCPqPtNjipgA5Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=djwogqDNT4A5h7rAj/1rOPQ77dlsRcGeT6zyPynOHqcrV3zqs/pUgFINcFg6xmrp
	 WWnO9lNZ+XrspA4v2II5iyBTnd5KEXX2GMEss014INyn0MesJXS72hzHswnAPzoAX
	 R2T4ihkj9j3lGxEQRJIRbO32BDrbFsoWQHLnjWU2IxoRXdiJ1diKas5vaKZUVy0AX
	 CI2qLN54JV1dfex5GGHG9FTl49xEdtJRxDokPs7ivE2xVIgH1jD9uMqyeg/ef2J2I
	 IC/aluD2y4GBdZFC2lST9uIJeo4T/5LXEat09kAC2MOW7XQEXbZT6YkjA9KATid8E
	 mvEDiYUgR0KRLWAzNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD6W-1scuas1pNy-00eLF6; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RAb-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 04/10] ALSA: emu10k1: use mutex for E-MU FPGA access locking
Date: Sun, 21 Apr 2024 22:47:01 +0200
Message-ID: <20240421204707.2487686-5-oswald.buddenhagen@gmx.de>
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
X-Provags-ID: V03:K1:UFstLwnbmHKfj/phvzzriFbs3jEJFZEs7oCY9KUqRTNeSs4wR7y
 5nXbDPBmHJZEsJpXg1x7EqwfCTUYSCHon44AN0OOtCzjmHH/DQaLczBm9KiuOHz/Ri8cDhj
 Xw/kqSYfY9lQhVG7HeVuc3FPA0kuPNK/+n0jQGI0YOXIPCZxga0vIILah9LpbF3zHizYJpW
 sw4RV3UtxnnKtMioSKrXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JI1PEVlgxtY=;LdVBGtfLzEHJshv6AE8Yb5olYrm
 gIqXqozQVD39BUC8wgcLy9RnhgqEoRZaLp5hjinCPxYyOoLMULQtzRO4bHKr344a9OFizQO/7
 rn2pLISoFL/8sRhjvL88Ea6+4P01NqUtP75Z6UX+gJ2jN15BgW0r/GiMAnJDY+kCiYWYq8iyr
 upNEvG9DfGCCux9EWcbeCgf0v/nq2Dfq24bwaGS3aEEp2EoI0FlgQeBOjMQZmmL1HsurbTMxg
 NdMeX3m1a1qoE709B0X13HrrkqLKk8VTVlXg3MHHxOTRq6v5dr6+p87eWxc+fqOe3oOEJQ9r0
 iUHDCuUedlwgw+wys/J2FMPIkCaYIKqgkR7w7n3H8AbRBJOMoGUcrvlbsd+9Vo0tXMKPhfJZt
 PfiwpoNQPZJLRNk6vfeOoLtmhA6LWhme88jaTBAl2IMtNKVQvR3UoHD4zDgEGiiREnFMtnLb5
 Ee6SPdlTU9WEs5vyPCsrJcRjdTQrIxC2K2VIeiuQ4n2MGDxSg1wUwcey3b5RL+UnbAZ0XMCHo
 HZGzCUAhtFSlDg2t++KvDOLEBeETEE2MptwQNLfqZRXiiP4jVgq4GPaZS6cWV41yp1CpDM5Xx
 9mXCwZCOiC6v71f8bm5aldWz4jCwXM5zy1y2SuGSC3Yw7Tk2eU3ZXnDx6czwqIAdVBz4hiYkx
 oKCjbir6AOPKKA2UWtGB2cce+2hD4QcAtL3Sp5BBjS1grFHq3YbhpD82ca3CsS4zWHOPqjssp
 gm2jmVi1TxQJ7lUzxBAJby6Y+xyb8csUaEKH5YuJK3Hs1f9cvJ2vGT3cxMByoFAhFTmx0eVbX
 XPjfUi6yZs6OEtLAYEdnZd5CN7wI0dSTH/rJQGez+qnaw=

The FPGA access through the GPIO port does not interfere with other
sound processor register access, so there is no need to subject it to
emu_lock. And after moving all FPGA access out of the interrupt handler,
it does not need to be IRQ-safe, either.

What's more, attaching the dock causes a firmware upload, which takes
several seconds. We really don't want to disable IRQs for this long, and
even less also have someone else spin with IRQs disabled waiting for us.

Therefore, use a mutex for FPGA access locking.

This makes the code somewhat more noisy, as we need to wrap bigger
sections into the mutex, as it needs to enclose the spinlocks.

The latter has the "side effect" of fixing dock FPGA programming in a
corner case: a really badly timed mixer access right between entering
FPGA programming mode and uploading the netlist would mess up the
protocol.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |  4 +++
 sound/pci/emu10k1/emu10k1_main.c | 19 +++++++++---
 sound/pci/emu10k1/emumixer.c     | 18 ++++++++----
 sound/pci/emu10k1/emuproc.c      |  9 ++++++
 sound/pci/emu10k1/io.c           | 50 ++++++++++++++------------------
 5 files changed, 62 insertions(+), 38 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 9cc10fab01a8..234b5baea69c 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1685,6 +1685,7 @@ struct snd_emu1010 {
 	unsigned int optical_in; /* 0:SPDIF, 1:ADAT */
 	unsigned int optical_out; /* 0:SPDIF, 1:ADAT */
 	struct work_struct work;
+	struct mutex lock;
 };
=20
 struct snd_emu10k1 {
@@ -1833,6 +1834,9 @@ unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k=
1 * emu, unsigned int reg,
 void snd_emu10k1_ptr20_write(struct snd_emu10k1 *emu, unsigned int reg, un=
signed int chn, unsigned int data);
 int snd_emu10k1_spi_write(struct snd_emu10k1 * emu, unsigned int data);
 int snd_emu10k1_i2c_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
+static inline void snd_emu1010_fpga_lock(struct snd_emu10k1 *emu) { mutex_=
lock(&emu->emu1010.lock); };
+static inline void snd_emu1010_fpga_unlock(struct snd_emu10k1 *emu) { mute=
x_unlock(&emu->emu1010.lock); };
+void snd_emu1010_fpga_write_lock(struct snd_emu10k1 *emu, u32 reg, u32 val=
ue);
 void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
 void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value);
 void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst,=
 u32 src);
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index 86eaf5963502..1a2905e8672b 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -810,15 +810,19 @@ static void emu1010_work(struct work_struct *work)
 		return;
 #endif
=20
+	snd_emu1010_fpga_lock(emu);
+
 	snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &sts);
=20
 	// The distinction of the IRQ status bits is unreliable,
 	// so we dispatch later based on option card status.
 	if (sts & (EMU_HANA_IRQ_DOCK | EMU_HANA_IRQ_DOCK_LOST))
 		emu1010_dock_event(emu);
=20
 	if (sts & EMU_HANA_IRQ_WCLK_CHANGED)
 		emu1010_clock_event(emu);
+
+	snd_emu1010_fpga_unlock(emu);
 }
=20
 static void emu1010_interrupt(struct snd_emu10k1 *emu)
@@ -852,6 +856,8 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 =
*emu)
 	 * Proper init follows in snd_emu10k1_init(). */
 	outl(HCFG_LOCKSOUNDCACHE | HCFG_LOCKTANKCACHE_MASK, emu->port + HCFG);
=20
+	snd_emu1010_fpga_lock(emu);
+
 	/* Disable 48Volt power to Audio Dock */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, 0);
=20
@@ -877,17 +883,18 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k=
1 *emu)
 	err =3D snd_emu1010_load_firmware(emu, 0, &emu->firmware);
 	if (err < 0) {
 		dev_info(emu->card->dev, "emu1010: Loading Firmware failed\n");
-		return err;
+		goto fail;
 	}
=20
 	/* ID, should read & 0x7f =3D 0x55 when FPGA programmed. */
 	snd_emu1010_fpga_read(emu, EMU_HANA_ID, &reg);
 	if ((reg & 0x3f) !=3D 0x15) {
 		/* FPGA failed to be programmed */
 		dev_info(emu->card->dev,
 			 "emu1010: Loading Hana Firmware file failed, reg =3D 0x%x\n",
 			 reg);
-		return -ENODEV;
+		err =3D -ENODEV;
+		goto fail;
 	}
=20
 	dev_info(emu->card->dev, "emu1010: Hana Firmware loaded\n");
@@ -947,7 +954,9 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 =
*emu)
 	// so it is safe to simply enable the outputs.
 	snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
=20
-	return 0;
+fail:
+	snd_emu1010_fpga_unlock(emu);
+	return err;
 }
 /*
  *  Create the EMU10K1 instance
@@ -969,9 +978,10 @@ static void snd_emu10k1_free(struct snd_card *card)
 	}
 	if (emu->card_capabilities->emu_model =3D=3D EMU_MODEL_EMU1010) {
 		/* Disable 48Volt power to Audio Dock */
-		snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, 0);
+		snd_emu1010_fpga_write_lock(emu, EMU_HANA_DOCK_PWR, 0);
 	}
 	cancel_work_sync(&emu->emu1010.work);
+	mutex_destroy(&emu->emu1010.lock);
 	release_firmware(emu->firmware);
 	release_firmware(emu->dock_fw);
 	snd_util_memhdr_free(emu->memhdr);
@@ -1551,6 +1561,7 @@ int snd_emu10k1_create(struct snd_card *card,
 	emu->synth =3D NULL;
 	emu->get_synth_voice =3D NULL;
 	INIT_WORK(&emu->emu1010.work, emu1010_work);
+	mutex_init(&emu->emu1010.lock);
 	/* read revision & serial */
 	emu->revision =3D pci->revision;
 	pci_read_config_dword(pci, PCI_SUBSYSTEM_VENDOR_ID, &emu->serial);
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 0a32ea53d8c6..05b98d9b547b 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -661,7 +661,9 @@ static int snd_emu1010_output_source_put(struct snd_kco=
ntrol *kcontrol,
 	change =3D (emu->emu1010.output_source[channel] !=3D val);
 	if (change) {
 		emu->emu1010.output_source[channel] =3D val;
+		snd_emu1010_fpga_lock(emu);
 		snd_emu1010_output_source_apply(emu, channel, val);
+		snd_emu1010_fpga_unlock(emu);
 	}
 	return change;
 }
@@ -705,7 +707,9 @@ static int snd_emu1010_input_source_put(struct snd_kcon=
trol *kcontrol,
 	change =3D (emu->emu1010.input_source[channel] !=3D val);
 	if (change) {
 		emu->emu1010.input_source[channel] =3D val;
+		snd_emu1010_fpga_lock(emu);
 		snd_emu1010_input_source_apply(emu, channel, val);
+		snd_emu1010_fpga_unlock(emu);
 	}
 	return change;
 }
@@ -774,7 +778,7 @@ static int snd_emu1010_adc_pads_put(struct snd_kcontrol=
 *kcontrol, struct snd_ct
 		cache =3D cache & ~mask;
 	change =3D (cache !=3D emu->emu1010.adc_pads);
 	if (change) {
-		snd_emu1010_fpga_write(emu, EMU_HANA_ADC_PADS, cache );
+		snd_emu1010_fpga_write_lock(emu, EMU_HANA_ADC_PADS, cache );
 	        emu->emu1010.adc_pads =3D cache;
 	}
=20
@@ -832,7 +836,7 @@ static int snd_emu1010_dac_pads_put(struct snd_kcontrol=
 *kcontrol, struct snd_ct
 		cache =3D cache & ~mask;
 	change =3D (cache !=3D emu->emu1010.dac_pads);
 	if (change) {
-		snd_emu1010_fpga_write(emu, EMU_HANA_DAC_PADS, cache );
+		snd_emu1010_fpga_write_lock(emu, EMU_HANA_DAC_PADS, cache );
 	        emu->emu1010.dac_pads =3D cache;
 	}
=20
@@ -980,6 +984,7 @@ static int snd_emu1010_clock_source_put(struct snd_kcon=
trol *kcontrol,
 	val =3D ucontrol->value.enumerated.item[0] ;
 	if (val >=3D emu_ci->num)
 		return -EINVAL;
+	snd_emu1010_fpga_lock(emu);
 	spin_lock_irq(&emu->reg_lock);
 	change =3D (emu->emu1010.clock_source !=3D val);
 	if (change) {
@@ -996,6 +1001,7 @@ static int snd_emu1010_clock_source_put(struct snd_kco=
ntrol *kcontrol,
 	} else {
 		spin_unlock_irq(&emu->reg_lock);
 	}
+	snd_emu1010_fpga_unlock(emu);
 	return change;
 }
=20
@@ -1041,7 +1047,7 @@ static int snd_emu1010_clock_fallback_put(struct snd_=
kcontrol *kcontrol,
 	change =3D (emu->emu1010.clock_fallback !=3D val);
 	if (change) {
 		emu->emu1010.clock_fallback =3D val;
-		snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, 1 - val);
+		snd_emu1010_fpga_write_lock(emu, EMU_HANA_DEFCLOCK, 1 - val);
 	}
 	return change;
 }
@@ -1093,7 +1099,7 @@ static int snd_emu1010_optical_out_put(struct snd_kco=
ntrol *kcontrol,
 		emu->emu1010.optical_out =3D val;
 		tmp =3D (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : EMU_HANA_O=
PTICAL_IN_SPDIF) |
 			(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : EMU_HANA_OPTICA=
L_OUT_SPDIF);
-		snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
+		snd_emu1010_fpga_write_lock(emu, EMU_HANA_OPTICAL_TYPE, tmp);
 	}
 	return change;
 }
@@ -1144,7 +1150,7 @@ static int snd_emu1010_optical_in_put(struct snd_kcon=
trol *kcontrol,
 		emu->emu1010.optical_in =3D val;
 		tmp =3D (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : EMU_HANA_O=
PTICAL_IN_SPDIF) |
 			(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : EMU_HANA_OPTICA=
L_OUT_SPDIF);
-		snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
+		snd_emu1010_fpga_write_lock(emu, EMU_HANA_OPTICAL_TYPE, tmp);
 	}
 	return change;
 }
@@ -2323,7 +2329,9 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		for (i =3D 0; i < emu_ri->n_outs; i++)
 			emu->emu1010.output_source[i] =3D
 				emu1010_map_source(emu_ri, emu_ri->out_dflts[i]);
+		snd_emu1010_fpga_lock(emu);
 		snd_emu1010_apply_sources(emu);
+		snd_emu1010_fpga_unlock(emu);
=20
 		kctl =3D emu->ctl_clock_source =3D snd_ctl_new1(&snd_emu1010_clock_sourc=
e, emu);
 		err =3D snd_ctl_add(card, kctl);
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 2f80fd91017c..737c28d31b41 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -165,6 +165,8 @@ static void snd_emu10k1_proc_spdif_read(struct snd_info=
_entry *entry,
 	u32 value2;
=20
 	if (emu->card_capabilities->emu_model) {
+		snd_emu1010_fpga_lock(emu);
+
 		// This represents the S/PDIF lock status on 0404b, which is
 		// kinda weird and unhelpful, because monitoring it via IRQ is
 		// impractical (one gets an IRQ flood as long as it is desynced).
@@ -197,6 +199,8 @@ static void snd_emu10k1_proc_spdif_read(struct snd_info=
_entry *entry,
 			snd_iprintf(buffer, "\nS/PDIF mode: %s%s\n",
 				    value & EMU_HANA_SPDIF_MODE_RX_PRO ? "professional" : "consumer",
 				    value & EMU_HANA_SPDIF_MODE_RX_NOCOPY ? ", no copy" : "");
+
+		snd_emu1010_fpga_unlock(emu);
 	} else {
 		snd_emu10k1_proc_spdif_status(emu, buffer, "CD-ROM S/PDIF In", CDCS, CDS=
RCS);
 		snd_emu10k1_proc_spdif_status(emu, buffer, "Optical or Coax S/PDIF In", =
GPSCS, GPSRCS);
@@ -458,6 +462,9 @@ static void snd_emu_proc_emu1010_reg_read(struct snd_in=
fo_entry *entry,
 	struct snd_emu10k1 *emu =3D entry->private_data;
 	u32 value;
 	int i;
+
+	snd_emu1010_fpga_lock(emu);
+
 	snd_iprintf(buffer, "EMU1010 Registers:\n\n");
=20
 	for(i =3D 0; i < 0x40; i+=3D1) {
@@ -496,6 +503,8 @@ static void snd_emu_proc_emu1010_reg_read(struct snd_in=
fo_entry *entry,
 			snd_emu_proc_emu1010_link_read(emu, buffer, 0x701);
 		}
 	}
+
+	snd_emu1010_fpga_unlock(emu);
 }
=20
 static void snd_emu_proc_io_reg_read(struct snd_info_entry *entry,
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 74df2330015f..f3260a81e47b 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -289,71 +289,63 @@ static void snd_emu1010_fpga_write_locked(struct snd_=
emu10k1 *emu, u32 reg, u32
=20
 void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	if (snd_BUG_ON(!mutex_is_locked(&emu->emu1010.lock)))
+		return;
 	snd_emu1010_fpga_write_locked(emu, reg, value);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
=20
-static void snd_emu1010_fpga_read_locked(struct snd_emu10k1 *emu, u32 reg,=
 u32 *value)
+void snd_emu1010_fpga_write_lock(struct snd_emu10k1 *emu, u32 reg, u32 val=
ue)
+{
+	snd_emu1010_fpga_lock(emu);
+	snd_emu1010_fpga_write_locked(emu, reg, value);
+	snd_emu1010_fpga_unlock(emu);
+}
+
+void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)
 {
 	// The higest input pin is used as the designated interrupt trigger,
 	// so it needs to be masked out.
 	// But note that any other input pin change will also cause an IRQ,
 	// so using this function often causes an IRQ as a side effect.
 	u32 mask =3D emu->card_capabilities->ca0108_chip ? 0x1f : 0x7f;
+
+	if (snd_BUG_ON(!mutex_is_locked(&emu->emu1010.lock)))
+		return;
 	if (snd_BUG_ON(reg > 0x3f))
 		return;
 	reg +=3D 0x40; /* 0x40 upwards are registers. */
 	outw(reg, emu->port + A_GPIO);
 	udelay(10);
 	outw(reg | 0x80, emu->port + A_GPIO);  /* High bit clocks the value into =
the fpga. */
 	udelay(10);
 	*value =3D ((inw(emu->port + A_GPIO) >> 8) & mask);
 }
=20
-void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&emu->emu_lock, flags);
-	snd_emu1010_fpga_read_locked(emu, reg, value);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
-}
-
 /* Each Destination has one and only one Source,
  * but one Source can feed any number of Destinations simultaneously.
  */
 void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst,=
 u32 src)
 {
-	unsigned long flags;
-
 	if (snd_BUG_ON(dst & ~0x71f))
 		return;
 	if (snd_BUG_ON(src & ~0x71f))
 		return;
-	spin_lock_irqsave(&emu->emu_lock, flags);
-	snd_emu1010_fpga_write_locked(emu, EMU_HANA_DESTHI, dst >> 8);
-	snd_emu1010_fpga_write_locked(emu, EMU_HANA_DESTLO, dst & 0x1f);
-	snd_emu1010_fpga_write_locked(emu, EMU_HANA_SRCHI, src >> 8);
-	snd_emu1010_fpga_write_locked(emu, EMU_HANA_SRCLO, src & 0x1f);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	snd_emu1010_fpga_write(emu, EMU_HANA_DESTHI, dst >> 8);
+	snd_emu1010_fpga_write(emu, EMU_HANA_DESTLO, dst & 0x1f);
+	snd_emu1010_fpga_write(emu, EMU_HANA_SRCHI, src >> 8);
+	snd_emu1010_fpga_write(emu, EMU_HANA_SRCLO, src & 0x1f);
 }
=20
 u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst)
 {
-	unsigned long flags;
 	u32 hi, lo;
=20
 	if (snd_BUG_ON(dst & ~0x71f))
 		return 0;
-	spin_lock_irqsave(&emu->emu_lock, flags);
-	snd_emu1010_fpga_write_locked(emu, EMU_HANA_DESTHI, dst >> 8);
-	snd_emu1010_fpga_write_locked(emu, EMU_HANA_DESTLO, dst & 0x1f);
-	snd_emu1010_fpga_read_locked(emu, EMU_HANA_SRCHI, &hi);
-	snd_emu1010_fpga_read_locked(emu, EMU_HANA_SRCLO, &lo);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	snd_emu1010_fpga_write(emu, EMU_HANA_DESTHI, dst >> 8);
+	snd_emu1010_fpga_write(emu, EMU_HANA_DESTLO, dst & 0x1f);
+	snd_emu1010_fpga_read(emu, EMU_HANA_SRCHI, &hi);
+	snd_emu1010_fpga_read(emu, EMU_HANA_SRCLO, &lo);
 	return (hi << 8) | lo;
 }
=20
--=20
2.44.0.701.g2cf7baacf3.dirty

