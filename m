Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477BD28DDF
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732442; cv=none; b=LU9qnSTvL+YXrK7XG//kJy2CpzC34lQsI2mMfE6ri0OP/kbtJFcEnuTTb3Wq7rDujxiX2kfyu66RAPjpq2cIHj9PuRoW20SiaA4hMoGNokrsOVHD6XArf4R99Gm27ExunACxQXwHdvkMjOEB4LxsWobFwQykO0qVGoVAH+grWBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732442; c=relaxed/simple;
	bh=Wzv4gj0mV9Z58lx920WEk0lWIzjM971IT7wlVNeuh88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5aD830TVgRN+C6iJPqTlRPCMLBqa804JKOjuPdnNrTHFzuvUxC91dwAkX2cCjHh7f6Ax/aGF/AWgml8q1ChveBTJdbmp6L2g5fot3Dwlu0l21a9JQMKDKxymTHZCrWxnvlwflskW5aZQ9pkSl0RqqEiqiHixJUaWTI1ETcxFps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=K//kvURR; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="K//kvURR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=fGHERi1PjWp+/PQ5g1r8VQ2KTJJr7IvUwf0ttM0VbIE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=K//kvURRx94QHacYtWcHRzDaIMtFwUP6JPlBoIieTMILWJMBBlxLHWEWeTK3dTWy
	 eHCbzf+Yl63RTBzvs/HO66U6YQzO8z52FtnzX1DvlrDv9O8wxUb4dOVHrIsW3Qpct
	 zS3S09pT6JSlcRa+FN0nWuOcgH/LDDg3qdGtqoJLPtwjxhUmkKumyftNkdmbm/NaJ
	 rJXkSih8/QQiswL7JlcPJjI0rdJJ1JHXQeVGiyYKQIArRIbN4qCLdWkoTnWHr48Ob
	 r+yyix3LaXWsUqccFj1mQH2KlMygkRNF8FB/53zYJ0Oj6z5j55OrGGqrVXxPZor6l
	 /0OxCFg690tTfUMA4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1s6FK41gW4-00RZEe; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RAR-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 02/10] ALSA: emu10k1: factor out snd_emu1010_load_dock_firmware()
Date: Sun, 21 Apr 2024 22:46:59 +0200
Message-ID: <20240421204707.2487686-3-oswald.buddenhagen@gmx.de>
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
X-Provags-ID: V03:K1:lzRmMXKvuAPxzy7yK/00zyx9iZDYPP/0dRUDDVgK8kR7pVeEyO3
 k9zQjUX/O/IAi5qCfr/ePTxpNDQ+oVnO38BzDWsl45cnU/h7SkJri1CK5tDn6Fm4g3svVVb
 LgA+scE3nY1x9qU3lhraUzKh+KUor53aOWzuAdo9JgDf6j/a6LijTx4Xdf8l8Zwwp5dF1IS
 ViWhiuzxKcHjaRNez+NLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JWYWFZmZNd0=;L7aaOFHLjIw8Wdd0FuCixcZS1r9
 zbW7cxjmD2aakfbqPIkVcqNYD/AlX32TpeVGQOh/RntyW/1092AgU5hzTDGKa13JbpgwDpSSi
 Ue1C/cL83RrXAo6CY8pHBTCh19N79OCdnJ1Rq3P05iitcGDmaCfaL0dwtnFw/7p3RrRmOmcE6
 GNjDoSwvLCzo657t3IJ/EPylW/sqB9mx3yc4w3H5mHuXUlmSCrgmtbar97BQUxfoefh0Pji9X
 rOYFEmfxylCvbmujQsUWgXbxcdWOjNRL7UPfrMpalN96p9LSxW/31ng3XUzQp0CXsHkFQtbRg
 lRwj8SdEKtsU7cDh7WUetIliFWdukjbTp0emXMn4LDtUazdEugRvqI8lZluRY9oIs7IFTSMWM
 b6/Y6mOf/rPkHlom7Wrk4JUb3B5hPHnoog7WUz0xl3s0Rd1tD0IQdYus8FhN9VjsiDnLTVUWL
 TgJSxDMwrEW2h+gLp1e88Wn7Y79xVANkO6RzKIko3BxipONCx5VK5JeKSCc8YHKtTFazYeTuV
 BeJV/WkxlVdPhTbxw6k/E3EiMeJntmRhXxUuEPDPxIJtUJSGI+/lSYAP27ujTKlgdzCreGH2d
 C5daHC3ugD3GWphX3/CPYNFOd6GorhST7ljIIG1yAAPambQ9HHjjgRprhGzKuOh3U4UhKOaVr
 dD2ruAQ3XhrGlAuar7kjjLLiZPBJUyX3ldkXQB43+0IPqJ/zRSxgRuo07098rMywtAArSF7Ja
 LygrpHSrv9CXjBAGMJ6ryaeBNYxkPxJQBTgFLQkqfxvgwKJItFSpLGgaK0wbKU+vnxS61nngi
 tmcGf9TzePlx/YGQoLIeYHRuYADxVs7v7nYJe+ydsiAPU=

Pulled out of the next patch to improve its legibility.

