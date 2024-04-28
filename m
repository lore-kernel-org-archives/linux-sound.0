Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FE754F92
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297047; cv=none; b=df4xO0YTPwxyNtFOx5vc7ked7pmgLzJU+F5Ng0XFe528V958VgQBbdPhV1shjsEPAgWkYiQvRzPCkN/2O1zFwTn3YByJg5FU17qHHiDX3Xv8gwttmwC3msRSBeDL2yD5DHK9/GVjqKU1ITaFN49ORb9fBGMfablAstK7UizYmYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297047; c=relaxed/simple;
	bh=Wzv4gj0mV9Z58lx920WEk0lWIzjM971IT7wlVNeuh88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MtB3q2DnFtRzYds6B33irdFOlpCARUQxqjrRnCWaeQ0TcUUWFDLl7iwL2hvgOvCItb2mJeeKCdD00FIcHnlpDMQPmRzqyjhfLxvY+DCIdZ/MsOQvPKl4i2nW+TpsN+GTFAvNNUwr2p006trSCT6IyLpbsR/IJl29agCG999080w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=mgYqIPcG; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="mgYqIPcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297037; x=1714901837;
	i=oswald.buddenhagen@gmx.de;
	bh=fGHERi1PjWp+/PQ5g1r8VQ2KTJJr7IvUwf0ttM0VbIE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mgYqIPcGH629HjkK63IXN31XVBck/4XSIRBjOcuTAidCTtmbodnQuIhhjgKDDNCu
	 CpJ+Fqh3abWhUKJrtNsNn+ijzLKeO8cbnsOUm9lraYWlwQJSmzX70f9w1jOrFJiRS
	 h0BOec50r0kPIZgdj2EygLKvEclT9EVkdFlaBWD68fGOCcmfNdorTuS+i8tJdvu27
	 ogoQbN26eWn+CdBs9q4qOP0CQNuTiivxa5VHMTd6MlPDsxxPmGYNuOQdbkny29/aX
	 5D6g5TM9EM3p2IKvsoXamoAlX4I/TkBG/T8kiZZkJC+6KisjFcn0SR3xm9vHC184u
	 FUdTL4QPm97bmddm8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFvp-1rrQjI0fAL-00AHjH; Sun, 28
 Apr 2024 11:37:17 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yC-Q7n-00; Sun, 28 Apr 2024 11:37:16 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 2/6] ALSA: emu10k1: factor out snd_emu1010_load_dock_firmware()
Date: Sun, 28 Apr 2024 11:37:12 +0200
Message-ID: <20240428093716.3198666-3-oswald.buddenhagen@gmx.de>
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
X-Provags-ID: V03:K1:8KEv9t2mHzAHEkx7SPIwS6SQmhAl8YsEzbvbRkzdsIXl6TFm7T4
 nAh2n9cT+FwXqV+tS0csmo7ISOO6htmnXIrerQVvI28BvpCsjRW+LE+Sf0o25bspAOOuQNH
 E2xLI8TUIm79AGqOEfHJotriCO9ERq33psjNv/a63Gqeb0OtUL1PBPTcdmaae13S+aH6Ik4
 CtJP95mpm7iMrqYzukSIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uWplMJV8fAI=;nr5G/Z419vIXtuZaqCAbu2dgUmg
 rrSc9euPlePqUp8p4SC86z5NwmVI1BExd8uNc+/IT5pqxbzFLf7B1xmctSaG5m8jKmW+uNAZG
 J1lqPRqeupCUCt1uAE0gC6TS5qvFyLgC5SAf+teGjVA5EZrGGR+Demz4hv7ii4oM7CxT4mqKc
 JI5HMCDDzh2Cutywl3jOkFgb/KDKdgNRn+TBxxsn7k5NpIJRk9r3IAsFZY7A/gyXjQPq/e8Ux
 uxo+Fb0BUhBVG0S487xBRQrEPnAPosp9pXjjR9+WLV6+zeQGkR2HSHWB3v7l51BwRYAKcz0uM
 x2HM4fBuPr/u1R+uuEJ3ttuTK/ujTYqnwsVUf0W5DL08SpuOi+59eIeC7FdGtZuN6OGBwAEXR
 l1vwnN2UyGxqQQsnUUTrtBb+IfG2sG+Zjdx3JhnRxFS0h+uEBEfiryY+o8mKHN3vxd+tlZOaI
 aX7Z6ufiljaLrbVMhhWAOxn1S6P4yW4x2eNapmOXqkarUcUqKnOrCh9PCR9Nv4Nd3hkdcUysr
 V4k9OMyEpSRF5el+CW4NH+aoz4IOnaWX22ospj8+1dcJpwTUiKEiBUqSvO2AS0oiOyfz9cEOQ
 Z0QzcDWVxtR+o45lRuc8BWJzDIW884wXH2pSn7E5lPeZD3EMFNiT5XgdHvP26S4Ep5swxYYJh
 dz1kVaclgk8JjcIUscaaomIpGOHuY4NqVkT5jJfQkrrlOdNyOii89TOarjw5UtLQYB0ca8TsW
 0DLHkIkZX34k6cAZpCPyO/a7m/GT9FkRU+TlymM1J4r8gtvONCXdNf0FdFMHfjC395v3Bd2wd
 0cZq6JmDbXPbOJcKgsNwR5KrNbo96VWPkOfcKUe3GeT6g=

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

