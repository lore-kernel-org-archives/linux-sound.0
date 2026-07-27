Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E63DDDDD
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143972; cv=none; b=e6nKEiu1Iz6Ogj54by/DED9moVt00SF98vJQsYOQRrlP7uBru44pBq3l6FZfS8Icn5sMz31chwOkxXQ05nS/vZjs/hclK8FlbqZoemmERoHQm4EUmqni6hlCbTNW3hzCum641l79nyfMnZ1bTYnS5Epu/WDHmDCPD/jVvpnNfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143972; c=relaxed/simple;
	bh=29SLJtFWgu7ALvVIFmqVM7ytQf5DvPxBKfa1ZnVerIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t90n+nNzJHXqk3IQGWIhU7CFCAokhQv2zNUqkUBdjXXEd7k+gF3lHW/CG2CS2PLgjJMKU6nH+3/OuRj0tkTwBWe7Wat9mkXQuPkdRkx9i+K1PjakOZSNpnlfPc8x267iAtZJ9j0PWdQ6JmZHLFPgZqhuX5gqm4gdKutIiHPsXLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=RV07lMUp; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="RV07lMUp"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C307C240101
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 11:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1785143961;
	bh=e02G+UAzxZHsnCyPekSkBZLHCHZCED+tLQmm8H77/Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=RV07lMUpQe6n4ueYIA1pfiIKhehTmpJ0FF1ttNHdH1toAfUYV0mUq2OE14Y4z5xKo
	 0KORuaxbVO62x/NFuHoVZ6UGs2cCmAN/e0IlYexKHWLiaImAn7eUK/I87ub+qRKCi7
	 uP5cbbO5W7pTa9B1couA4CUrw0kcA0U1Ihcqbdow5A2WYHOf94mr5ktAJZN8BSx2hJ
	 RUtSUJUN4W9ubpx0iNv//ufCG4uDcxVz6fi6aMOAOucWezTxWALgU11K434uAEj4U1
	 QLDxZXKcaxFOInWQgC8GC1P3llXJ3PcF4LGKhjd+iPrW5lFM6pTa85HrYaxEuBioPt
	 8BFWvaQ2prkOw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4h7tMY1ztQz9rxF;
	Mon, 27 Jul 2026 11:19:21 +0200 (CEST)
From: Michael Diesen <michael.diesen@posteo.de>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for HP Dragonfly Folio G3 2-in-1 (103c:8a05)
Date: Mon, 27 Jul 2026 09:19:21 +0000
Message-ID: <20260727091920.4634-1-michael.diesen@posteo.de>
In-Reply-To: <874ii84j3p.wl-tiwai@suse.de>
References: <874ii84j3p.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Dragonfly Folio G3 2-in-1 also ships with PCI SSID 103c:8a05.
On this unit the ALC245 codec reports subsystem id 103c:8a06 - the SSID
that is already covered by commit 0a10faad5ca5 ("ALSA: hda/realtek: add
quirk for HP Dragonfly Folio G3 2-in-1") - while the PCI SSID that
SND_PCI_QUIRK matches against is 103c:8a05:

  snd_hda_codec_alc269 ehdaudio0D0: ALC245: picked fixup for PCI SSID 103c:8a05
  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 103C8A06

The existing entry therefore never applies here, the four CS35L41
amplifiers on SPI are not registered and the internal speakers stay
silent.

Add the same fixup that the 8a06 entry uses: the four amplifiers bind
and the speaker mute LED (codec GPIO 0x04) works.

Signed-off-by: Michael Diesen <michael.diesen@posteo.de>
---
v2:
 - Resend using git send-email. v1 was mangled by my mail client (tabs
   converted to spaces, long context lines soft-wrapped) so it could not
   be applied with git am. Sorry for the noise, and thanks for the
   pointer - I tested this one by mailing it to myself and applying it
   with git am before sending.
 - Use ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED instead of plain
   ALC245_FIXUP_CS35L41_SPI_4. In v1 I claimed this was a non-2-in-1 SKU
   that does not need the LED handling. That was wrong: DMI reports the
   machine as "HP Dragonfly Folio G3 2-in-1", i.e. the same model as the
   8a06 entry, and the speaker mute LED stayed dark with plain SPI_4.
 - Name the entry identically to the 8a06 one, as it is the same machine
   with a different PCI SSID.

On the mic-mute LED: alc285_fixup_hp_gpio_led() also drives GPIO 0x01 as
mic-mute LED. That LED does not respond on this unit. Poking the codec
GPIOs directly with hda-verb shows 0x04 toggling the speaker mute LED,
while neither 0x01 nor 0x02 has any effect, so the mic-mute LED does not
appear to be wired to the codec here. It does not work without the quirk
either, so this is no regression, and it matches what the 8a06 entry
already does - hence I kept the shared fixup instead of adding a new one.

 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b22564f..ec6724e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7160,6 +7160,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a05, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a1b, "HP 255 15.6 inch G9 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
-- 
2.54.0

