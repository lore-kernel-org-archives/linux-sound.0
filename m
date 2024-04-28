Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08B979E1
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297047; cv=none; b=cDjCy3FYu417YltSaDgFI2GM4FwiRTE5LBGoEeynsddHmIOIiD+jfjhNOaJTdbvj9772Z2cnlcVT8Iih7n1fGW2HMDjZDC1RZPbqc/JfmhIsYVImwWsYWUC0IJ1qiibZ5ODfJe8JT93mHt4KNvqwKQLHfR0GZ5iZd45cuurj1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297047; c=relaxed/simple;
	bh=Pw7/Sq7a0fRT2V37KZymqzEADXthPFxUNLQTq//mV9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKinJHW5HzJHDbnmPdXkSD2yrJKImCgQaXww+Tj8R/fQ+zE+8ZN+3zxGPwaE5rfpwHOIzIzU9czN63ZUSzENUieEhie2r9j46Y/EXFCZoDtai6AoCbhaqR5Cqcjwm/WDcYu9MXYuYKZS1myIjk3GcEpH5lcaSzBw/Xmbiqkg9w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=pEvu1zi1; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="pEvu1zi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297038; x=1714901838;
	i=oswald.buddenhagen@gmx.de;
	bh=UKOQG/UCIJ9Tvj5eZzBfjFmYvKPDrPkyqUg/JXaktBA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pEvu1zi1fEG16hzyrcIVHNO/g+PZ/TWUSVZ6AKCl5SCR8m281mFPcqxDNhF2UPXE
	 RBePnnLqWQWuvZzUy2qxo7bMq0pLXWvccMQuDRj0Oq0M7KiH4YA3AcJTgsUbGy2wE
	 fCDvRfZPuTO4X19YS6lfmInP3kLwLDkeLrF5cl6RxQd2WW7G1+lQBWDMtgoRtjUaG
	 Rp12jY9ZBo9QkMQ6R2ElkA1aimzZUGOC5KPzj7U6W1BqEDd1saTBItNtRteFTJlFJ
	 62QdbnV77uJ45k4M0yhc89DykAFqNbnwS1Q2oixgww8pPdqM1IwpFx+29nApi7nMD
	 mTAZOIo0nHTvbkUlkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUrx-1suT0Z1cDZ-00zPv8; Sun, 28
 Apr 2024 11:37:18 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yD-Q90-00; Sun, 28 Apr 2024 11:37:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 3/4] ALSA: emu10k1: move snd_emu1010_load_firmware_entry() to io.c
Date: Sun, 28 Apr 2024 11:37:16 +0200
Message-ID: <20240428093717.3198716-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240428093717.3198716-1-oswald.buddenhagen@gmx.de>
References: <20240428093717.3198716-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AeOJoEX1dOF9ZNOgy2s+iU8HmG9Y9Qd2Y8P2mf/QuD4ywkXmdlv
 oLDmeUzL5SJNpF5ndE+I+hDqk+0sp55Dq+p3f74dcRHNmPM8HERDyplfcl7CbMCtpUkkz6+
 IrBxwbCY6sw8ReE+FZjDPVEejVnmVa/T8RMEQAdwO0ZoANB++X0Mwyqd3Zdnz+wR10Vchcd
 PeuBnD6UdVkFF6/BENxAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d+gWKwRv7p0=;6oC6aOmVPb3VJ+sNZayPQtzav7P
 rsesvO3Y/8GBu6il20H/S7CXU3ef4ZhF8kQGQFu8XEbHwTRdSDxR9CllrTDD8C8+Y0dARh6Xg
 AI6fTuB1JrV3e8yq2IwSsH6c/8UswFL01LJz8JGPJZaIWvF6K080DtuIsZqcd7dNCTFFPgyof
 ck9seEUjorPCIQZcrYeBf+5BHIJFXoLB1yXfiUQzwU/0cZWU2Bp9YiBwTZpAAZvTi8M9oJxm3
 YB2iGZSsJjS9YWk5C4UD8PCQw+m1D94hLwJSM1SIhABN/5fd3t2rNmQeGGBXbjZlCfUIe97fN
 xrFQRozGdUzHSq//2aX8queuPFw/0is6y6wiU/ct8mWPtQi9trs36ynu85rmePVHenoOeNoK5
 V5/IKyHrsCOaQ62XOfjQ3F5vhqmjfMsl4zY8LMaWxI3rY4+wnyJGYj+VnAm31sS5eIsDtKIqe
 pC8co6wdYfTaxtrcssV164uzRU7XqL49rdke0StHFV+ypzd1ce08MGjSOK+jPti4tBu/K7m0R
 uug8w3HcMfnftUVgTQlKIcFBg6IzH3pdolq9bHGAaQFf3IB1JCEOfjCIVZ+b97YkzWJ6Y/Dvq
 fgQ10OpxPlvHYiC9z2RwTveskV2drjfTMk/XehbUDB+YrTH6CBu8cK3sWAjrQAues/3BGSl2P
 0JAekUHKUGW6IWV+irvNCc/dGykzXs06yoSfZXZDxlrRI7LClZqz2evWxpCh+JpOtACPbEh8G
 NzuMaoIYkIw+2cm2K0HOajdHkHb6XA6/EQhJ7DEhI7e4UkGRr8hI/9XCAfyeUXog7SjqHAea4
 R5u/fMkEtEsSQsZO1DuHGJ79fg+WUcNmdbOZ/1sfy9i2g=

It is a low-level I/O access function, so io.c is the natural place for
it.

While we're moving the code, reduce the scope of some variables, use
compound assignment operators, and add/adjust some comments.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |  1 +
 sound/pci/emu10k1/emu10k1_main.c | 41 ---------------------------
 sound/pci/emu10k1/io.c           | 48 ++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 41 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 234b5baea69c..2856f4717c93 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1843,6 +1843,7 @@ void snd_emu1010_fpga_link_dst_src_write(struct snd_e=
mu10k1 *emu, u32 dst, u32 s
 u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst);
 int snd_emu1010_get_raw_rate(struct snd_emu10k1 *emu, u8 src);
 void snd_emu1010_update_clock(struct snd_emu10k1 *emu);
+void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu, const struct=
 firmware *fw_entry);
 unsigned int snd_emu10k1_efx_read(struct snd_emu10k1 *emu, unsigned int pc=
);
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb=
);
 void snd_emu10k1_intr_disable(struct snd_emu10k1 *emu, unsigned int intren=
b);
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index ec010971a220..c8aa4143ac4f 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -652,47 +652,6 @@ static int snd_emu10k1_cardbus_init(struct snd_emu10k1=
 *emu)
 	return 0;
 }
=20
-static void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
-				     const struct firmware *fw_entry)
-{
-	int n, i;
-	u16 reg;
-	u8 value;
-	__always_unused u16 write_post;
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
index f4a1c2d4b078..fafa299efa5c 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -422,6 +422,54 @@ void snd_emu1010_update_clock(struct snd_emu10k1 *emu)
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, leds);
 }
=20
+void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
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

