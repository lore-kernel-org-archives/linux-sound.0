Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0B63D3B3
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732442; cv=none; b=YN1ypC0jngJEELwTMHnXxpxnTZO+gbl2gPNi/IXPItWS2ysost+rHMK9BAraT2b5Olpgn9LDuSaS6TOGRGqhWdmABNU3v+eSQs9wP04uCDumdfaPlK4qKU8LAnpQg1xB58E19/0fKlksGKrjTv/ZL5fRT/PDpeXLUwVEd6atd1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732442; c=relaxed/simple;
	bh=FZlUkxsA3h9RSUCax5XbxtSOrOZFere+WoEZUnYq60g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDFSIFI/8Xt35JeP6EDoN2HyYu6FtC2yqm4E5XaPDqZDg4Fv/spXtohq2Toub5nlgG/my7/raboLTnY1S/Fk5Y/TCKle14fPhuEj7UZ3QwwRTkfF6KKQxhf4jgfJ4DH+yViCrmpg51CSjvaOSontMEFjfwWTXllNjg7gqioS7QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=bcoLUhD2; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="bcoLUhD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=oZeTDnMRPB8enV0FVGxnayR+kaCJpbjx5s1efV04cw8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bcoLUhD2qeLcAzWAPGv0YwrM/2oZnUOE30Qmw18Vcge0favI7xnqVKBajG5RFZVb
	 SY8AXfkjpjK8xcmt9umFl/GWGv990YhK6UYxnaU5nTLX+83O7uYODbE99QVvVlqJN
	 ay+VEgbyWiGHMZ5XwcTKuZRgMMt8Qy6HHeBwgVcZIfjZveX4KJK+VqI60thrmDfnb
	 ywQB8ynBkqGvAfBRYZZu8l+PkbjI5mx3Mos4a0/49LksKLXM3Mg+QXz9hHGiCSP7K
	 eDRDh6ixcNyxHA699EVvXAXMJzh8CViaxXwggfbI/LN91sJfsvX4kuKRjcnerTLo2
	 syzm4YWHyU4VJf2/BA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9X9-1rpXHp23wP-0097Vq; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RAq-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 07/10] ALSA: emu10k1: make snd_emu1010_load_firmware_entry() void
Date: Sun, 21 Apr 2024 22:47:04 +0200
Message-ID: <20240421204707.2487686-8-oswald.buddenhagen@gmx.de>
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
X-Provags-ID: V03:K1:NLJVrrWZr7uYsGMh5YdyEp67iqZioYRCOiXGoil1QtqCMoBN55D
 ZkuJ/Ejo46rn/5IXaY8sMPyOTqkm76D31uT6vb5YZhkF1heFSDiyPwM/rKEjMEdEIZdVbND
 innf9NU0DEy3pk1HydjuBbA86EcaM56ZSB/Pjx8AdbOATc96Py4zLloLxF3dB4ZxvUint8H
 TP6BuUyxUwEAJepcJ+5CA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TCepPdW9v1g=;AtUl5Vv+/TFIf8oVel57dAdvw5C
 M70YhLkqi36pVxA1Z5+TUlFw6eIt3u5Am7uFN9YVxeOa2HGbPkFIGli2tyDuq9dfsAyw/5SC7
 1Wlq/8bWYxok3BawqZzDaos+NcIoY4TyPQ/adG4HlCUKBNAWyAvTIMobe/K0wzqeMOxkB250q
 Utjkz3uk9aD6BwJHMaLtlI/n1NY/JJ9+O6u3OVZzCWZrbzkcaX3OUGb6lTOtGt3hqnb8SdIwK
 LW141sz390BRdHduR+snsakiV4wqPz7cPM4+tuRmi/G3A1jewGq7fcoaD5YnSnS2h14MVgY4j
 a+o6ajbCDQ36Otghxq6uNyhzbS1PiIh4UHCwKXgM0A9bn1qv+5BhnlDJFcyWQ8CuFTR2QAxok
 NHec6/wl/pNl2LUV5cx8JNkyViPK20isR9WJAZmtmApR6no97iXSuGQdXDiQEHFzRdz0SwXDi
 SCLiD3wh67MeKsriVUl4TwLbXLYsHgmR9mL308/QGSITPpFUC3KdbbMh+VZBjpA44K+pfCsTR
 OFgrpd7DANi8eQlsjU7B7V5IqN4rYmPmJ0JpfdSnM5sTFEhh/q8GBGjYmh0za3HyFuDXKbc/i
 Yeaf2S7/AHF3+28uWsP9SxIcfJ09RbyYGty+5Dmo3ltAYCdN/xQnP5VWeHO3gG+sy0gQOX3Pa
 PV9JTuNV2NzTTEp8hVgS9V+7hTUV4GEHcboDdU62ZXKDbJk/thlAgmnjH+O8nHWTh8xQG/xlb
 gkE6OWgM5dnu7R1izdnWmrqcMAicG4ZJWpHyZASrkX0guq75qf5pg3a9FkLRDVP5j2N+vb04g
 PCN6uT+SA2f7eh+UWOqskVYBA/TYEh/+vBVWxVAso6WTo=

There is only one call site, and there we already know that we actually
have a firmware.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index 353dd3b61c61..ec010971a220 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -652,17 +652,14 @@ static int snd_emu10k1_cardbus_init(struct snd_emu10k=
1 *emu)
 	return 0;
 }
=20
-static int snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
+static void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
 				     const struct firmware *fw_entry)
 {
 	int n, i;
 	u16 reg;
 	u8 value;
 	__always_unused u16 write_post;
=20
-	if (!fw_entry)
-		return -EIO;
-
 	/* The FPGA is a Xilinx Spartan IIE XC2S50E */
 	/* On E-MU 0404b it is a Xilinx Spartan III XC3S50 */
 	/* GPIO7 -> FPGA PGMN
@@ -694,8 +691,6 @@ static int snd_emu1010_load_firmware_entry(struct snd_e=
mu10k1 *emu,
 	outw(0x10, emu->port + A_GPIO);
 	write_post =3D inw(emu->port + A_GPIO);
 	spin_unlock_irq(&emu->emu_lock);
-
-	return 0;
 }
=20
 /* firmware file names, per model, init-fw and dock-fw (optional) */
@@ -729,7 +724,8 @@ static int snd_emu1010_load_firmware(struct snd_emu10k1=
 *emu, int dock,
 			return err;
 	}
=20
-	return snd_emu1010_load_firmware_entry(emu, *fw);
+	snd_emu1010_load_firmware_entry(emu, *fw);
+	return 0;
 }
=20
 static void snd_emu1010_load_dock_firmware(struct snd_emu10k1 *emu)
--=20
2.44.0.701.g2cf7baacf3.dirty

