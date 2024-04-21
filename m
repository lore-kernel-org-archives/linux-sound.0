Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6F3FBB2
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732443; cv=none; b=s2Hxb1nUl6GvXx3Zcioai2WI/oJ9Kk2O7ookQWHN6FSDag2v6WjLboldSxrbvJ6sPaOK2tE/urg6VXT3YOl+db0PBFqpegavxNmUgOjfYS1sX0VnX1wGchjxYvM+QnruSCY1sgWLd+SKTQ7iSeM0wrPe3NltApjD2cqs+sGsqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732443; c=relaxed/simple;
	bh=nColKKzV0soArb61v4X9w8QJe/4erO6BS6uJMMwIgVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gT+nkDfqr1CSpaaPqo2RgsA9+odCzIrUu/JdzZQOVWGs4pEZSBgTwYTqRmPMiiL0aNxH69x+X/MQnwjrf43Rke/s1eCBDH77AeCnP6Viu+C7wTbl9TWLC3mqn/lTL2o4QQAVAod+MvJHjBrzcfuuYwMhBEDXQLrXAcY59oVayGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=RPiyGBId; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="RPiyGBId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=1ZmXywRbewDSRLH05bIq+ZhQEmKuuatpJW1xITotxsU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RPiyGBIdmrbGq0Fzn6ohFXu2vNYbI1UGrLOiVEDOhso+9sty+BUGmnN0J/W5bIC4
	 jhkE3H7mMG1AmIncOfOxdHIrQgr2C5AAF0yA0J9s9GnUcSS8VVuEqeXVglLGIwldC
	 XDpYaA3MK/dueuLwkw0vTNwzUU1zsXIHJfkh1FpNM8OPORHmI1R8IO9SlgixT6h6z
	 7kk7ENfLLqf5N6yjk4Mzs3yxWE/1Q5hPz9CYrw56pVTEZj1Poprie1Ku7IplpNeDz
	 GRoEZXOIi8wbnVduXQbpGoScLHZgcvFfVSV9V6FWkTLVbCaHLVthGIzDHsOYqCree
	 t46hkYhEkiIzVvxwRA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS5A-1sRt2c20ug-00kvRg; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RAl-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 06/10] ALSA: emu10k1: simplify E-MU card FPGA reset sequence
Date: Sun, 21 Apr 2024 22:47:03 +0200
Message-ID: <20240421204707.2487686-7-oswald.buddenhagen@gmx.de>
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
X-Provags-ID: V03:K1:WkY8KSUUE/FO7WAAn2uk/KI66pw5EWuG2l+2bL0XJhA9UBtB0FN
 hpSiNV8VfgI8di7Jry0PRzeJWEWlQQBr90Ake1vQk9ex9rHJPd3PpmN3opgx7Bhg0ZY9P/C
 SSFYyjGnUlDjVOgkFBICpiykmSsgzwF8mb+5eP76mNyVW+A9MFLoj/rIR6r5Wy1vEGf/WR2
 UjCEaTcxMyNcArBqQh52w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Qs8OENc7/uM=;OeKdXyLQVu07XgCHCNnOtthojz/
 lxHrzphhD3zkV+MMjDg1lV/ldVvhJ3LTuCZ5wt8xx0TU5Lpbq5Z1oqAqvl7plPGW+IMW8j3E8
 IbW7uJN+JRYOF6N7ZGx2gpEZZ7tQO7KOPGTbUnfntapbBP/A54us5yBXCrs3et3KiGhWThisl
 VjOR/nCLYPSzy5CT7pHSXcEEVFefxq+SiWUFZ06FoLqGEyRLVUr0uYeG/wxZs1y/UqD+6qUpo
 g2hjK4qvWOfV/DEvy/w2gxtWHI3OzpHJQyj5Oa/Abt9oubehqQsAHvzrRRicU803D0oH+zdlr
 gy2VzhKkjnP6G3FVmy5jZAoj7ohnLIWkmjHsrgx62avDM5cTowtcq8vvRlTDImsaaflgXF8gl
 wMj1IXOXRimlpIwY+8trvkqXlb8OurxTskxchqoUzbqzvB/mQY5IU1xyvfeETam3b5j8WdScI
 ROfBvKy5x2ZAyjOhvJXOP+MZZi0iYTbnLRs/gxdyZ/wGmaY8yjFxEP/5h2xXdYM+434wgLRUE
 FyeFEo24I9pk7OAqiSndDl46esMc2DgxmymtatGGEsYQY30Au8xQ9Zt9VeiH+5OP8GIL2A/xp
 ZWvieK92ez1Lb6kn0F3G/uuOX1YlGMOtEMU9RKOwZAfOGHHXx/3g8Cx01pedc+2iw9f59ztkh
 rleLqH3IlM9iaMYp96cUH5FJDCpXlyhi9iUQW/gkuunsmxIUkuQnQW1vt/53PRX1chKl4W8VI
 KN2GnkQQNzFdcQB43x6mZZa1hTh0AGOyodLhqqUsjAp/2joNRWivdzU5uYRvKdtS16F+d87C0
 831uij89ovV+wi+PQiV6kWSLO0qWXdsSotpIAf/ewRWuY=

Firstly, it is pointless to explicitly disable the power to the dock
prior to resetting the FPGA, as the latter will do the former anyway.

Secondly, it doesn't make much sense to check whether the FPGA is
already programmed. It's much simpler to just presume it is, and issue
the self-reset command. If it isn't, the effect isn't worse than the
checks themselves. As a side effect, we lose the info if the reset
fails, but there is no plausible way how that could happen unless the
card burns out while operating, and in that case we'll detect a firmware
upload failure a bit later anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index 8ccc0178360c..353dd3b61c61 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -864,28 +864,9 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1=
 *emu)
=20
 	snd_emu1010_fpga_lock(emu);
=20
-	/* Disable 48Volt power to Audio Dock */
-	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, 0);
-
-	/* ID, should read & 0x7f =3D 0x55. (Bit 7 is the IRQ bit) */
-	snd_emu1010_fpga_read(emu, EMU_HANA_ID, &reg);
-	dev_dbg(emu->card->dev, "reg1 =3D 0x%x\n", reg);
-	if ((reg & 0x3f) =3D=3D 0x15) {
-		/* FPGA netlist already present so clear it */
-		/* Return to programming mode */
-
-		snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG, EMU_HANA_FPGA_CONFIG_H=
ANA);
-	}
-	snd_emu1010_fpga_read(emu, EMU_HANA_ID, &reg);
-	dev_dbg(emu->card->dev, "reg2 =3D 0x%x\n", reg);
-	if ((reg & 0x3f) =3D=3D 0x15) {
-		/* FPGA failed to return to programming mode */
-		dev_info(emu->card->dev,
-			 "emu1010: FPGA failed to return to programming mode\n");
-		return -ENODEV;
-	}
-	dev_info(emu->card->dev, "emu1010: EMU_HANA_ID =3D 0x%x\n", reg);
-
+	dev_info(emu->card->dev, "emu1010: Loading Hana Firmware\n");
+	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
+			       EMU_HANA_FPGA_CONFIG_HANA);
 	err =3D snd_emu1010_load_firmware(emu, 0, &emu->firmware);
 	if (err < 0) {
 		dev_info(emu->card->dev, "emu1010: Loading Firmware failed\n");
--=20
2.44.0.701.g2cf7baacf3.dirty

