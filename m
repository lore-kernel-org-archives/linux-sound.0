Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08EDE56C
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297047; cv=none; b=TLjEHxy5gKJ+L+IMSAfW5Ld1EEZY+imfO3QTgpkSHCdgbrvMIJP014BdvcwY5TfyGUT1al7KaEnR90g7iEu0+MXzHA2Reqck/wjBtSutqlZKmJREj0Uzl+qCpkyn0W+n5DB4vJHLd8YP2HO/kvQGdAt2ypx4PvLTwJkZpYHTRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297047; c=relaxed/simple;
	bh=FZlUkxsA3h9RSUCax5XbxtSOrOZFere+WoEZUnYq60g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDIxdT2AKlvCQqa2gpIMy2eiHGim75/tko2jeSa5/JNJ4dLO0Q1LJzoE1EeAoIXH2m3GcjLCi5xi4IHL4Ww6qBM28g+27R1jryT+6rxKMY2NIw8pxM2rfkrTxzTiU4w5lHtxEeFiOTPg6PB8Jh8tQ4mjPSrrdUXP3FXrjYhJK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=SGhgVoYT; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="SGhgVoYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297038; x=1714901838;
	i=oswald.buddenhagen@gmx.de;
	bh=oZeTDnMRPB8enV0FVGxnayR+kaCJpbjx5s1efV04cw8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SGhgVoYTsLho4mHOpr8fotwVV0EGEoO6PlzNL6XSRIEtLa0MRmNGGAMh/WiwpcSS
	 JrQusPaPxBTm2/vihraP6+SA8KGEXtzBbSxiWGyczHaLPFyZmqVvv7EhrdtmlxWj1
	 rrBisGJfFbf2oWq9MzvMrADwR1aS5Ou5NMXy55eGhGeezhkYDbi9SrU82Ukppl+lM
	 p3gSF8Rm19rCfTNXnDxNEPgtw6GN+eUqvFzBKchTEESFKfiOcswAEtc4q/33D2dvv
	 JWy6awLqP7L/3n9G/qqUBrsdsYnsaDhN1dEg5NdouQ5lGg2I/57Git/M+MJhRcDE4
	 LJey4yII8zNB2xFmeg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGyxX-1rwMPt1oUl-00E9Bo; Sun, 28
 Apr 2024 11:37:18 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yD-Q8v-00; Sun, 28 Apr 2024 11:37:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 2/4] ALSA: emu10k1: make snd_emu1010_load_firmware_entry() void
Date: Sun, 28 Apr 2024 11:37:15 +0200
Message-ID: <20240428093717.3198716-3-oswald.buddenhagen@gmx.de>
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
X-Provags-ID: V03:K1:R9s5UgxdC6tTqxbO8ZqROgkw3e4OE6DUUv5C9V8bvp/ULVoRtFb
 7yHNEG4SqIrD+E39b+N0/mkOi0t6yJV1LpCFRXbYr2FAK9FKxSWGQbwJHTHge/YrO3ulpar
 5BlN913U3fecgHVQVrgJfXZmBjMZ6CHXyUx/K1PQWgTUtwmdukBRz9a7dJ135kONDyVBQ8L
 IO5nmvAjgt7+DAl7bI25w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ra9LuY7vVxI=;qcSKbtkAsiNFSFzV0rXzX2jYCE+
 XbG3l4O6QHjYkMVAnV2XXqaFvoP74l5RjHV4FqZT4dT237AseJkIRlU5R0FCJRtvJ+mRtVyKC
 xdnQhYFzV2hZ31USK74bxsJHYMRpkVapgBslH6yH1MdpVEfKsWP1/YHD9sG7XRVPhaRH/nW1u
 D2dWxNIgkf9Ix7uoQW9ZCOuvq3QOT+2QSG8AjlFwA+sESbw0eGZNW963twNr1I0pOVcVcapy4
 TyoFHzsbGlEfxihO9Ow+Gtdt2BtSxhe6QNZbkUoRU7tZshFPpxfy46TaTHwJ99m3nd2Mnd1DY
 /oOx5l77VM0fipP4UZeU58ieo+oJlh3g3ml/BwL3JyuYOsWEB8uCmtB7LB7AXKTY90qzlKDbP
 cc0yQLKpBRrh8orts+FicbdMN03Aif/zm+5uFnuMYSVWt50VL6dJs13Ik56WU4fGkIAeew3XB
 iuRpfFpNkheBk6IBkFU8HOBMEUQFMTY/nTVzELnx9VofpEMFPtGtj5m1YnI5Z5ZQDkBvvi5SB
 dsiCWdUPM9prXW+Wxa5EGiefnHLWb+R7B3R3QUqocUDqv9QGOgpn5CVMNboL3NELavVsxmbFP
 /y3RCeGPc+HZjL0/bsg3WlgeRTwARQdiWuSRtkXZR4Q/TS7ozQkoVIQDh9Y7hSw47fNuqWicv
 zVL6R8JDYyMAtXyly0oaPJxcLmb0WTWNroE4Vmt77sRJFlJ7YRpIP9YGJPQxQwyF0YJE5D5Ef
 IxOm4QzalScO7HGTsYNXSzF5sOIYsJMF4tyAxPx651zuZviHNcytaz5CcnoLhkOpo86LPMYT5
 /lBtsMN0JSDmXZS2Z6ed82mz8cioKlvfBZJw/UL3JfMQA=

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

