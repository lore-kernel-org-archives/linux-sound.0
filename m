Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3623AD
	for <linux-sound@vger.kernel.org>; Sun, 18 Aug 2024 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723995031; cv=none; b=OzOw7wyiY6h5HciRUvlOnJkRbC28ywU3qYdisve53W7bGrOaZqyKdEtAbida/sKbxzAUaDHHJKwyfQMuslKSmkiQ0NkhzsHTD+c4eP4vURRGkzPZsgisjXqj29zjk9xAlQ5TfP3FMb8bd/xhzEuWGFrEzgg7i/aVbDY1Hwidvzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723995031; c=relaxed/simple;
	bh=KjQXCQuo2/SVZ5/oAr1OKXDgQptBYfkpv9lqixbmAaU=;
	h=Content-Type:Content-Disposition:MIME-Version:From:To:CC:Subject:
	 Date:Message-Id; b=FtRMCndkY+LfOutNpGKafHl3sHL8nCRxVTt2bYrs+jRvbOciS8229AD7nFTZ9vw0HtU3Zaro0FM+nh64IClp/5NczvacQ6EDlgqNF8OTlNNmmB6Cp8LnXXDr6pH6hInKdxAdoSUQHkxClQQIgRfMd3AIHEDQWvBC5Mii/0fAmk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=rcs+HSNO; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="rcs+HSNO"
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <john.sweeney@runbox.com>)
	id 1sfhrE-009S4b-6o
	for linux-sound@vger.kernel.org; Sun, 18 Aug 2024 17:30:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Message-Id:Date:Subject:CC:To:From:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=1uQw0P5+5IuIbhWEFk+Uv9xReAog1P8tz6grrB7PJKM=; b=rcs+HSNOoqr5CuLsiFwMTTOe/0
	m/w8K3e79NnhwAlOIp6Tvh5upDbi/Y5hcraMfXQLl4DPAtsGTBtPxY7rwG6S38Cz2+zKg3U39nJhR
	lVrj2LhJev2OFM1bgcf3NEgbVhqNERWR8unFDRzYj5QKzjICq5KzwlncQpPdf+QoIS9RzMQbg6Uf4
	LzT/X+LgKIUFYjPHHrvxoH+fy/nd7STw37ZvKBC+GxogbqvG/gGntQg86gEYAcgNtC6KeDLvH0ywq
	5IxE9RUIpnAwE4eCLfcO3Z6MEaE3FhPRCcrxhv7VWy3txDNzgy2QSjmSowc5X/6vBBu2dJROGwzIj
	5D5lDLWA==;
Received: from [10.9.9.127] (helo=rmmprod05.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <john.sweeney@runbox.com>)
	id 1sfhrD-0001Tj-IZ; Sun, 18 Aug 2024 17:30:15 +0200
Received: from mail by rmmprod05.runbox with local (Exim 4.86_2)
	(envelope-from <john.sweeney@runbox.com>)
	id 1sfhrD-0007TA-HC; Sun, 18 Aug 2024 17:30:15 +0200
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from [Authenticated alias (737163)] by runbox.com with http
 (RMM6); Sun, 18 Aug 2024 15:30:15 GMT
From: "John Sweeney" <john.sweeney@runbox.com>
To: "linux-sound" <linux-sound@vger.kernel.org>
CC: "tiwai" <tiwai@suse.com>, "perex" <perex@perex.cz>
Subject: PATCH [1/1] ALSA: hda/realtek: Enable mute/micmute LEDs on HP
 Laptop 14-ey0xxx
Date: Sun, 18 Aug 2024 11:30:15 -0400 (EDT)
X-RMM-Aliasid: 737163
X-Mailer: RMM6
Message-Id: <E1sfhrD-0007TA-HC@rmmprod05.runbox>

From: John Sweeney <john.sweeney@runbox.com>

ALSA: hda/realtek: Enable mute/micmute LEDs on HP Laptop 14-ey0xxx

HP Pavilion Plus 14-ey0xxx needs existing quirk
ALC245_FIXUP_HP_X360_MUTE_LEDS to enable its mute/micmute LEDs.

Signed-off-by: John Sweeney <john.sweeney@runbox.com>
---
base-commit 1fb918967b56df3262ee984175816f0acb310501 (HEAD -> master, origi=
n/master, origin/HEAD)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 480e82df7a4c..c8abd830561c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10228,6 +10228,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[=
] =3D {
 	SND_PCI_QUIRK(0x103c, 0x8c15, "HP Spectre x360 2-in-1 Laptop 14-eu0xxx", =
ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2=
),
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2=
),
+	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245=
_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L4=
1_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L4=
1_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c48, "HP EliteBook 860 G11", ALC245_FIXUP_CS35L4=
1_SPI_2_HP_GPIO_LED),=
