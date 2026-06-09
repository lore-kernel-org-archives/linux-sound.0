Received: from mail.furst.blue (mail.furst.blue [194.164.54.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D470F331EC2
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 20:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.164.54.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035316; cv=none; b=LGyS07B7A5WUg4sPSkAbXv6JuxkScHyzo7i3iub5Lq3DT5daMdpAYo5NcAePKVvGWBZwXo2ce8ZVECVbAcozYpcGp9uSXDkKuYE6wev7Xw4+KRYj73M2oo6HqI9KgDNcZJHPS51UtwaNcGAK2X07A4AXfUfM4+k+QNoK9IoiJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035316; c=relaxed/simple;
	bh=0Hg4tPCMfrugvni1af4f972jkXP4g2mgFqjoxlPaLRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCHwQoVSICKBvEJx9loosV6BCZcZXrCjp0tT5lLPaHS/Y5h9A5kscZIg+Y8JXyE/UYqHTcTEnDQcZlt7jcCPLHGID7r4qvsUDO8Pos5sfHDBCMLi3mAEW2RjL0vY2g8MqozahDbfhUZ0/rnV/rvAEfBtiHoMWt+4WgSztZvUbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=furst.blue; spf=pass smtp.mailfrom=furst.blue; dkim=permerror (0-bit key) header.d=furst.blue header.i=@furst.blue header.b=xcO99m2B; dkim=pass (2048-bit key) header.d=furst.blue header.i=@furst.blue header.b=l0MA9QZA; arc=none smtp.client-ip=194.164.54.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=furst.blue
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=furst.blue
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=furst.blue header.i=@furst.blue header.b="xcO99m2B";
	dkim=pass (2048-bit key) header.d=furst.blue header.i=@furst.blue header.b="l0MA9QZA"
Received: from k8s-mail.magi.furst.blue (unknown [192.168.208.120])
	by mail.furst.blue (Postfix) with ESMTPS id 8D28B40100;
	Tue,  9 Jun 2026 19:55:05 +0000 (UTC)
From: furstblumier <seal@furst.blue>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=furst.blue;
	s=dkim-ed25519; t=1781034905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMIcxGQxFH2zTRQLBBx52uh5KCOcwTjhjoGXdk5q/1s=;
	b=xcO99m2BrzQAmmxU43aR/fb6376GwAnT5bjQ90Q7gupjnzkiYosH+3fD84zweaY7D8v7sg
	tEuqyuOke/3bCWBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=furst.blue; s=dkim-rsa;
	t=1781034905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMIcxGQxFH2zTRQLBBx52uh5KCOcwTjhjoGXdk5q/1s=;
	b=l0MA9QZAkp5Vot7Q1M4LowoUPssMCrcQH+lwTyuJsqs65wutQX5m7YgCl2NwoU4Ag548/q
	umYf5EQQMLqql1rursR+WlS3Iab/c3q8vCQJkEso5GmosvbvbDv6u46r9xmRPlkOp11Jw8
	sMIHl4XPdEVSWfWNYccnL3T/6hoSwb37yt6LrNiie9Xt4rTDVsV+oXvnIKQkzy9hq/n0sM
	0uKEFUFRILUIg/LTcN5Ax4I8kxvVQI56z48rVQPCdQNZAJTMubYP59PQPMLVA2P2NDmvRv
	LZyz+zZDpUzTxCnbwxnJLeKKjMEC5am3M7ZoToMuFHq28rwD0WG14cmpPypxXQ==
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	furstblumier <seal@furst.blue>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP 255 15.6 inch G9 Notebook PC
Date: Tue,  9 Jun 2026 21:54:43 +0200
Message-ID: <20260609195443.498879-1-seal@furst.blue>
In-Reply-To: <20260507202754.16114-1-seal@furst.blue>
References: <20260507202754.16114-1-seal@furst.blue>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP 255 15.6 inch G9 Notebook PC (PCI SSID 103c:8a1b) uses the
ALC236 codec but lacks an entry in the quirk table, causing the kernel
to fall back to a null SSID match (103c:0000) and skip the necessary
fixup. Add a quirk entry using ALC236_FIXUP_HP_MUTE_LED_COEFBIT2,
matching the HP 255 G8 which uses the same codec and fixup. This fixes
the mute-button LED and fixes an issue with unplugging and replugging a
headset jack not being recognized as an audio sink.

Signed-off-by: Furst Blumier <seal@furst.blue>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 11d0ea8ed..08c8b17b7 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7063,6 +7063,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a1b, "HP 255 15.6 inch G9 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a1f, "HP Laptop 14s-dr5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
-- 
2.54.0