As the function is now available, call it directly from
snd_emu10k1_emu1010_init(), thus making the MicroDock firmware loading
synchronous - there isn't really a reason not to. Note that this does
not affect the AudioDocks of rev1 cards, as these have no independent
power supplies, and thus come up only a while after the main card is
initialized.

As a drive-by, adjust the priorities of two messages to better reflect
their impact.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 66 +++++++++++++++++---------------
 1 file changed, 36 insertions(+), 30 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index 85f70368a27d..6265fc9ae260 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -732,11 +732,43 @@ static int snd_emu1010_load_firmware(struct snd_emu10=
k1 *emu, int dock,
 	return snd_emu1010_load_firmware_entry(emu, *fw);
 }
=20
+static void snd_emu1010_load_dock_firmware(struct snd_emu10k1 *emu)
+{
+	u32 tmp, tmp2;
+	int err;
+
+	dev_info(emu->card->dev, "emu1010: Loading Audio Dock Firmware\n");
+	/* Return to Audio Dock programming mode */
+	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
+			       EMU_HANA_FPGA_CONFIG_AUDIODOCK);
+	err =3D snd_emu1010_load_firmware(emu, 1, &emu->dock_fw);
+	if (err < 0)
+		return;
+	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG, 0);
+
+	snd_emu1010_fpga_read(emu, EMU_HANA_ID, &tmp);
+	dev_dbg(emu->card->dev, "emu1010: EMU_HANA+DOCK_ID =3D 0x%x\n", tmp);
+	if ((tmp & 0x1f) !=3D 0x15) {
+		/* FPGA failed to be programmed */
+		dev_err(emu->card->dev,
+			"emu1010: Loading Audio Dock Firmware failed, reg =3D 0x%x\n",
+			tmp);
+		return;
+	}
+	dev_info(emu->card->dev, "emu1010: Audio Dock Firmware loaded\n");
+
+	snd_emu1010_fpga_read(emu, EMU_DOCK_MAJOR_REV, &tmp);
+	snd_emu1010_fpga_read(emu, EMU_DOCK_MINOR_REV, &tmp2);
+	dev_info(emu->card->dev, "Audio Dock ver: %u.%u\n", tmp, tmp2);
+
+	/* Allow DLL to settle, to sync clocking between 1010 and Dock */
+	msleep(10);
+}
+
 static void emu1010_firmware_work(struct work_struct *work)
 {
 	struct snd_emu10k1 *emu;
-	u32 tmp, tmp2, reg;
-	int err;
+	u32 reg;
=20
 	emu =3D container_of(work, struct snd_emu10k1,
 			   emu1010.firmware_work);
@@ -749,33 +781,7 @@ static void emu1010_firmware_work(struct work_struct *=
work)
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg); /* OPTIONS: Whic=
h cards are attached to the EMU */
 	if (reg & EMU_HANA_OPTION_DOCK_OFFLINE) {
 		/* Audio Dock attached */
-		/* Return to Audio Dock programming mode */
-		dev_info(emu->card->dev,
-			 "emu1010: Loading Audio Dock Firmware\n");
-		snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
-				       EMU_HANA_FPGA_CONFIG_AUDIODOCK);
-		err =3D snd_emu1010_load_firmware(emu, 1, &emu->dock_fw);
-		if (err < 0)
-			return;
-		snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG, 0);
-		snd_emu1010_fpga_read(emu, EMU_HANA_ID, &tmp);
-		dev_info(emu->card->dev,
-			 "emu1010: EMU_HANA+DOCK_ID =3D 0x%x\n", tmp);
-		if ((tmp & 0x1f) !=3D 0x15) {
-			/* FPGA failed to be programmed */
-			dev_info(emu->card->dev,
-				 "emu1010: Loading Audio Dock Firmware file failed, reg =3D 0x%x\n",
-				 tmp);
-			return;
-		}
-		dev_info(emu->card->dev,
-			 "emu1010: Audio Dock Firmware loaded\n");
-		snd_emu1010_fpga_read(emu, EMU_DOCK_MAJOR_REV, &tmp);
-		snd_emu1010_fpga_read(emu, EMU_DOCK_MINOR_REV, &tmp2);
-		dev_info(emu->card->dev, "Audio Dock ver: %u.%u\n", tmp, tmp2);
-		/* Sync clocking between 1010 and Dock */
-		/* Allow DLL to settle */
-		msleep(10);
+		snd_emu1010_load_dock_firmware(emu);
 		/* Unmute all. Default is muted after a firmware load */
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
 	} else if (!(reg & EMU_HANA_OPTION_DOCK_ONLINE)) {
@@ -892,7 +898,7 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 =
*emu)
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg);
 	dev_info(emu->card->dev, "emu1010: Card options =3D 0x%x\n", reg);
 	if (reg & EMU_HANA_OPTION_DOCK_OFFLINE)
-		schedule_work(&emu->emu1010.firmware_work);
+		snd_emu1010_load_dock_firmware(emu);
 	if (emu->card_capabilities->no_adat) {
 		emu->emu1010.optical_in =3D 0; /* IN_SPDIF */
 		emu->emu1010.optical_out =3D 0; /* OUT_SPDIF */
--=20
2.44.0.701.g2cf7baacf3.dirty

