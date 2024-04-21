Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172843AB4
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732444; cv=none; b=o7LULL23npxC84ZiZ8tna2ys8Gam4TMuXmPd9psh3sUvw4aLdwhfzYtF7bHruWOC6o0uC+I6w6loGYpX7IAfbIPglyatYD1d+iHiMrnMImfc5/11OPhS9C4poX+xuo8Ci9DBjBXKKl4s9rGnjS6dAUBuwAYxxDa4Ygg2YnEHWus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732444; c=relaxed/simple;
	bh=IU+PG+RneOji5EdZoWu+0RZx0GbMnwVjSzeMJZf9M+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeVbltqUCgcrHmEd3kg7HKtCu5M1/pcJP7P6wuGKI5Rv/edXw8bPiYZ7WQErPc35nuy6QYwhU0FSYdNMSZ1KUddp8XH9wrCWHmm3DHB0KMSUOZc/IQQTuTmgZUks3FSssMr2lYooHyv/99JgMbbG1vYKiO6NXT2Z3/3RoSniWBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=hQz4eXbQ; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="hQz4eXbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=du77jfe12I26LGTMoaW86jR8Inmqk5T5FAh6IKVv1yE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hQz4eXbQJP/mKC68SHzC/tQvfi9gkklMQT3XN+CYXqf143O5JjemwbkR3I5QZ8jA
	 NdsbBJnP1ARCZOLounIr6pyiJ4lCAT9d46LwM+PKyELMRWoCzRFgK22iGh3gGWoTr
	 V9quezyYYQ1ETCFCbXvR17owFIhmy8trtAVS/mFKeVZCtXs+XTzRQUdFsKNxJVCdp
	 vJEqDdAGSH1EzoOVG+g4kusJm3y7ElmX7MxmLp5abFufliWfVFqstCsA9WdSAaeHd
	 jiHSXcCFyDzK6+lRCffWePVxRGJQDi2mGFPJudWuYAJuo+B0f/10CHGdDkyEl0XEf
	 AMSfgK16N4fP9RuW6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0JW-1sRL4m282S-00kNHQ; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RB0-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 09/10] ALSA: emu10k1: move snd_emu1010_load_firmware_entry() to io.c
Date: Sun, 21 Apr 2024 22:47:06 +0200
Message-ID: <20240421204707.2487686-10-oswald.buddenhagen@gmx.de>
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
X-Provags-ID: V03:K1:yGaAKr4wQ4l4bLwrpddI3gfkli5bniOaEDmX6Zj0cd+O6+OXPYJ
 Vbm/jpQZWrufKToFwnZ5gIeHNUk3eptWvVCOX/ktL1ZslDBjLBWvpgnqxfYfTyyI7imkxPm
 S8rItMImeeXufgEQKXWjb5J2c5K6/8y8fTm4kMwDFqj1cjDm316x+nU98vp1EPJq8Xv49N6
 6hcJ1o/8spsU9L/5oBvgA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fUr+8MYiXsE=;DWzp47uhy4zQLLZEQeiDoM+kFh5
 B9SpK60EjjH9kVt9YzjKCysfqC03EbqroCVGEdpEGDS9TgoQ4fHOR4iqKgUyx7lrzdYDmh9t0
 5fLJxrXM3hrgwhCkyVYQYHPTJR0aPbye3O6ZUoDzl+0PRrQ+oaEhpcUAPHmIimEELmQB1njIH
 0wbR3t9/3PuJz5TCS9Xyg1ijJBzxnI1+dm3JuZLOkKpAB73+8LkYXRQqFLh0GaE1ACfu+DQxi
 zHH7Y2agyYp0rJ1R9un0/Gui0NQhyPV6u+MNiOgKdBBB92KtmrpLqilOAJc4rZoDhbYWocU4E
 Chk68uNWrPqRXQTQhdJo7Rk9DMSZibYmJK3DPrKJFtVdh+WXgIb8JRsBzU+HvcNIrhGvH2ABp
 WeIfViVAvs5v5emjDffxjzMJoR0z9qFzcNjlC1Tj+yV4oWK3qMO7kGX/FmGgPMeCga5YgUnzJ
 /hvujgfAO7SQMSX9DUCUIk3W9G+3yj4zK2aivYIhOEpRoJrv9l32tv9U8naFwARXxXIBQ2c+v
 QsjDoefixOvv6g3VzHkU+mpduLvwC+QiD2IKpLOJr9gRVvk6yEnsfO5Hm4Fq+ui96FOcctoPh
 r2pBc4inlST4Y6H0Fi5sGUAb9Agbu6TGslMEAkavKsWG3zd+ieBIYxO3lQc3lZ++vczQysi68
 C3zfWwNT4wCd0Y0bpuK77XuipxBEFU+DULKpG99X48at9XSi2uIu9Vwreisa9OhvVsMfCesSB
 up3rZQ8z53dwpMm7k37aMXTqwIrvqioFdebR9re2T6madS62zhSNcgRC5Ppul+cm+gLohE0pQ
 LnI1X9TVf9DcdT0VDsl6EfSKaxlNQZdLZbcwoYgy3aoSU=

It is a low-level I/O access function, so io.c is the natural place for
it.

While we're moving the code, reduce the scope of some variables, use
compound assignment operators, and add/adjust some comments.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |  1 +
 sound/pci/emu10k1/emu10k1_main.c | 46 ---------------------------
 sound/pci/emu10k1/io.c           | 53 ++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 46 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 234b5baea69c..b83862259eec 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1843,6 +1843,7 @@ void snd_emu1010_fpga_link_dst_src_write(struct snd_e=
mu10k1 *emu, u32 dst, u32 s
 u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst);
 int snd_emu1010_get_raw_rate(struct snd_emu10k1 *emu, u8 src);
 void snd_emu1010_update_clock(struct snd_emu10k1 *emu);
+void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu, int dock, co=
nst struct firmware *fw_entry);
 unsigned int snd_emu10k1_efx_read(struct snd_emu10k1 *emu, unsigned int pc=
);
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb=
);
 void snd_emu10k1_intr_disable(struct snd_emu10k1 *emu, unsigned int intren=
b);
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index d0f35d346765..5b8a5ba825bd 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -652,52 +652,6 @@ static int snd_emu10k1_cardbus_init(struct snd_emu10k1=
 *emu)
 	return 0;
 }
=20
-static void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu, int d=
ock,
-				     const struct firmware *fw_entry)
-{
-	int n, i;
-	u16 reg;
-	u8 value;
-	__always_unused u16 write_post;
-
-	// If the FPGA is already programmed, return it to programming mode
-	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
-			       dock ? EMU_HANA_FPGA_CONFIG_AUDIODOCK :
-				      EMU_HANA_FPGA_CONFIG_HANA);
-
-	/* The FPGA is a Xilinx Spartan IIE XC2S50E */
-	/* On E-MU 0404b it is a Xilinx Spartan III XC3S50 */
-	/* GPIO7 -> FPGA PGMN
-	 * GPIO6 -> FPGA CCLK
-	 * GPIO5 -> FPGA DIN
-	 * FPGA CONFIG OFF -> FPGA PGMN
-	 */
-	spin_lock_irq(&emu->emu_lock);
-	outw(0x00, emu->port + A_GPIO); /* Set PGMN low for 100uS. */
-	write_post =3D inw(emu->port + A_GPIO);
-	udelay(100);
-	outw(0x80, emu->port + A_GPIO); /* Leave bit 7 set during netlist setup. =
*/
-	write_post =3D inw(emu->port + A_GPIO);
-	udelay(100); /* Allow FPGA memory to clean */
-	for (n =3D 0; n < fw_entry->size; n++) {
-		value =3D fw_entry->data[n];
-		for (i =3D 0; i < 8; i++) {
-			reg =3D 0x80;
-			if (value & 0x1)
-				reg =3D reg | 0x20;
-			value =3D value >> 1;
-			outw(reg, emu->port + A_GPIO);
-			write_post =3D inw(emu->port + A_GPIO);
-			outw(reg | 0x40, emu->port + A_GPIO);
-			write_post =3D inw(emu->port + A_GPIO);
-		}
-	}
-	/* After programming, set GPIO bit 4 high again. */
-	outw(0x10, emu->port + A_GPIO);
-	write_post =3D inw(emu->port + A_GPIO);
-	spin_unlock_irq(&emu->emu_lock);
-}
-
 /* firmware file names, per model, init-fw and dock-fw (optional) */
 static const char * const firmware_names[5][2] =3D {
 	[EMU_MODEL_EMU1010] =3D {
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index f3260a81e47b..9b1b25d5ba74 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -421,6 +421,59 @@ void snd_emu1010_update_clock(struct snd_emu10k1 *emu)
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, leds);
 }
=20
+void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu, int dock,
+				     const struct firmware *fw_entry)
+{
+	__always_unused u16 write_post;
+
+	// On E-MU 1010 rev1 the FPGA is a Xilinx Spartan IIE XC2S50E.
+	// On E-MU 0404b it is a Xilinx Spartan III XC3S50.
+	// The wiring is as follows:
+	// GPO7 -> FPGA input & 1K resistor -> FPGA /PGMN <- FPGA output
+	//   In normal operation, the active low reset line is held up by
+	//   an FPGA output, while the GPO pin performs its duty as control
+	//   register access strobe signal. Writing the respective bit to
+	//   EMU_HANA_FPGA_CONFIG puts the FPGA output into high-Z mode, at
+	//   which point the GPO pin can control the reset line through the
+	//   resistor.
+	// GPO6 -> FPGA CCLK & FPGA input
+	// GPO5 -> FPGA DIN (dual function)
+
+	// If the FPGA is already programmed, return it to programming mode
+	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
+			       dock ? EMU_HANA_FPGA_CONFIG_AUDIODOCK :
+				      EMU_HANA_FPGA_CONFIG_HANA);
+
+	// Assert reset line for 100uS
+	outw(0x00, emu->port + A_GPIO);
+	write_post =3D inw(emu->port + A_GPIO);
+	udelay(100);
+	outw(0x80, emu->port + A_GPIO);
+	write_post =3D inw(emu->port + A_GPIO);
+	udelay(100);  // Allow FPGA memory to clean
+
+	// Upload the netlist. Keep reset line high!
+	for (int n =3D 0; n < fw_entry->size; n++) {
+		u8 value =3D fw_entry->data[n];
+		for (int i =3D 0; i < 8; i++) {
+			u16 reg =3D 0x80;
+			if (value & 1)
+				reg |=3D 0x20;
+			value >>=3D 1;
+			outw(reg, emu->port + A_GPIO);
+			write_post =3D inw(emu->port + A_GPIO);
+			outw(reg | 0x40, emu->port + A_GPIO);
+			write_post =3D inw(emu->port + A_GPIO);
+		}
+	}
+
+	// After programming, set GPIO bit 4 high again.
+	// This appears to be a config word that the rev1 Hana
+	// firmware reads; weird things happen without this.
+	outw(0x10, emu->port + A_GPIO);
+	write_post =3D inw(emu->port + A_GPIO);
+}
+
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb)
 {
 	unsigned long flags;
--=20
2.44.0.701.g2cf7baacf3.dirty

